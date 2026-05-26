
  /* ── HEADER ── */
  header {
    position: relative;
    z-index: 10;
    display: flex;
    align-items: center;
    justify-content: space-between;
    padding: 18px 32px;
    border-bottom: 1px solid var(--border);
    background: rgba(13,17,23,.9);
    backdrop-filter: blur(10px);
  }

  .logo {
    display: flex;
    align-items: center;
    gap: 12px;
  }

  .logo-icon {
    width: 36px; height: 36px;
    border: 2px solid var(--accent);
    border-radius: 8px;
    display: grid;
    place-items: center;
    font-size: 18px;
    box-shadow: 0 0 12px rgba(0,212,255,.4);
  }

  .logo-text {
    font-size: 22px;
    font-weight: 700;
    letter-spacing: 3px;
    color: white;
    text-transform: uppercase;
  }

  .logo-sub {
    font-family: var(--font-mono);
    font-size: 11px;
    color: var(--accent);
    letter-spacing: 2px;
  }

  .header-right {
    display: flex;
    align-items: center;
    gap: 16px;
  }

  .live-badge {
    display: flex;
    align-items: center;
    gap: 8px;
    font-family: var(--font-mono);
    font-size: 12px;
    color: var(--green);
    letter-spacing: 1px;
  }

  .pulse {
    width: 8px; height: 8px;
    border-radius: 50%;
    background: var(--green);
    box-shadow: 0 0 8px var(--green);
    animation: pulse 1.5s infinite;
  }

  @keyframes pulse {
    0%, 100% { opacity: 1; transform: scale(1); }
    50% { opacity: .4; transform: scale(1.4); }
  }

  /* ── MAIN ── */
  main {
    position: relative;
    z-index: 1;
    padding: 28px 32px;
    max-width: 1600px;
    margin: 0 auto;
  }

  /* ── STATS CARDS ── */
  .stats {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(180px, 1fr));
    gap: 16px;
    margin-bottom: 28px;
  }

  .stat-card {
    background: var(--surface);
    border: 1px solid var(--border);
    border-radius: 10px;
    padding: 20px;
    position: relative;
    overflow: hidden;
    transition: border-color .2s;
  }

  .stat-card:hover { border-color: var(--accent); }

  .stat-card::before {
    content: '';
    position: absolute;
    top: 0; left: 0; right: 0;
    height: 2px;
  }

  .stat-card.total::before  { background: var(--accent); }
  .stat-card.cowrie::before { background: var(--green); }
  .stat-card.dvwa::before   { background: var(--orange); }
  .stat-card.ssh::before    { background: var(--purple); }
  .stat-card.web::before    { background: var(--red); }

  .stat-label {
    font-family: var(--font-mono);
    font-size: 11px;
    color: var(--muted);
    letter-spacing: 2px;
    text-transform: uppercase;
    margin-bottom: 10px;
  }

  .stat-value {
    font-size: 36px;
    font-weight: 700;
    color: white;
    line-height: 1;
    font-family: var(--font-mono);
  }

  .stat-card.total .stat-value  { color: var(--accent); }
  .stat-card.cowrie .stat-value { color: var(--green); }
  .stat-card.dvwa .stat-value   { color: var(--orange); }
  .stat-card.ssh .stat-value    { color: var(--purple); }
  .stat-card.web .stat-value    { color: var(--red); }

  /* ── CONTROLS ── */
  .controls {
    display: flex;
    align-items: center;
    gap: 12px;
    margin-bottom: 20px;
    flex-wrap: wrap;
  }

  .tab-group {
    display: flex;
    background: var(--surface);
    border: 1px solid var(--border);
    border-radius: 8px;
    overflow: hidden;
  }

  .tab {
    padding: 9px 20px;
    font-family: var(--font-ui);
    font-weight: 600;
    font-size: 13px;
    letter-spacing: 1px;
    text-transform: uppercase;
    cursor: pointer;
    border: none;
    background: transparent;
    color: var(--muted);
    transition: all .2s;
  }

  .tab:hover { color: var(--text); }

  .tab.active {
    background: var(--accent);
    color: #000;
  }

  .tab.active.cowrie-tab { background: var(--green); }
  .tab.active.dvwa-tab   { background: var(--orange); }

  .spacer { flex: 1; }

  .btn {
    padding: 9px 18px;
    border-radius: 7px;
    border: 1px solid var(--border);
    font-family: var(--font-ui);
    font-weight: 600;
    font-size: 13px;
    letter-spacing: 1px;
    text-transform: uppercase;
    cursor: pointer;
    background: var(--surface);
    color: var(--text);
    transition: all .2s;
    text-decoration: none;
    display: inline-flex;
    align-items: center;
    gap: 6px;
  }

  .btn:hover { border-color: var(--accent); color: var(--accent); }

  .btn-danger { border-color: var(--red); color: var(--red); }
  .btn-danger:hover { background: rgba(255,60,90,.1); }

  .btn-warning { border-color: var(--orange); color: var(--orange); }
  .btn-warning:hover { background: rgba(255,140,0,.1); }

  .btn-export { border-color: var(--green); color: var(--green); }
  .btn-export:hover { background: rgba(0,255,136,.1); }

  /* ── TABLE ── */
  .table-wrap {
    background: var(--surface);
    border: 1px solid var(--border);
    border-radius: 12px;
    overflow: hidden;
  }

  .table-scroll {
    overflow-x: auto;
    max-height: 65vh;
    overflow-y: auto;
  }

  /* sticky header */
  .table-scroll::-webkit-scrollbar { width: 6px; height: 6px; }
  .table-scroll::-webkit-scrollbar-track { background: var(--surface); }
  .table-scroll::-webkit-scrollbar-thumb { background: var(--border); border-radius: 3px; }

  table {
    width: 100%;
    border-collapse: collapse;
    min-width: 900px;
  }

  thead tr {
    background: #0a0f14;
    position: sticky;
    top: 0;
    z-index: 5;
  }

  th {
    padding: 14px 16px;
    text-align: left;
    font-family: var(--font-mono);
    font-size: 11px;
    letter-spacing: 2px;
    color: var(--muted);
    text-transform: uppercase;
    border-bottom: 1px solid var(--border);
    white-space: nowrap;
  }

  td {
    padding: 11px 16px;
    font-family: var(--font-mono);
    font-size: 13px;
    border-bottom: 1px solid rgba(30,45,64,.5);
    white-space: nowrap;
    max-width: 280px;
    overflow: hidden;
    text-overflow: ellipsis;
  }

  tr:last-child td { border-bottom: none; }

  tbody tr { transition: background .15s; }
  tbody tr:hover { background: rgba(0,212,255,.04); }

  /* row colors */
  tr.ev-sqli       td:first-child { border-left: 3px solid var(--red); }
  tr.ev-xss        td:first-child { border-left: 3px solid var(--purple); }
  tr.ev-cmd        td:first-child { border-left: 3px solid var(--orange); }
  tr.ev-brute      td:first-child { border-left: 3px solid var(--yellow); }
  tr.ev-success    td:first-child { border-left: 3px solid var(--green); }
  tr.ev-command    td:first-child { border-left: 3px solid var(--accent); }
  tr.ev-recon      td:first-child { border-left: 3px solid var(--muted); }

  /* badges */
  .badge {
    display: inline-block;
    padding: 3px 10px;
    border-radius: 4px;
    font-size: 11px;
    font-weight: 700;
    letter-spacing: 1px;
    text-transform: uppercase;
  }

  .badge-cowrie { background: rgba(0,255,136,.12); color: var(--green); border: 1px solid rgba(0,255,136,.3); }
  .badge-dvwa   { background: rgba(255,140,0,.12);  color: var(--orange); border: 1px solid rgba(255,140,0,.3); }

  .event-tag {
    display: inline-block;
    padding: 2px 8px;
    border-radius: 3px;
    font-size: 11px;
    font-weight: 700;
    letter-spacing: .5px;
  }

  .tag-sqli    { background: rgba(255,60,90,.15);  color: var(--red); }
  .tag-xss     { background: rgba(176,106,255,.15); color: var(--purple); }
  .tag-cmd     { background: rgba(255,140,0,.15);  color: var(--orange); }
  .tag-brute   { background: rgba(255,215,0,.15);  color: var(--yellow); }
  .tag-success { background: rgba(0,255,136,.15);  color: var(--green); }
  .tag-command { background: rgba(0,212,255,.15);  color: var(--accent); }
  .tag-recon   { background: rgba(74,98,120,.2);   color: var(--muted); }
  .tag-exfil   { background: rgba(176,106,255,.2); color: var(--purple); }

  .ip-cell { color: var(--accent); font-weight: bold; }

  .empty-state {
    text-align: center;
    padding: 60px 20px;
    color: var(--muted);
    font-family: var(--font-mono);
    font-size: 14px;
    letter-spacing: 2px;
  }

  .empty-state span { display: block; font-size: 40px; margin-bottom: 16px; }

  /* toast */
  #toast {
    position: fixed;
    bottom: 28px;
    right: 28px;
    padding: 14px 22px;
    border-radius: 8px;
    font-family: var(--font-mono);
    font-size: 13px;
    background: var(--surface);
    border: 1px solid var(--green);
    color: var(--green);
    transform: translateY(80px);
    opacity: 0;
    transition: all .3s;
    z-index: 100;
  }

  #toast.show { transform: translateY(0); opacity: 1; }
  #toast.error { border-color: var(--red); color: var(--red); }
