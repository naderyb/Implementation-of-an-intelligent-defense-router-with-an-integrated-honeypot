import subprocess
import pickle
import time
import json
import threading
import socket
import netifaces
from scapy.all import sniff, IP, TCP, Raw

# detect WAN interface and IP dynamically
def get_wan_iface():
    gateways = netifaces.gateways()
    default_iface = gateways['default'][netifaces.AF_INET][1]
    return default_iface

def get_wan_ip(iface):
    addrs = netifaces.ifaddresses(iface)
    return addrs[netifaces.AF_INET][0]['addr']

WAN_IFACE  = get_wan_iface()
ROUTER_WAN = get_wan_ip(WAN_IFACE)

# static Config
HONEYPOT_IP  = "192.168.10.20"
ROUTER_LAN   = "192.168.10.1"
COWRIE_PORT  = 2222
DVWA_PORT    = 80
def setup_default_forwarding():
	print("[*]csetting up default forwarding rules...")

	#enable IP forwarding
	subprocess.run(["sudo", "sysctl", "-w", "net.ipv4.ip_forward=1"])

	#flush old NAT rules
	subprocess.run(["sudo", "iptables", "-t", "nat", "-F"])
	subprocess.run(["sudo", "iptables", "-F","FORWARD"])

	#default: forward port 80 -> DVWA
	subprocess.run([
	"sudo", "iptables","-t", "nat", "-A", "PREROUTING",
	"-p", "tcp","--dport", "80",
	"-j", "DNAT", "--to-destination", f"{HONEYPOT_IP}:80"
	])

	#default: forward port 22 -> COWRIE
	subprocess.run([
	"sudo", "iptables","-t", "nat", "-A", "PREROUTING",
	"-p", "tcp","--dport", "22",
	"-j", "DNAT", "--to-destination", f"{HONEYPOT_IP}:2222"
	])

	#allow forwarding
	subprocess.run([
	"sudo", "iptables", "-A", "FORWARD",
	"-d", HONEYPOT_IP,"-j", "ACCEPT"
	])

	#masquerade (so the honeypot can reply back!!)
	subprocess.run([ "sudo", "iptables", "-t", "nat", "-A", "POSTROUTING", "-d", HONEYPOT_IP,"-j", "SNAT", "--to-source", ROUTER_LAN])
	subprocess.run([ "sudo", "iptables", "-t", "nat", "-I", "PREROUTING","1", "-p", "tcp", "--dport", "22", "-j", "LOG", "--log-prefix", "COWRIE_ORIG: ", "--log-level", "4"])
	print("[*] default forwarding rules set successfully!!!")

# load AI Model
print("[*] Loading AI model...")
with open('/home/narie/ai/model/model.pkl', 'rb') as f:
    model = pickle.load(f)
with open('/home/narie/ai/model/vectorizer.pkl', 'rb') as f:
    vectorizer = pickle.load(f)
print("[*] Model loaded successfully!")

# Honeypot Decision Map
HONEYPOT_MAP = {
    'SQLI-DVWA':             {'port': DVWA_PORT,   'name': 'DVWA',   'reason': 'SQL Injection detected'},
    'CMD_INJECTION-DVWA':    {'port': DVWA_PORT,   'name': 'DVWA',   'reason': 'Command injection detected'},
    'XSS-DVWA':              {'port': DVWA_PORT,   'name': 'DVWA',   'reason': 'XSS detected'},
    'BRUTE_FORCE_WEB-DVWA':  {'port': DVWA_PORT,   'name': 'DVWA',   'reason': 'Web brute force detected'},
    'BRUTE_FORCE_SSH-COWRIE':{'port': COWRIE_PORT, 'name': 'COWRIE', 'reason': 'SSH brute force detected'},
    'SSH_SUCCESS-COWRIE':    {'port': COWRIE_PORT, 'name': 'COWRIE', 'reason': 'SSH login detected'},
    'SSH_COMMAND-COWRIE':    {'port': COWRIE_PORT, 'name': 'COWRIE', 'reason': 'SSH command detected'},
    'RECON-COWRIE':          {'port': COWRIE_PORT, 'name': 'COWRIE', 'reason': 'Recon detected'},
    'RECON-DVWA':	     {'port': DVWA_PORT,   'name': 'DVWA',   'reason': 'Web recon detected'},
    'UNKNOWN-COWRIE':        {'port': COWRIE_PORT, 'name': 'COWRIE', 'reason': 'Unknown, defaulting to Cowrie'},
}

# detect wab attack from payload
def detect_web_event(payload: str):
    payload_lower = payload.lower()
    if any(p in payload_lower for p in ["select", "union", "or 1=1", "drop table", "insert into"]):
        return "SQLi"
    elif "post" in payload_lower and "login" in payload_lower:
        return "LOGIN"
    return "RECON"

