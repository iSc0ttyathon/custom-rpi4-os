apt-get update -y
apt-get upgrade -y
apt-get full-upgrade -y
apt-get dist-upgrade -y
apt-get autoremove --purge -y
apt-get autoclean -y
apt-get install --no-install-recommends software-properties-common -y
add-apt-repository ppa:mozillateam/ppa -y
add-apt-repository ppa:qbittorrent-team/qbittorrent-stable -y
apt-get update -y
apt-get install --no-install-recommends neofetch htop powertop oxygen-icon-theme chromium-browser snap snapd openjdk-14-jdk resolvconf ufw bsdmainutils libexo-1-0 ubuntu-restricted-extras xserver-xorg-video-fbdev xserver-xorg xinit vnstat squid lxqt-core xterm openbox openvpn wireguard network-manager network-manager-openvpn network-manager-openvpn-gnome network-manager-gnome iptables dnsutils whiptail iptables-persistent qrencode libqrencode4 wget curl git bzip2 lbzip2 p7zip xarchiver engrampa p7zip-full ntfs-3g gvfs gvfs-fuse gvfs-backends udiskie udisks2 thunar thunar-volman pcmanfm pcmanfm-qt samba smbclient cifs-utils sakura mousepad gimp firefox firefox-esr gparted hdparm gnome-icon-theme gnome-disk-utility gnome-screenshot i3-wm i3status i3lock i3blocks dmenu feh lightdm lightdm-gtk-greeter lightdm-gtk-greeter-settings python2 python3 mpv vlc pavucontrol pulseaudio volumeicon-alsa hexchat hexchat-plugins uget qbittorrent-nox qbittorrent xfwm4 lxappearance -y 
rm -rf /etc/samba/smb.conf
{ echo [global] ; echo netbios name = PiDesktop ; echo workgroup = WORKGROUP ; echo interfaces = 192.168.0.1/8 ; echo ; echo [hdd] ; echo comment = linux ; echo path = /mnt/ ; echo browseable = yes ; echo guest ok = yes ; echo read only = no ; echo create mask = 7777 ; echo directory mask = 7777 ; echo ; echo [root] ; echo comment = Linux ; echo path = / ; echo browseable = yes ; echo guest ok = yes ; echo read only = no ; echo create mask = 7777 ; echo directory mask = 7777 ; echo ; echo [home] ; echo comment = Linux ; echo path = /home/ ; echo browseable = yes ; echo guest ok = yes ; echo read only = no ; echo create mask = 7777 ; echo directory mask = 7777 ; } >> /etc/samba/smb.conf
mkdir -p /etc/lightdm/
mkdir -p /home/pi/.config/lxqt
mkdir -p /etc/squid/
mkdir -p /home/pi/Chromium/
mkdir -p /home/
mkdir -p /home/pi/
mkdir -p /home/pi/Pictures/
mkdir -p /home/pi/Desktop/
mkdir -p /home/pi/Downloads/
mkdir -p /home/pi/.config/i3/
mkdir -p /home/pi/.config/i3status/
mkdir -p /home/pi/.fonts/
cd /home/pi/
git clone https://github.com/iSc0ttyathon/custom-rpi4-os.git
cd /home/pi/custom-rpi4-os/
rm -rf /boot/config.txt
cd /home/pi/custom-rpi4-os/
mv config /boot/config.txt
cd /home/pi/custom-rpi4-os/
mv qbittorrent /etc/systemd/system/qbittorrent-nox.service
cd /home/pi/custom-rpi4-os/
mv radarr /etc/systemd/system/radarr.service
cd /home/pi/custom-rpi4-os/
mv nzbget /etc/systemd/system/nzbget.service
cd /home/pi/custom-rpi4-os
mv feather.ttf /home/pi/.fonts/
cd /home/pi/custom-rpi4-os/
mv i3-status-config /home/pi/.config/i3status/config
cd /home/pi/custom-rpi4-os/
mv i3-wm-config /home/pi/.config/i3/config
cd /home/pi/custom-rpi4-os/
mv Desktop.png /home/pi/Pictures/Desktop.png
cd /home/pi/custom-rpi4-os/
mv Chromium /home/pi/Chromium/
chmod -R 0777 /home/pi/Chromium/
chmod -R 0777 /home/pi/Chromium/Chromium
cd /home/pi/custom-rpi4-os/
mv RPi.jpg /home/pi/Pictures/RPi.jpg
rm -rf /etc/squid/squid.conf
cd /home/pi/custom-rpi4-os/
mv squid.conf /etc/squid/
rm -rf /etc/lightdm/lightdm-gtk-greeter.conf
cd /home/pi/custom-rpi4-os/
mv lightdm-gtk-greeter.conf /etc/lightdm/
cd /home/pi/custom-rpi4-os/
mv comp-off /usr/local/bin/
cd /home/pi/custom-rpi4-os/
mv firefox-sync /usr/local/bin/
cd /home/pi/custom-rpi4-os/
mv firefox-update /usr/local/bin/
cd /home/pi/custom-rpi4-os/
mv rpi-remove /usr/local/bin/
cd /home/pi/custom-rpi4-os/
mv rpi-update /usr/local/bin/
cd /home/pi/custom-rpi4-os/
mv check-kms /usr/local/bin/
chmod +x /usr/local/bin/comp-off
chmod +x /usr/local/bin/firefox-sync
chmod +x /usr/local/bin/firefox-update
chmod +x /usr/local/bin/rpi-remove
chmod +x /usr/local/bin/rpi-update
chmod +x /usr/local/bin/check-kms
apt-get update -y
apt-get upgrade -y
apt-get full-upgrade -y
apt-get dist-upgrade -y
apt-get autoremove --purge -y
apt-get autoclean -y
systemctl disable --now squid
systemctl disable --now nmbd
systemctl enable lightdm
systemctl enable NetworkManager
systemctl enable vnstat
systemctl enable smbd
systemctl enable qbittorrent-nox
ufw disable 
rm -rf /etc/hosts
rm -rf /etc/hostname
cd /home/pi/custom-rpi4-os/
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 2009837CBFFD68F45BC180471F4F90DE2A9B4BF8
echo "deb https://apt.sonarr.tv/ubuntu focal main" | sudo tee /etc/apt/sources.list.d/sonarr.list
apt-get update -y
apt-get upgrade -y
apt-get install --no-install-recommends gnupg ca-certificates sonarr mediainfo -y
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF
echo "deb https://download.mono-project.com/repo/ubuntu stable-focal main" | sudo tee /etc/apt/sources.list.d/mono-official-stable.list
apt-get update -y
apt-get upgrade -y
cd /opt/
wget https://github.com/Jackett/Jackett/releases/download/v0.17.1032/Jackett.Binaries.LinuxARM64.tar.gz
tar -xzvf Jackett.Binaries.LinuxARM64.tar.gz
chown pi:pi -R /opt/Jackett
cd /opt/Jackett/
./install_service_systemd.sh
cd /home/pi/custom-rpi4-os
mv hostname /etc/hostname
cd /home/pi/custom-rpi4-os/
mv hosts /etc/hosts
cd /home/pi/custom-rpi4-os/
mv lxqt.conf /home/pi/.config/lxqt/
cd /home/pi/custom-rpi4-os/
mv lxqt-config-appearance.conf /home/pi/.config/lxqt/
systemctl enable radarr
systemctl enable nzbget
dpkg-reconfigure locales tzdata keyboard-configuration
passwd pi
passwd root
smbpasswd -a pi
smbpasswd -a root
rm -rf /home/pi/custom-rpi4-os
cd /opt/
wget https://github.com/Radarr/Radarr/releases/download/v3.1.1.4954/Radarr.master.3.1.1.4954.linux-core-arm64.tar.gz
tar -xzvf Radarr.master.3.1.1.4954.linux-core-arm64.tar.gz
systemctl enable radarr
systemctl enable nzbget
shutdown -r now