</style>
</head>
<body>

<header>
  <div class="logo">
    <div class="logo-icon">🍯</div>
    <div>
      <div class="logo-text">HoneyNet</div>
      <div class="logo-sub">ATTACK INTELLIGENCE DASHBOARD</div>
    </div>
  </div>
  <div class="header-right">
    <div class="live-badge">
      <div class="pulse"></div>
      MONITORING ACTIVE
    </div>
  </div>
</header>

<main>
  <!-- Stats -->
  <div class="stats">
    <div class="stat-card total">
      <div class="stat-label">Total Events</div>
      <div class="stat-value" id="stat-total">{{ logs|length }}</div>
    </div>
    <div class="stat-card cowrie">
      <div class="stat-label">Cowrie Events</div>
      <div class="stat-value" id="stat-cowrie">{{ logs|selectattr('source','equalto','cowrie')|list|length }}</div>
    </div>
    <div class="stat-card dvwa">
      <div class="stat-label">DVWA Events</div>
      <div class="stat-value" id="stat-dvwa">{{ logs|selectattr('source','equalto','DVWA')|list|length }}</div>
    </div>
    <div class="stat-card ssh">
      <div class="stat-label">SSH Success</div>
      <div class="stat-value" id="stat-ssh">{{ logs|selectattr('event','equalto','cowrie.login.success')|list|length }}</div>
    </div>
    <div class="stat-card web">
      <div class="stat-label">SQLi Attacks</div>
      <div class="stat-value" id="stat-sqli">{{ logs|selectattr('event','equalto','SQLi')|list|length }}</div>
    </div>
  </div>

  <!-- Controls -->
  <div class="controls">
    <div class="tab-group">
      <button class="tab active" onclick="filterLogs('all', this)">All</button>
      <button class="tab cowrie-tab" onclick="filterLogs('cowrie', this)">🐝 Cowrie</button>
      <button class="tab dvwa-tab" onclick="filterLogs('dvwa', this)">🌐 DVWA</button>
    </div>
    <div class="spacer"></div>
    <button class="btn btn-warning" onclick="flushLogs('cowrie')">🗑 Flush Cowrie</button>
    <button class="btn btn-danger" onclick="flushLogs('dvwa')">🗑 Flush DVWA</button>
    <a class="btn btn-export" href="/export">⬇ Export CSV</a>
    <button class="btn" onclick="refreshLogs()">↻ Refresh</button>
  </div>

  <!-- Table -->
  <div class="table-wrap">
    <div class="table-scroll">
      <table id="log-table">
        <thead>
          <tr>
            <th>Time</th>
            <th>Source IP</th>
            <th>Source</th>
            <th>Event</th>
            <th>Username</th>
            <th>Password</th>
            <th>Command</th>
            <th>Request</th>
          </tr>
        </thead>
        <tbody id="log-body">
          {% if logs|length == 0 %}
          <tr><td colspan="8">
            <div class="empty-state">
              <span>🛡</span>
              NO ATTACKS DETECTED YET
            </div>
          </td></tr>
          {% endif %}
          {% for log in logs %}
          <tr class="log-row
            {% if 'SQLi' in log.event %} ev-sqli
            {% elif 'XSS' in log.event %} ev-xss
            {% elif 'CMD' in log.event or 'exec' in log.event %} ev-cmd
            {% elif 'BRUTE' in log.event or 'login.failed' in log.event %} ev-brute
            {% elif 'login.success' in log.event %} ev-success
            {% elif 'command.input' in log.event %} ev-command
            {% elif 'RECON' in log.event %} ev-recon
            {% endif %}"
            data-source="{{ log.source }}">
            <td>{{ log.time }}</td>
            <td class="ip-cell">{{ log.ip or '-' }}</td>
            <td>
              {% if log.source == 'cowrie' %}
                <span class="badge badge-cowrie">COWRIE</span>
              {% else %}
                <span class="badge badge-dvwa">DVWA</span>
              {% endif %}
            </td>
            <td>
              {% set ev = log.event %}
              {% if 'SQLi' in ev %}
                <span class="event-tag tag-sqli">SQLi</span>
              {% elif 'XSS' in ev %}
                <span class="event-tag tag-xss">XSS</span>
              {% elif 'CMD' in ev %}
                <span class="event-tag tag-cmd">CMD INJECT</span>
              {% elif 'BRUTE' in ev or 'login.failed' in ev %}
                <span class="event-tag tag-brute">BRUTE FORCE</span>
              {% elif 'login.success' in ev %}
                <span class="event-tag tag-success">SSH SUCCESS</span>
              {% elif 'command.input' in ev %}
                <span class="event-tag tag-command">SSH COMMAND</span>
              {% elif 'EXFIL' in ev %}
                <span class="event-tag tag-exfil">DATA EXFIL</span>
              {% elif 'RECON' in ev %}
                <span class="event-tag tag-recon">RECON</span>
              {% else %}
                <span class="event-tag tag-recon">{{ ev }}</span>
              {% endif %}
            </td>
            <td>{{ log.username or '-' }}</td>
            <td>{{ log.password or '-' }}</td>
            <td>{{ log.command or '-' }}</td>
            <td title="{{ log.request or '-' }}">{{ log.request or '-' }}</td>
          </tr>
          {% endfor %}
        </tbody>
      </table>
    </div>
  </div>
