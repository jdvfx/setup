# execute as super user: $su

echo 'deb http://deb.debian.org/debian bullseye main contrib non-free
deb-src http://deb.debian.org/debian bullseye main contrib non-free
deb http://deb.debian.org/debian-security bullseye/updates main contrib non-free
deb-src http://deb.debian.org/debian-security bullseye/updates main contrib non-free
deb http://deb.debian.org/debian bullseye-updates main contrib non-free
deb-src http://deb.debian.org/debian bullseye-updates main contrib non-free' > sources.list

cp /etc/apt/sources.list /etc/apt/sources.list_backup
cp sources.list /etc/apt/sources.list

apt update
apt upgrade
apt install git



