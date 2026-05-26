import pickle
import json

# Load model
with open('/home/narie/ai/model/model.pkl', 'rb') as f:
    model = pickle.load(f)
with open('/home/narie/ai/model/vectorizer.pkl', 'rb') as f:
    vectorizer = pickle.load(f)

# Honeypot deployment decision
HONEYPOT_MAP = {
    'SQLI-DVWA':            {'honeypot': 'DVWA',   'reason': 'SQL Injection detected'},
    'XSS-DVWA':             {'honeypot': 'DVWA',   'reason': 'XSS attack detected'},
    'LFI-DVWA':             {'honeypot': 'DVWA',   'reason': 'LFI attack detected'},
    'CMD_INJECTION-DVWA':   {'honeypot': 'DVWA',   'reason': 'Command injection detected'},
    'BRUTE_FORCE_WEB-DVWA': {'honeypot': 'DVWA',   'reason': 'Web brute force detected'},
    'BRUTE_FORCE_SSH-COWRIE':{'honeypot': 'COWRIE', 'reason': 'SSH brute force detected'},
    'SSH_SUCCESS-COWRIE':   {'honeypot': 'COWRIE', 'reason': 'Successful SSH login detected'},
    'SSH_COMMAND-COWRIE':   {'honeypot': 'COWRIE', 'reason': 'SSH command execution detected'},
    'RECON-COWRIE':         {'honeypot': 'COWRIE', 'reason': 'Reconnaissance detected'},
    'UNKNOWN-COWRIE':       {'honeypot': 'COWRIE', 'reason': 'Unknown threat, defaulting to SSH honeypot'},
}

def predict(log_entry: dict):
    # Build text from log entry
    text = (
        f"source:{log_entry.get('source', '-')} "
        f"event:{log_entry.get('event', '-')} "
        f"ip:{log_entry.get('ip', '-')} "
        f"username:{log_entry.get('username', '-')} "
        f"password:{log_entry.get('password', '-')} "
        f"command:{log_entry.get('command', '-')} "
        f"request:{log_entry.get('request', '-')}"
    )

    # Vectorize and predict
    vec = vectorizer.transform([text])
    prediction = model.predict(vec)[0]
    confidence = model.predict_proba(vec).max() * 100

    # Get honeypot decision
    decision = HONEYPOT_MAP.get(prediction, HONEYPOT_MAP['UNKNOWN-COWRIE'])

    return {
        'prediction': prediction,
        'confidence': f"{confidence:.2f}%",
        'deploy_honeypot': decision['honeypot'],
        'reason': decision['reason']
    }

# Test it
if __name__ == "__main__":
    # Example log entries
    test_logs = [
        {'source': 'DVWA', 'event': 'SQLi', 'ip': '192.168.1.1', 'request': "1 OR 1=1 --"},
        {'source': 'cowrie', 'event': 'cowrie.login.failed', 'ip': '10.0.0.1', 'username': 'root', 'password': '123456'},
        {'source': 'cowrie', 'event': 'cowrie.command.input', 'ip': '10.0.0.2', 'command': 'cat /etc/passwd'},
        {'source': 'DVWA', 'event': 'XSS', 'ip': '192.168.1.2', 'request': '<script>alert(1)</script>'},
    ]

    print("🤖 AI Model Inference Test")
    print("="*50)
    for log in test_logs:
        result = predict(log)
        print(f"\nInput:     {log}")
        print(f"Attack:    {result['prediction']}")
        print(f"Confidence:{result['confidence']}")
        print(f"Deploy:    {result['deploy_honeypot']}")
        print(f"Reason:    {result['reason']}")