</main>

<div id="toast"></div>

<script>
  // Tab filter
  function filterLogs(source, btn) {
    document.querySelectorAll('.tab').forEach(t => t.classList.remove('active'));
    btn.classList.add('active');
    document.querySelectorAll('.log-row').forEach(row => {
      if (source === 'all') {
        row.style.display = '';
      } else if (source === 'cowrie') {
        row.style.display = row.dataset.source === 'cowrie' ? '' : 'none';
      } else if (source === 'dvwa') {
        row.style.display = row.dataset.source === 'DVWA' ? '' : 'none';
      }
    });
  }

  // Flush logs
  function flushLogs(target) {
    if (!confirm('Flush ' + target.toUpperCase() + ' logs?')) return;
    fetch('/flush/' + target, { method: 'POST' })
      .then(r => r.json())
      .then(d => {
        showToast(d.message, d.status === 'ok' ? 'ok' : 'error');
        setTimeout(() => location.reload(), 1200);
      })
      .catch(() => showToast('Error flushing logs', 'error'));
  }

  // Refresh
  function refreshLogs() {
    location.reload();
  }

  // Toast
  function showToast(msg, type) {
    const t = document.getElementById('toast');
    t.textContent = msg;
    t.className = 'show' + (type === 'error' ? ' error' : '');
    setTimeout(() => t.className = '', 3000);
  }

  // Auto refresh every 15 seconds
  setTimeout(() => location.reload(), 15000);
</script>
</body>
</html>






eof
EOF

CLEAR
clear
nanp dashboard.html
nano dashboard.html
cd ..
cat > app.py << 'EOF'
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
        os.system("sudo truncate -s 0 /var/log/apache2/access.log")
        return jsonify({"status": "ok", "message": "DVWA logs flushed"})
    except Exception as e:
        return jsonify({"status": "error", "message": str(e)}), 500

app.run(host="0.0.0.0", port=5000, debug=False)
EOF

CLEAR
clear
nano app.py
cat > cowrie_parser.py << 'EOF'
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
EOF

nano app.py
cat > app.py << 'EOF'
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
        os.system("sudo truncate -s 0 /var/log/apache2/access.log")
        return jsonify({"status": "ok", "message": "DVWA logs flushed"})
    except Exception as e:
        return jsonify({"status": "error", "message": str(e)}), 500

app.run(host="0.0.0.0", port=5000, debug=False)
EOF

