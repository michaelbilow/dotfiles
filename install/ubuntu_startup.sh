systemStartPath="/usr/bin/system_start.sh"
mv $(getBilow system_start) $systemStartPath
chmod +x $systemStartPath

systemServicePath="/etc/systemd/system/system_start.service"

sudo cat <<EOF > $systemServicePath
[Unit]
Description=Startup script

[Service]
Type=simple
ExecStart=/bin/bash $systemStartPath

[Install]
WantedBy=multi-user.target
EOF

sudo chmod 644 $systemServicePath
sudo systemctl enable system_start
