## For raspi 3
- https://www.youtube.com/watch?v=XgcDipALFOc

sudo apt update

sudo apt install network-manager network-manager-gnome openvpn \openvpn-systemd-resolved network-manager-openvpn \network-manager-openvpn-gnome

sudo apt purge openresolv dhcpcd5

sudo ln -sf /lib/systemd/resolv.conf /etc/resolv.conf


Address: 10.10.10.10
Mask: 22
Chanel: 10.10.10.10