exit
nano /honeypot-dashboard/templates.dashboard.html
ls
nano honeypot-dashboard/templates.dashboard.html
nano honeypot-dashboard/templates/dashboard.html
cat > dashboard.html << 'EOF'
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>HoneyNet — Attack Dashboard</title>
<link href="https://fonts.googleapis.com/css2?family=Share+Tech+Mono&family=Rajdhani:wght@400;600;700&display=swap" rel="stylesheet">
<style>
  :root {
    --bg:        #080c10;
    --surface:   #0d1117;
    --border:    #1e2d40;
    --accent:    #00d4ff;
    --green:     #00ff88;
    --red:       #ff3c5a;
    --orange:    #ff8c00;
    --yellow:    #ffd700;
    --purple:    #b06aff;
    --text:      #c9d8e8;
    --muted:     #4a6278;
    --font-mono: 'Share Tech Mono', monospace;
    --font-ui:   'Rajdhani', sans-serif;
  }

  * { box-sizing: border-box; margin: 0; padding: 0; }

  body {
    background: var(--bg);
    color: var(--text);
    font-family: var(--font-ui);
    font-size: 15px;
    min-height: 100vh;
    overflow-x: hidden;
  }

  body::before {
    content: '';
    position: fixed;
    inset: 0;
    background-image:
      linear-gradient(rgba(0,212,255,.03) 1px, transparent 1px),
      linear-gradient(90deg, rgba(0,212,255,.03) 1px, transparent 1px);
    background-size: 40px 40px;
    pointer-events: none;
    z-index: 0;
  }

  header {
    position: relative;
    z-index: 10;
    display: flex;
    align-items: center;
    justify-content: space-between;
    padding: 18px 32px;
    border-bottom: 1px solid var(--border);
    background: rgba(13,17,23,.9);
    backdrop-filter: blur(10px);
  }

  .logo { display: flex; align-items: center; gap: 12px; }

  .logo-icon {
    width: 36px; height: 36px;
    border: 2px solid var(--accent);
    border-radius: 8px;
    display: grid;
    place-items: center;
    font-size: 18px;
    box-shadow: 0 0 12px rgba(0,212,255,.4);
  }

  .logo-text {
    font-size: 22px;
    font-weight: 700;
    letter-spacing: 3px;
    color: white;
    text-transform: uppercase;
  }

  .logo-sub {
    font-family: var(--font-mono);
    font-size: 11px;
    color: var(--accent);
    letter-spacing: 2px;
  }

  .header-right { display: flex; align-items: center; gap: 16px; }

  .live-badge {
    display: flex;
    align-items: center;
    gap: 8px;
    font-family: var(--font-mono);
    font-size: 12px;
    color: var(--green);
    letter-spacing: 1px;
  }

  .pulse {
    width: 8px; height: 8px;
    border-radius: 50%;
    background: var(--green);
    box-shadow: 0 0 8px var(--green);
    animation: pulse 1.5s infinite;
  }

  @keyframes pulse {
    0%, 100% { opacity: 1; transform: scale(1); }
    50% { opacity: .4; transform: scale(1.4); }
  }

  .refresh-timer {
    font-family: var(--font-mono);
    font-size: 11px;
    color: var(--muted);
    letter-spacing: 1px;
  }

  main {
    position: relative;
    z-index: 1;
    padding: 28px 32px;
    max-width: 1600px;
    margin: 0 auto;
  }

  .stats {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(180px, 1fr));
    gap: 16px;
    margin-bottom: 28px;
  }

  .stat-card {
    background: var(--surface);
    border: 1px solid var(--border);
    border-radius: 10px;
    padding: 20px;
    position: relative;
    overflow: hidden;
    transition: border-color .2s, transform .2s;
  }

  .stat-card:hover { border-color: var(--accent); transform: translateY(-2px); }

  .stat-card::before {
    content: '';
    position: absolute;
    top: 0; left: 0; right: 0;
    height: 2px;
  }

  .stat-card.total::before  { background: var(--accent); }
  .stat-card.cowrie::before { background: var(--green); }
  .stat-card.dvwa::before   { background: var(--orange); }
  .stat-card.ssh::before    { background: var(--purple); }
  .stat-card.web::before    { background: var(--red); }

  .stat-label {
    font-family: var(--font-mono);
    font-size: 11px;
    color: var(--muted);
    letter-spacing: 2px;
    text-transform: uppercase;
    margin-bottom: 10px;
  }

  .stat-value {
    font-size: 36px;
    font-weight: 700;
    line-height: 1;
    font-family: var(--font-mono);
    transition: all .3s;
  }

  .stat-card.total .stat-value  { color: var(--accent); }
  .stat-card.cowrie .stat-value { color: var(--green); }
  .stat-card.dvwa .stat-value   { color: var(--orange); }
  .stat-card.ssh .stat-value    { color: var(--purple); }
  .stat-card.web .stat-value    { color: var(--red); }

  .controls {
    display: flex;
    align-items: center;
    gap: 12px;
    margin-bottom: 20px;
    flex-wrap: wrap;
  }

  .tab-group {
    display: flex;
    background: var(--surface);
    border: 1px solid var(--border);
    border-radius: 8px;
    overflow: hidden;
  }

  .tab {
    padding: 9px 20px;
    font-family: var(--font-ui);
    font-weight: 600;
    font-size: 13px;
    letter-spacing: 1px;
    text-transform: uppercase;
    cursor: pointer;
    border: none;
    background: transparent;
    color: var(--muted);
    transition: all .2s;
  }

  .tab:hover { color: var(--text); }
  .tab.active { background: var(--accent); color: #000; }
  .tab.active.cowrie-tab { background: var(--green); }
  .tab.active.dvwa-tab   { background: var(--orange); }

  .spacer { flex: 1; }

  .btn {
    padding: 9px 18px;
    border-radius: 7px;
    border: 1px solid var(--border);
    font-family: var(--font-ui);
    font-weight: 600;
    font-size: 13px;
    letter-spacing: 1px;
    text-transform: uppercase;
    cursor: pointer;
    background: var(--surface);
    color: var(--text);
    transition: all .2s;
    text-decoration: none;
    display: inline-flex;
    align-items: center;
    gap: 6px;
  }

  .btn:hover { border-color: var(--accent); color: var(--accent); }
  .btn:disabled { opacity: .4; cursor: not-allowed; }
  .btn-danger  { border-color: var(--red);    color: var(--red); }
  .btn-danger:hover  { background: rgba(255,60,90,.1); }
  .btn-warning { border-color: var(--orange); color: var(--orange); }
  .btn-warning:hover { background: rgba(255,140,0,.1); }
  .btn-export  { border-color: var(--green);  color: var(--green); }
  .btn-export:hover  { background: rgba(0,255,136,.1); }

  .table-wrap {
    background: var(--surface);
    border: 1px solid var(--border);
    border-radius: 12px;
    overflow: hidden;
  }

  .table-scroll {
    overflow-x: auto;
    max-height: 65vh;
    overflow-y: auto;
  }

  .table-scroll::-webkit-scrollbar { width: 6px; height: 6px; }
  .table-scroll::-webkit-scrollbar-track { background: var(--surface); }
  .table-scroll::-webkit-scrollbar-thumb { background: var(--border); border-radius: 3px; }

  table { width: 100%; border-collapse: collapse; min-width: 900px; }

  thead tr {
    background: #0a0f14;
    position: sticky;
    top: 0;
    z-index: 5;
  }

  th {
    padding: 14px 16px;
    text-align: left;
    font-family: var(--font-mono);
    font-size: 11px;
    letter-spacing: 2px;
    color: var(--muted);
    text-transform: uppercase;
    border-bottom: 1px solid var(--border);
    white-space: nowrap;
  }

  td {
    padding: 11px 16px;
    font-family: var(--font-mono);
    font-size: 13px;
    border-bottom: 1px solid rgba(30,45,64,.5);
    white-space: nowrap;
    max-width: 280px;
    overflow: hidden;
    text-overflow: ellipsis;
  }

  tr:last-child td { border-bottom: none; }
  tbody tr { transition: background .15s, opacity .3s; }
  tbody tr:hover { background: rgba(0,212,255,.04); }

  tr.ev-sqli    td:first-child { border-left: 3px solid var(--red); }
  tr.ev-xss     td:first-child { border-left: 3px solid var(--purple); }
  tr.ev-cmd     td:first-child { border-left: 3px solid var(--orange); }
  tr.ev-brute   td:first-child { border-left: 3px solid var(--yellow); }
  tr.ev-success td:first-child { border-left: 3px solid var(--green); }
  tr.ev-command td:first-child { border-left: 3px solid var(--accent); }
  tr.ev-recon   td:first-child { border-left: 3px solid var(--muted); }

  @keyframes fadeIn {
    from { opacity: 0; transform: translateY(-4px); }
    to   { opacity: 1; transform: translateY(0); }
  }

  tr.new-row { animation: fadeIn .4s ease forwards; }

  .badge {
    display: inline-block;
    padding: 3px 10px;
    border-radius: 4px;
    font-size: 11px;
    font-weight: 700;
    letter-spacing: 1px;
    text-transform: uppercase;
  }

  .badge-cowrie { background: rgba(0,255,136,.12); color: var(--green);  border: 1px solid rgba(0,255,136,.3); }
  .badge-dvwa   { background: rgba(255,140,0,.12);  color: var(--orange); border: 1px solid rgba(255,140,0,.3); }

  .event-tag {
    display: inline-block;
    padding: 2px 8px;
    border-radius: 3px;
    font-size: 11px;
    font-weight: 700;
    letter-spacing: .5px;
  }

  .tag-sqli    { background: rgba(255,60,90,.15);   color: var(--red); }
  .tag-xss     { background: rgba(176,106,255,.15); color: var(--purple); }
  .tag-cmd     { background: rgba(255,140,0,.15);   color: var(--orange); }
  .tag-brute   { background: rgba(255,215,0,.15);   color: var(--yellow); }
  .tag-success { background: rgba(0,255,136,.15);   color: var(--green); }
  .tag-command { background: rgba(0,212,255,.15);   color: var(--accent); }
  .tag-recon   { background: rgba(74,98,120,.2);    color: var(--muted); }
  .tag-exfil   { background: rgba(176,106,255,.2);  color: var(--purple); }

  .ip-cell { color: var(--accent); font-weight: bold; }

  .empty-state {
    text-align: center;
    padding: 60px 20px;
    color: var(--muted);
    font-family: var(--font-mono);
    font-size: 14px;
    letter-spacing: 2px;
  }

  .empty-state span { display: block; font-size: 40px; margin-bottom: 16px; }

  #toast {
    position: fixed;
    bottom: 28px;
    right: 28px;
    padding: 14px 22px;
    border-radius: 8px;
    font-family: var(--font-mono);
    font-size: 13px;
    background: var(--surface);
    border: 1px solid var(--green);
    color: var(--green);
    transform: translateY(80px);
    opacity: 0;
    transition: all .3s;
    z-index: 100;
    pointer-events: none;
  }

  #toast.show { transform: translateY(0); opacity: 1; }
  #toast.error { border-color: var(--red); color: var(--red); }
</style>
</head>
<body>

<header>
  <div class="logo">
    <div class="logo-icon">🍯</div>
    <div>
      <div class="logo-text">HoneyNet</div>
      <div class="logo-sub">ATTACK INTELLIGENCE DASHBOARD</div>
    </div>
  </div>
  <div class="header-right">
    <div class="refresh-timer" id="refresh-timer">REFRESH IN 10s</div>
    <div class="live-badge">
      <div class="pulse"></div>
      MONITORING ACTIVE
    </div>
  </div>
