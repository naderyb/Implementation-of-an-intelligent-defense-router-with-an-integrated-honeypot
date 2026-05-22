from flask import Flask, render_template, send_file, jsonify
from cowrie_parser import read_cowrie_logs
from dvwa_parser import read_logs as read_dvwa
import io, json, csv, os

app = Flask(__name__)

@app.route("/")
def dashboard():
    dvwa_logs = read_dvwa()
    cowrie_logs = read_cowrie_logs()
    all_logs = dvwa_logs + cowrie_logs
    all_logs.sort(key=lambda x: x["time"], reverse=True)
    return render_template("dashboard.html", logs=all_logs)

@app.route("/api/logs")
def api_logs():
    dvwa_logs = read_dvwa()
    cowrie_logs = read_cowrie_logs()
    all_logs = dvwa_logs + cowrie_logs
    all_logs.sort(key=lambda x: x["time"], reverse=True)
    return jsonify(all_logs)

@app.route("/export")
def export_csv():
    dvwa_logs = read_dvwa()
    cowrie_logs = read_cowrie_logs()
    all_logs = dvwa_logs + cowrie_logs
    all_logs.sort(key=lambda x: x["time"], reverse=True)
    fieldnames = ["time", "ip", "event", "source", "username", "password", "command", "request"]
    output = io.StringIO()
    writer = csv.DictWriter(output, fieldnames, extrasaction="ignore")
    writer.writeheader()
    writer.writerows(all_logs)
    output.seek(0)
    return send_file(
        io.BytesIO(output.getvalue().encode()),
        mimetype="text/csv",
        as_attachment=True,
        download_name="logs_export.csv"
    )

@app.route("/flush/cowrie", methods=["POST"])
def flush_cowrie():
    try:
        path = "/home/narie/cowrie/var/log/cowrie/cowrie.json"
        open(path, "w").close()
        return jsonify({"status": "ok", "message": "Cowrie logs flushed"})
    except Exception as e:
        return jsonify({"status": "error", "message": str(e)}), 500

@app.route("/flush/dvwa", methods=["POST"])
def flush_dvwa():
    try:
        with open  ("/var/log/apache2/access.log", "w") as f:
            f.write("")
        return jsonify({"status": "ok", "message": "DVWA logs flushed"})
    except Exception as e:
        return jsonify({"status": "error", "message": str(e)}), 500

app.run(host="0.0.0.0", port=5000, debug=False)
