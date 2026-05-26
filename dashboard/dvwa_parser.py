import re
import dashboard.cache as cache
from datetime import datetime, timedelta

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
	raw_time = parts[3][1:]
	request = " ".join(parts[5:8]).replace("'",'')
	event = classify(line)
	try:
		dt = datetime.strptime(raw_time, "%d/%b/%Y:%H:%M:%S")
		time = (dt + timedelta(hours=1)).strftime("%Y-%m-%dT%H:%M:%S")
	except:
		time = raw_time
	return{
	"ip": cache.latest_real_ip if cache.latest_real_ip else ip,
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