</header>

<main>
  <div class="stats">
    <div class="stat-card total">
      <div class="stat-label">Total Events</div>
      <div class="stat-value" id="stat-total">0</div>
    </div>
    <div class="stat-card cowrie">
      <div class="stat-label">Cowrie Events</div>
      <div class="stat-value" id="stat-cowrie">0</div>
    </div>
    <div class="stat-card dvwa">
      <div class="stat-label">DVWA Events</div>
      <div class="stat-value" id="stat-dvwa">0</div>
    </div>
    <div class="stat-card ssh">
      <div class="stat-label">SSH Success</div>
      <div class="stat-value" id="stat-ssh">0</div>
    </div>
    <div class="stat-card web">
      <div class="stat-label">SQLi Attacks</div>
      <div class="stat-value" id="stat-sqli">0</div>
    </div>
  </div>

  <div class="controls">
    <div class="tab-group">
      <button class="tab active"      onclick="setFilter('all', this)">All</button>
      <button class="tab cowrie-tab"  onclick="setFilter('cowrie', this)">🐝 Cowrie</button>
      <button class="tab dvwa-tab"    onclick="setFilter('dvwa', this)">🌐 DVWA</button>
    </div>
    <div class="spacer"></div>
    <button class="btn btn-warning" id="btn-flush-cowrie" onclick="flushLogs('cowrie')">🗑 Flush Cowrie</button>
    <button class="btn btn-danger"  id="btn-flush-dvwa"   onclick="flushLogs('dvwa')">🗑 Flush DVWA</button>
    <a class="btn btn-export" href="/export">⬇ Export CSV</a>
    <button class="btn" onclick="fetchLogs(true)">↻ Refresh</button>
  </div>

  <div class="table-wrap">
    <div class="table-scroll">
      <table>
        <thead>
          <tr>
            <th>Time</th>
            <th>Source IP</th>
            <th>Source</th>
            <th>Event</th>
            <th>Username</th>
            <th>Password</th>
            <th>Command</th>
            <th>Request</th>
          </tr>
        </thead>
        <tbody id="log-body">
          <tr><td colspan="8">
            <div class="empty-state"><span>⏳</span>LOADING...</div>
          </td></tr>
        </tbody>
      </table>
    </div>
  </div>
</main>

<div id="toast"></div>

<script>
  let currentFilter = 'all';
  let allLogs = [];
  let countdown = 10;
  let countdownInterval;

  // ── Event classifier ──
  function classifyEvent(ev) {
    if (!ev) return { cls: 'ev-recon', tag: 'tag-recon', label: ev || '-' };
    if (ev.includes('SQLi'))            return { cls: 'ev-sqli',    tag: 'tag-sqli',    label: 'SQLi' };
    if (ev.includes('XSS'))             return { cls: 'ev-xss',     tag: 'tag-xss',     label: 'XSS' };
    if (ev.includes('CMD') || ev.includes('exec')) return { cls: 'ev-cmd', tag: 'tag-cmd', label: 'CMD INJECT' };
    if (ev.includes('BRUTE') || ev.includes('login.failed')) return { cls: 'ev-brute', tag: 'tag-brute', label: 'BRUTE FORCE' };
    if (ev.includes('login.success'))   return { cls: 'ev-success', tag: 'tag-success', label: 'SSH SUCCESS' };
    if (ev.includes('command.input'))   return { cls: 'ev-command', tag: 'tag-command', label: 'SSH COMMAND' };
    if (ev.includes('EXFIL'))           return { cls: 'ev-recon',   tag: 'tag-exfil',   label: 'DATA EXFIL' };
    if (ev.includes('RECON'))           return { cls: 'ev-recon',   tag: 'tag-recon',   label: 'RECON' };
    return { cls: 'ev-recon', tag: 'tag-recon', label: ev };
  }

  // ── Build table row ──
  function buildRow(log, isNew) {
    const ev = classifyEvent(log.event);
    const src = log.source === 'cowrie'
      ? '<span class="badge badge-cowrie">COWRIE</span>'
      : '<span class="badge badge-dvwa">DVWA</span>';

    const visible = (currentFilter === 'all') ||
                    (currentFilter === 'cowrie' && log.source === 'cowrie') ||
                    (currentFilter === 'dvwa'   && log.source === 'DVWA');

    return `<tr class="log-row ${ev.cls} ${isNew ? 'new-row' : ''}"
               data-source="${log.source}"
               style="${visible ? '' : 'display:none'}">
      <td>${log.time || '-'}</td>
      <td class="ip-cell">${log.ip || '-'}</td>
      <td>${src}</td>
      <td><span class="event-tag ${ev.tag}">${ev.label}</span></td>
      <td>${log.username || '-'}</td>
      <td>${log.password || '-'}</td>
      <td>${log.command || '-'}</td>
      <td title="${(log.request || '-').replace(/"/g,'')}">${(log.request || '-').substring(0, 60)}</td>
    </tr>`;
  }

  // ── Update stats ──
  function updateStats(logs) {
    document.getElementById('stat-total').textContent  = logs.length;
    document.getElementById('stat-cowrie').textContent = logs.filter(l => l.source === 'cowrie').length;
    document.getElementById('stat-dvwa').textContent   = logs.filter(l => l.source === 'DVWA').length;
    document.getElementById('stat-ssh').textContent    = logs.filter(l => (l.event||'').includes('login.success')).length;
    document.getElementById('stat-sqli').textContent   = logs.filter(l => (l.event||'').includes('SQLi')).length;
  }

  // ── Fetch logs ──
  function fetchLogs(manual) {
    fetch('/api/logs')
      .then(r => r.json())
      .then(logs => {
        const isNew = manual || allLogs.length !== logs.length;
        allLogs = logs;
        updateStats(logs);

        const body = document.getElementById('log-body');
        if (logs.length === 0) {
          body.innerHTML = `<tr><td colspan="8">
            <div class="empty-state"><span>🛡</span>NO ATTACKS DETECTED YET</div>
          </td></tr>`;
          return;
        }

        body.innerHTML = logs.map((l, i) => buildRow(l, isNew && i < 3)).join('');
        if (manual) showToast('Logs updated', 'ok');
      })
      .catch(() => showToast('Failed to fetch logs', 'error'));
  }

  // ── Tab filter ──
  function setFilter(filter, btn) {
    currentFilter = filter;
    document.querySelectorAll('.tab').forEach(t => t.classList.remove('active'));
    btn.classList.add('active');
    document.querySelectorAll('.log-row').forEach(row => {
      const src = row.dataset.source;
      if (filter === 'all') row.style.display = '';
      else if (filter === 'cowrie') row.style.display = src === 'cowrie' ? '' : 'none';
      else if (filter === 'dvwa')   row.style.display = src === 'DVWA'   ? '' : 'none';
    });
  }

  // ── Flush ──
  function flushLogs(target) {
    if (!confirm('Flush ' + target.toUpperCase() + ' logs?')) return;
    const btn = document.getElementById('btn-flush-' + target);
    btn.disabled = true;
    btn.textContent = 'Flushing...';

    fetch('/flush/' + target, { method: 'POST' })
      .then(r => r.json())
      .then(d => {
        showToast(d.message, d.status === 'ok' ? 'ok' : 'error');
        btn.disabled = false;
        btn.textContent = target === 'cowrie' ? '🗑 Flush Cowrie' : '🗑 Flush DVWA';
        setTimeout(() => fetchLogs(false), 500);
      })
      .catch(() => {
        showToast('Error flushing logs', 'error');
        btn.disabled = false;
      });
  }

  // ── Toast ──
  function showToast(msg, type) {
    const t = document.getElementById('toast');
    t.textContent = msg;
    t.className = 'show' + (type === 'error' ? ' error' : '');
    setTimeout(() => { t.className = ''; }, 3000);
  }

  // ── Countdown timer ──
  function startCountdown() {
    countdown = 10;
    clearInterval(countdownInterval);
    countdownInterval = setInterval(() => {
      countdown--;
      document.getElementById('refresh-timer').textContent = `REFRESH IN ${countdown}s`;
      if (countdown <= 0) {
        fetchLogs(false);
        countdown = 10;
      }
    }, 1000);
  }

  // ── Init ──
  fetchLogs(false);
  startCountdown();
