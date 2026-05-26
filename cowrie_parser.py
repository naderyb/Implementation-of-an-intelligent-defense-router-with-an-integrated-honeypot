import json
from datetime import datetime, timezone, timedelta
from cache import real_ip_cache, cache_lock
import cache

LOG_FILE = "/home/narie/cowrie/var/log/cowrie/cowrie.json"

def get_real_ip(fallback):
    with cache.latest_real_ip_lock:
        #check +-5 sec window
        if cache.latest_real_ip:
            return cache.latest_real_ip

    return fallback

def read_cowrie_logs():
    attacks = []
    try:
        with open(LOG_FILE) as f:
            for line in f:
                line = line.strip()
                if not line:
                    continue
                try:
                    data = json.loads(line)
                except json.JSONDecodeError:
                    continue
                event = data.get("eventid")
                if event in [
                    "cowrie.login.failed",
                    "cowrie.login.success",
                    "cowrie.command.input"
                ]:
                    attacks.append({
                        "time": (datetime.fromisoformat(data.get("timestamp","").replace("Z","+00:00")) + timedelta(hours=1)).strftime("%Y-%m-%dT%H:%M:%S") if data.get("timestamp") else "-",
                        "ip": get_real_ip(data.get("src_ip")),
                        "username": data.get("username", "-"),
                        "password": data.get("password", "-"),
                        "command": data.get("input", "-"),
                        "event": event,
                        "source": "cowrie",
                        "request": "-"
                    })
    except Exception as e:
        print("COWRIE LOG ERROR: ", e)
    return attacks[::-1]
