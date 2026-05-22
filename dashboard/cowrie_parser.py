import json

LOG_FILE = "/home/narie/cowrie/var/log/cowrie/cowrie.json"

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
                        "time": data.get("timestamp", "-"),
                        "ip": data.get("src_ip"),
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