</script>
</body>
</html>
EOF

EXIT
exit
cd honeypo-dashboard
cd honeypot-dashboard
nano app.py
cat > app.py << 'EOF'
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
        os.system("sudo truncate -s 0 /var/log/apache2/access.log")
        return jsonify({"status": "ok", "message": "DVWA logs flushed"})
    except Exception as e:
        return jsonify({"status": "error", "message": str(e)}), 500

app.run(host="0.0.0.0", port=5000, debug=False)
EOF

ls
cd templates
cat > dashboard.html << 'EOF'
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>HoneyNet — Attack Dashboard</title>
<link href="https://fonts.googleapis.com/css2?family=Share+Tech+Mono&family=Rajdhani:wght@400;600;700&display=swap" rel="stylesheet">
<style>
  :root {
    --bg:        #080c10;
    --surface:   #0d1117;
    --border:    #1e2d40;
    --accent:    #00d4ff;
    --green:     #00ff88;
    --red:       #ff3c5a;
    --orange:    #ff8c00;
    --yellow:    #ffd700;
    --purple:    #b06aff;
    --text:      #c9d8e8;
    --muted:     #4a6278;
    --font-mono: 'Share Tech Mono', monospace;
    --font-ui:   'Rajdhani', sans-serif;
  }

  * { box-sizing: border-box; margin: 0; padding: 0; }

  body {
    background: var(--bg);
    color: var(--text);
    font-family: var(--font-ui);
    font-size: 15px;
    min-height: 100vh;
    overflow-x: hidden;
  }

  body::before {
    content: '';
    position: fixed;
    inset: 0;
    background-image:
      linear-gradient(rgba(0,212,255,.03) 1px, transparent 1px),
      linear-gradient(90deg, rgba(0,212,255,.03) 1px, transparent 1px);
    background-size: 40px 40px;
    pointer-events: none;
    z-index: 0;
  }

  header {
    position: relative;
    z-index: 10;
    display: flex;
    align-items: center;
    justify-content: space-between;
    padding: 18px 32px;
    border-bottom: 1px solid var(--border);
    background: rgba(13,17,23,.9);
    backdrop-filter: blur(10px);
  }

  .logo { display: flex; align-items: center; gap: 12px; }

  .logo-icon {
    width: 36px; height: 36px;
    border: 2px solid var(--accent);
    border-radius: 8px;
    display: grid;
    place-items: center;
    font-size: 18px;
    box-shadow: 0 0 12px rgba(0,212,255,.4);
  }

  .logo-text {
    font-size: 22px;
    font-weight: 700;
    letter-spacing: 3px;
    color: white;
    text-transform: uppercase;
  }

  .logo-sub {
    font-family: var(--font-mono);
    font-size: 11px;
    color: var(--accent);
    letter-spacing: 2px;
  }

  .header-right { display: flex; align-items: center; gap: 16px; }

  .live-badge {
    display: flex;
    align-items: center;
    gap: 8px;
    font-family: var(--font-mono);
    font-size: 12px;
    color: var(--green);
    letter-spacing: 1px;
  }

  .pulse {
    width: 8px; height: 8px;
    border-radius: 50%;
    background: var(--green);
    box-shadow: 0 0 8px var(--green);
    animation: pulse 1.5s infinite;
  }

  @keyframes pulse {
    0%, 100% { opacity: 1; transform: scale(1); }
    50% { opacity: .4; transform: scale(1.4); }
  }

  .refresh-timer {
    font-family: var(--font-mono);
    font-size: 11px;
    color: var(--muted);
    letter-spacing: 1px;
  }

  main {
    position: relative;
    z-index: 1;
    padding: 28px 32px;
    max-width: 1600px;
    margin: 0 auto;
  }

  .stats {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(180px, 1fr));
    gap: 16px;
    margin-bottom: 28px;
  }

  .stat-card {
    background: var(--surface);
    border: 1px solid var(--border);
    border-radius: 10px;
    padding: 20px;
    position: relative;
    overflow: hidden;
    transition: border-color .2s, transform .2s;
  }

  .stat-card:hover { border-color: var(--accent); transform: translateY(-2px); }

  .stat-card::before {
    content: '';
    position: absolute;
    top: 0; left: 0; right: 0;
    height: 2px;
  }

  .stat-card.total::before  { background: var(--accent); }
  .stat-card.cowrie::before { background: var(--green); }
  .stat-card.dvwa::before   { background: var(--orange); }
  .stat-card.ssh::before    { background: var(--purple); }
  .stat-card.web::before    { background: var(--red); }

  .stat-label {
    font-family: var(--font-mono);
    font-size: 11px;
    color: var(--muted);
    letter-spacing: 2px;
    text-transform: uppercase;
    margin-bottom: 10px;
  }

  .stat-value {
    font-size: 36px;
    font-weight: 700;
    line-height: 1;
    font-family: var(--font-mono);
    transition: all .3s;
  }

  .stat-card.total .stat-value  { color: var(--accent); }
  .stat-card.cowrie .stat-value { color: var(--green); }
  .stat-card.dvwa .stat-value   { color: var(--orange); }
  .stat-card.ssh .stat-value    { color: var(--purple); }
  .stat-card.web .stat-value    { color: var(--red); }

  .controls {
    display: flex;
    align-items: center;
    gap: 12px;
    margin-bottom: 20px;
    flex-wrap: wrap;
  }

  .tab-group {
    display: flex;
    background: var(--surface);
    border: 1px solid var(--border);
    border-radius: 8px;
    overflow: hidden;
  }

  .tab {
    padding: 9px 20px;
    font-family: var(--font-ui);
    font-weight: 600;
    font-size: 13px;
    letter-spacing: 1px;
    text-transform: uppercase;
    cursor: pointer;
    border: none;
    background: transparent;
    color: var(--muted);
    transition: all .2s;
  }

  .tab:hover { color: var(--text); }
  .tab.active { background: var(--accent); color: #000; }
  .tab.active.cowrie-tab { background: var(--green); }
  .tab.active.dvwa-tab   { background: var(--orange); }

  .spacer { flex: 1; }

  .btn {
    padding: 9px 18px;
    border-radius: 7px;
    border: 1px solid var(--border);
    font-family: var(--font-ui);
    font-weight: 600;
    font-size: 13px;
    letter-spacing: 1px;
    text-transform: uppercase;
    cursor: pointer;
    background: var(--surface);
    color: var(--text);
    transition: all .2s;
    text-decoration: none;
    display: inline-flex;
    align-items: center;
    gap: 6px;
  }

  .btn:hover { border-color: var(--accent); color: var(--accent); }
  .btn:disabled { opacity: .4; cursor: not-allowed; }
  .btn-danger  { border-color: var(--red);    color: var(--red); }
  .btn-danger:hover  { background: rgba(255,60,90,.1); }
  .btn-warning { border-color: var(--orange); color: var(--orange); }
  .btn-warning:hover { background: rgba(255,140,0,.1); }
  .btn-export  { border-color: var(--green);  color: var(--green); }
  .btn-export:hover  { background: rgba(0,255,136,.1); }

  .table-wrap {
    background: var(--surface);
    border: 1px solid var(--border);
    border-radius: 12px;
    overflow: hidden;
  }

  .table-scroll {
    overflow-x: auto;
    max-height: 65vh;
    overflow-y: auto;
  }

  .table-scroll::-webkit-scrollbar { width: 6px; height: 6px; }
  .table-scroll::-webkit-scrollbar-track { background: var(--surface); }
  .table-scroll::-webkit-scrollbar-thumb { background: var(--border); border-radius: 3px; }

  table { width: 100%; border-collapse: collapse; min-width: 900px; }

  thead tr {
    background: #0a0f14;
    position: sticky;
    top: 0;
    z-index: 5;
  }

  th {
    padding: 14px 16px;
    text-align: left;
    font-family: var(--font-mono);
    font-size: 11px;
    letter-spacing: 2px;
    color: var(--muted);
    text-transform: uppercase;
    border-bottom: 1px solid var(--border);
    white-space: nowrap;
  }

  td {
    padding: 11px 16px;
    font-family: var(--font-mono);
    font-size: 13px;
    border-bottom: 1px solid rgba(30,45,64,.5);
    white-space: nowrap;
    max-width: 280px;
    overflow: hidden;
    text-overflow: ellipsis;
  }

  tr:last-child td { border-bottom: none; }
  tbody tr { transition: background .15s, opacity .3s; }
  tbody tr:hover { background: rgba(0,212,255,.04); }

  tr.ev-sqli    td:first-child { border-left: 3px solid var(--red); }
  tr.ev-xss     td:first-child { border-left: 3px solid var(--purple); }
  tr.ev-cmd     td:first-child { border-left: 3px solid var(--orange); }
  tr.ev-brute   td:first-child { border-left: 3px solid var(--yellow); }
  tr.ev-success td:first-child { border-left: 3px solid var(--green); }
  tr.ev-command td:first-child { border-left: 3px solid var(--accent); }
  tr.ev-recon   td:first-child { border-left: 3px solid var(--muted); }

  @keyframes fadeIn {
    from { opacity: 0; transform: translateY(-4px); }
    to   { opacity: 1; transform: translateY(0); }
  }

  tr.new-row { animation: fadeIn .4s ease forwards; }

  .badge {
    display: inline-block;
    padding: 3px 10px;
    border-radius: 4px;
    font-size: 11px;
    font-weight: 700;
    letter-spacing: 1px;
    text-transform: uppercase;
  }

  .badge-cowrie { background: rgba(0,255,136,.12); color: var(--green);  border: 1px solid rgba(0,255,136,.3); }
  .badge-dvwa   { background: rgba(255,140,0,.12);  color: var(--orange); border: 1px solid rgba(255,140,0,.3); }

  .event-tag {
    display: inline-block;
    padding: 2px 8px;
    border-radius: 3px;
    font-size: 11px;
    font-weight: 700;
    letter-spacing: .5px;
  }

  .tag-sqli    { background: rgba(255,60,90,.15);   color: var(--red); }
  .tag-xss     { background: rgba(176,106,255,.15); color: var(--purple); }
  .tag-cmd     { background: rgba(255,140,0,.15);   color: var(--orange); }
  .tag-brute   { background: rgba(255,215,0,.15);   color: var(--yellow); }
  .tag-success { background: rgba(0,255,136,.15);   color: var(--green); }
  .tag-command { background: rgba(0,212,255,.15);   color: var(--accent); }
  .tag-recon   { background: rgba(74,98,120,.2);    color: var(--muted); }
  .tag-exfil   { background: rgba(176,106,255,.2);  color: var(--purple); }

  .ip-cell { color: var(--accent); font-weight: bold; }

  .empty-state {
    text-align: center;
    padding: 60px 20px;
    color: var(--muted);
    font-family: var(--font-mono);
    font-size: 14px;
    letter-spacing: 2px;
  }

  .empty-state span { display: block; font-size: 40px; margin-bottom: 16px; }

  #toast {
    position: fixed;
    bottom: 28px;
    right: 28px;
    padding: 14px 22px;
    border-radius: 8px;
    font-family: var(--font-mono);
    font-size: 13px;
    background: var(--surface);
    border: 1px solid var(--green);
    color: var(--green);
    transform: translateY(80px);
    opacity: 0;
    transition: all .3s;
    z-index: 100;
    pointer-events: none;
  }

  #toast.show { transform: translateY(0); opacity: 1; }
  #toast.error { border-color: var(--red); color: var(--red); }
