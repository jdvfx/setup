
sudo dnf install power-profiles-daemon
systemctl unmask power-profiles-daemon.service
systemctl start power-profiles-daemon.service
# powerprofilesctl

echo run one of the 3 options:
echo
echo powerprofilesctl set power-saver
echo powerprofilesctl set balanced
echo powerprofilesctl set performance

