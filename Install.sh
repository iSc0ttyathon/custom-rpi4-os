apt-get install --no-install-recommends libexo-2-0 ubuntu-restricted-extras xserver-xorg-video-fbdev xserver-xorg xinit vnstat squid lxqt-core xterm openbox openvpn wireguard network-manager network-manager-openvpn network-manager-openvpn-gnome network-manager-gnome iptables dnsutils whiptail iptables-persistent qrencode libqrencode4 wget curl git bzip2 lbzip2 p7zip xarchiver engrampa p7zip-full ntfs-3g gvfs gvfs-fuse gvfs-backends udiskie udisks2 thunar thunar-volman pcmanfm pcmanfm-qt samba smbclient cifs-utils sakura mousepad gimp firefox firefox-esr chromium-browser gparted hdparm gnome-icon-theme gnome-disk-utility gnome-screenshot i3-wm i3status i3lock i3blocks dmenu feh lightdm lightdm-gtk-greeter lightdm-gtk-greeter-settings python2 python3 mpv vlc pavucontrol pulseaudio volumeicon-alsa hexchat hexchat-plugins uget qbittorrent-nox qbittorrent xfwm4 lxappearance -y 
rm -rf /etc/samba/smb.conf
{ echo [global] ; echo netbios name = PiDesktop ; echo workgroup = WORKGROUP ; echo interfaces = 192.168.0.1/8 ; echo ; echo [hdd] ; echo comment = linux ; echo path = /mnt/ ; echo browseable = yes ; echo guest ok = yes ; echo read only = no ; echo create mask = 7777 ; echo directory mask = 7777 ; echo ; echo [root] ; echo comment = Linux ; echo path = / ; echo browseable = yes ; echo guest ok = yes ; echo read only = no ; echo create mask = 7777 ; echo directory mask = 7777 ; echo ; echo [home] ; echo comment = Linux ; echo path = /home/ ; echo browseable = yes ; echo guest ok = yes ; echo read only = no ; echo create mask = 7777 ; echo directory mask = 7777 ; } >> /etc/samba/smb.conf
mkdir -p /etc/lightdm/
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
mv /home/pi/custom-rpi4-os/feather.ttf /home/pi/.fonts/
mv /home/pi/custom-rpi4-os/i3-status-config /home/pi/.config/i3status/config
mv /home/pi/custom-rpi4-os/i3-wm-config /home/pi/.config/i3/config
mv /home/pi/custom-rpi4-os/Desktop.png /home/pi/Pictures/Desktop.png
mv /home/pi/custom-rpi4-os/Chromium /home/pi/Chromium/
mv /home/pi/custom-rpi4-os/RPi.jpg /home/pi/Pictures/RPi.jpg
chmod -R 0777 /home/pi/Chromium/
chmod -R 0777 /home/pi/Chromium/Chromium
chmod -R 0777 /home/
chmod -R 0777 /home/pi/
rm -rf /etc/squid/squid.conf
mv /home/pi/custom-rpi4-os/squid.conf /etc/squid/
rm -rf /etc/lightdm/lightdm-gtk-greeter.conf
mv /home/pi/custom-rpi4-os/lightdm-gtk-greeter.conf /etc/lightdm/
rm -rf /etc/squid/squid.conf
mv /home/pi/custom-rpi4-os/squid.conf /etc/squid/
mv /home/pi/custom-rpi4-os/comp-off /usr/local/bin/
mv /home/pi/custom-rpi4-os/firefox-sync /usr/local/bin/
mv /home/pi/custom-rpi4-os/firefox-update /usr/local/bin/
mv /home/pi/custom-rpi4-os/rpi-remove /usr/local/bin/
mv /home/pi/custom-rpi4-os/rpi-update /usr/local/bin/
chmod +x /usr/local/bin/comp-off
chmod +x /usr/local/bin/firefox-sync
chmod +x /usr/local/bin/firefox-update
chmod +x /usr/local/bin/rpi-remove
chmod +x /usr/local/bin/rpi-update
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
ufw disable 
dpkg-reconfigure locales tzdata keyboard-configuration resolvconf
passwd pi
passwd root
smbpasswd -a pi
smbpasswd -a root