</style>
</head>
<body>

<header>
  <div class="logo">
    <div class="logo-icon">🍯</div>
    <div>
      <div class="logo-text">HoneyNet</div>
      <div class="logo-sub">ATTACK INTELLIGENCE DASHBOARD</div>
    </div>
  </div>
  <div class="header-right">
    <div class="refresh-timer" id="refresh-timer">REFRESH IN 10s</div>
    <div class="live-badge">
      <div class="pulse"></div>
      MONITORING ACTIVE
    </div>
  </div>
</header>

<main>
  <div class="stats">
    <div class="stat-card total">
      <div class="stat-label">Total Events</div>
      <div class="stat-value" id="stat-total">0</div>
    </div>
    <div class="stat-card cowrie">
      <div class="stat-label">Cowrie Events</div>
      <div class="stat-value" id="stat-cowrie">0</div>
    </div>
    <div class="stat-card dvwa">
      <div class="stat-label">DVWA Events</div>
      <div class="stat-value" id="stat-dvwa">0</div>
    </div>
    <div class="stat-card ssh">
      <div class="stat-label">SSH Success</div>
      <div class="stat-value" id="stat-ssh">0</div>
    </div>
    <div class="stat-card web">
      <div class="stat-label">SQLi Attacks</div>
      <div class="stat-value" id="stat-sqli">0</div>
    </div>
  </div>

  <div class="controls">
    <div class="tab-group">
      <button class="tab active"      onclick="setFilter('all', this)">All</button>
      <button class="tab cowrie-tab"  onclick="setFilter('cowrie', this)">🐝 Cowrie</button>
      <button class="tab dvwa-tab"    onclick="setFilter('dvwa', this)">🌐 DVWA</button>
    </div>
    <div class="spacer"></div>
    <button class="btn btn-warning" id="btn-flush-cowrie" onclick="flushLogs('cowrie')">🗑 Flush Cowrie</button>
    <button class="btn btn-danger"  id="btn-flush-dvwa"   onclick="flushLogs('dvwa')">🗑 Flush DVWA</button>
    <a class="btn btn-export" href="/export">⬇ Export CSV</a>
    <button class="btn" onclick="fetchLogs(true)">↻ Refresh</button>
  </div>

  <div class="table-wrap">
    <div class="table-scroll">
      <table>
        <thead>
          <tr>
            <th>Time</th>
            <th>Source IP</th>
            <th>Source</th>
            <th>Event</th>
            <th>Username</th>
            <th>Password</th>
            <th>Command</th>
            <th>Request</th>
          </tr>
        </thead>
        <tbody id="log-body">
          <tr><td colspan="8">
            <div class="empty-state"><span>⏳</span>LOADING...</div>
          </td></tr>
        </tbody>
      </table>
    </div>
  </div>