# AI prediction
def predict(payload: str, src_ip: str, dst_port: int):
    if dst_port == 22:
        source = 'cowrie'
        event  = 'cowrie.login.failed'
    elif dst_port == 80:
        source = 'DVWA'
        event  = detect_web_event(payload)
    else:
        source = 'unknown'
        event  = 'unknown'

    text = (
        f"source:{source} "
        f"event:{event} "
        f"ip:{src_ip} "
        f"username:- password:- "
        f"command:- "
        f"request:{payload[:200]}"
    )

    vec        = vectorizer.transform([text])
    prediction = model.predict(vec)[0]
    confidence = model.predict_proba(vec).max() * 100

    return prediction, confidence

# apply iptables rule dynamically
def apply_iptables(src_ip: str, dst_port: int, honeypot_port: int, honeypot_name: str):
    # Remove old rule for this source IP if exists
    subprocess.run([
        "sudo", "iptables", "-t", "nat", "-D", "PREROUTING",
        "-s", src_ip,
        "-p", "tcp", "--dport", str(dst_port),
        "-j", "DNAT",
        "--to-destination", f"{HONEYPOT_IP}:{honeypot_port}"
    ], capture_output=True)

    # Add new dynamic rule
    subprocess.run([
        "sudo", "iptables", "-t", "nat", "-I", "PREROUTING", "1",
        "-s", src_ip,
        "-p", "tcp", "--dport", str(dst_port),
        "-j", "DNAT",
        "--to-destination", f"{HONEYPOT_IP}:{honeypot_port}"
    ])

    print(f"[iptables] {src_ip}:{dst_port} - {honeypot_name} ({HONEYPOT_IP}:{honeypot_port})")

# packet handler
seen_ips = {}

def handle_packet(packet):
    if not (packet.haslayer(IP) and packet.haslayer(TCP)):
        return

    src_ip   = packet[IP].src
    dst_port = packet[TCP].dport

    # only care about port 22 and 80
    if dst_port not in [22, 80]:
        return

    # skip internal IPs
    if src_ip.startswith("192.168.10.") or src_ip.startswith("10.") or src_ip == "127.0.0.1":
        return

    # extract payload if exists
    payload = ""
    if packet.haslayer(Raw):
        try:
            payload = packet[Raw].load.decode('utf-8', errors='ignore')
        except:
            payload = ""

    # avoid re-analyzing same IP too frequently (30 second cooldown)
    now = time.time()
    seen_key = f"{src_ip}:{dst_port}"
    if seen_key in seen_ips and now - seen_ips[seen_key] < 3:
        return
    seen_ips[seen_key] = now

    # run AI prediction
    prediction, confidence = predict(payload, src_ip, dst_port)
    if dst_port == 80:
        default = 'RECON-DVWA' #web attack is default to DVWA
	#using a web default instead
        decision = HONEYPOT_MAP.get(prediction, {'port': DVWA_PORT, 'name': 'DVWA', 'reason': 'web traffic defaulting to DVWA'})
    else:
        decision = HONEYPOT_MAP.get(prediction, HONEYPOT_MAP['UNKNOWN-COWRIE'])

    print(f"\n[AI] New packet from {src_ip}:{dst_port}")
    print(f"[AI] Attack:     {prediction}")
    print(f"[AI] Confidence: {confidence:.2f}%")
    print(f"[AI] Deploy:     {decision['name']}")
    print(f"[AI] Reason:     {decision['reason']}")

    # apply dynamic iptables rule
    apply_iptables(src_ip, dst_port, decision['port'], decision['name'])

def get_real_ip(masqueraded_ip):
	try:
		result = subprocess.run(
			["sudo", "dmesg"],
			capture_output=True, text=True
		)
		import re
		lines = [l for l in result.stdout.split('\n') in 'COWRIE_ORIG' in l and 'SRC=' in l]
		if lines:
			last_line = lines[-1]
			match = re.search(r'SRC=(\d+\.\d+\.\d+\.\d+)', last_line)
			if match:
				real_ip = match.group(1)
				if not real_ipstartswith("192.168.10.") and real_ip != "192/168.244.133":
					return real_ip

	except Exception as e:
		print("[hedi erreur mais t3 debug tni] "+str(e))
	return masqueraded_ip

if __name__ == "__main__":
    setup_default_forwarding() #sets up forwarding before anything else

    print("=" * 50)
    print("AI router started!")
    print(f"   WAN Interface: {WAN_IFACE}")
    print(f"   WAN IP:        {ROUTER_WAN}")
    print(f"   LAN IP:        {ROUTER_LAN}")
    print(f"   Honeypot:      {HONEYPOT_IP}")
    print(f"   Cowrie port:   {COWRIE_PORT}")
    print(f"   DVWA port:     {DVWA_PORT}")
    print("=" * 50)
    print("")

    sniff(
        iface=WAN_IFACE,
        filter="tcp and (port 22 or port 80)",
        prn=handle_packet,
        store=0
    )
