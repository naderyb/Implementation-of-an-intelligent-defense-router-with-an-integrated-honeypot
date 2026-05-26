import re

LOG_FILE = "/var/log/apache2/access.log"

# attack patterns
sqli_patterns = ["'", "OR", "UNION", "--"]
sensitive_paths = [".git", "config", "database", ".db"]

def classify(line):
	if "POST" in line and "login.php" in line:
		return "LOGIN"

	if any(p.lower() in line.lower() for p in sqli_patterns):
		return "SQLi"

	if any(p in line for p in sensitive_paths):
		if ".db" in line:
			return "DATA_EXFILE"
		return "RECON"
	return "NORMAL"

def parse_line(line):
	parts = line.split(" ")
	ip = parts[0]
	time = parts[3][1:]
	request = " ".join(parts[5:8]).replace("'",'')
	event = classify(line)
	return{
	"ip": ip,
	"time": time,
	"event": event,
	"request": request,
	"source": "DVWA"
	}

def read_logs():
	result = []
	with open(LOG_FILE, "r") as f:
		for line in f:
			data = parse_line(line)
			if data["event"] != "NORMAL":
				result.append(data)
	return result