</main>

<div id="toast"></div>

<script>
  let currentFilter = 'all';
  let allLogs = [];
  let countdown = 10;
  let countdownInterval;

  // ── Event classifier ──
  function classifyEvent(ev) {
    if (!ev) return { cls: 'ev-recon', tag: 'tag-recon', label: ev || '-' };
    if (ev.includes('SQLi'))            return { cls: 'ev-sqli',    tag: 'tag-sqli',    label: 'SQLi' };
    if (ev.includes('XSS'))             return { cls: 'ev-xss',     tag: 'tag-xss',     label: 'XSS' };
    if (ev.includes('CMD') || ev.includes('exec')) return { cls: 'ev-cmd', tag: 'tag-cmd', label: 'CMD INJECT' };
    if (ev.includes('BRUTE') || ev.includes('login.failed')) return { cls: 'ev-brute', tag: 'tag-brute', label: 'BRUTE FORCE' };
    if (ev.includes('login.success'))   return { cls: 'ev-success', tag: 'tag-success', label: 'SSH SUCCESS' };
    if (ev.includes('command.input'))   return { cls: 'ev-command', tag: 'tag-command', label: 'SSH COMMAND' };
    if (ev.includes('EXFIL'))           return { cls: 'ev-recon',   tag: 'tag-exfil',   label: 'DATA EXFIL' };
    if (ev.includes('RECON'))           return { cls: 'ev-recon',   tag: 'tag-recon',   label: 'RECON' };
    return { cls: 'ev-recon', tag: 'tag-recon', label: ev };
  }

  // ── Build table row ──
  function buildRow(log, isNew) {
    const ev = classifyEvent(log.event);
    const src = log.source === 'cowrie'
      ? '<span class="badge badge-cowrie">COWRIE</span>'
      : '<span class="badge badge-dvwa">DVWA</span>';

    const visible = (currentFilter === 'all') ||
                    (currentFilter === 'cowrie' && log.source === 'cowrie') ||
                    (currentFilter === 'dvwa'   && log.source === 'DVWA');

    return `<tr class="log-row ${ev.cls} ${isNew ? 'new-row' : ''}"
               data-source="${log.source}"
               style="${visible ? '' : 'display:none'}">
      <td>${log.time || '-'}</td>
      <td class="ip-cell">${log.ip || '-'}</td>
      <td>${src}</td>
      <td><span class="event-tag ${ev.tag}">${ev.label}</span></td>
      <td>${log.username || '-'}</td>
      <td>${log.password || '-'}</td>
      <td>${log.command || '-'}</td>
      <td title="${(log.request || '-').replace(/"/g,'')}">${(log.request || '-').substring(0, 60)}</td>
    </tr>`;
  }

  // ── Update stats ──
  function updateStats(logs) {
    document.getElementById('stat-total').textContent  = logs.length;
    document.getElementById('stat-cowrie').textContent = logs.filter(l => l.source === 'cowrie').length;
    document.getElementById('stat-dvwa').textContent   = logs.filter(l => l.source === 'DVWA').length;
    document.getElementById('stat-ssh').textContent    = logs.filter(l => (l.event||'').includes('login.success')).length;
    document.getElementById('stat-sqli').textContent   = logs.filter(l => (l.event||'').includes('SQLi')).length;
  }

  // ── Fetch logs ──
  function fetchLogs(manual) {
    fetch('/api/logs')
      .then(r => r.json())
      .then(logs => {
        const isNew = manual || allLogs.length !== logs.length;
        allLogs = logs;
        updateStats(logs);

        const body = document.getElementById('log-body');
        if (logs.length === 0) {
          body.innerHTML = `<tr><td colspan="8">
            <div class="empty-state"><span>🛡</span>NO ATTACKS DETECTED YET</div>
          </td></tr>`;
          return;
        }

        body.innerHTML = logs.map((l, i) => buildRow(l, isNew && i < 3)).join('');
        if (manual) showToast('Logs updated', 'ok');
      })
      .catch(() => showToast('Failed to fetch logs', 'error'));
  }

  // ── Tab filter ──
  function setFilter(filter, btn) {
    currentFilter = filter;
    document.querySelectorAll('.tab').forEach(t => t.classList.remove('active'));
    btn.classList.add('active');
    document.querySelectorAll('.log-row').forEach(row => {
      const src = row.dataset.source;
      if (filter === 'all') row.style.display = '';
      else if (filter === 'cowrie') row.style.display = src === 'cowrie' ? '' : 'none';
      else if (filter === 'dvwa')   row.style.display = src === 'DVWA'   ? '' : 'none';
    });
  }

  // ── Flush ──
  function flushLogs(target) {
    if (!confirm('Flush ' + target.toUpperCase() + ' logs?')) return;
    const btn = document.getElementById('btn-flush-' + target);
    btn.disabled = true;
    btn.textContent = 'Flushing...';

    fetch('/flush/' + target, { method: 'POST' })
      .then(r => r.json())
      .then(d => {
        showToast(d.message, d.status === 'ok' ? 'ok' : 'error');
        btn.disabled = false;
        btn.textContent = target === 'cowrie' ? '🗑 Flush Cowrie' : '🗑 Flush DVWA';
        setTimeout(() => fetchLogs(false), 500);
      })
      .catch(() => {
        showToast('Error flushing logs', 'error');
        btn.disabled = false;
      });
  }

  // ── Toast ──
  function showToast(msg, type) {
    const t = document.getElementById('toast');
    t.textContent = msg;
    t.className = 'show' + (type === 'error' ? ' error' : '');
    setTimeout(() => { t.className = ''; }, 3000);
  }

  // ── Countdown timer ──
  function startCountdown() {
    countdown = 10;
    clearInterval(countdownInterval);
    countdownInterval = setInterval(() => {
      countdown--;
      document.getElementById('refresh-timer').textContent = `REFRESH IN ${countdown}s`;
      if (countdown <= 0) {
        fetchLogs(false);
        countdown = 10;
      }
    }, 1000);
  }

  // ── Init ──
  fetchLogs(false);
  startCountdown();
</script>
</body>
</html>
EOF

nano dashboard.html
