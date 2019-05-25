# Raspbian to router

Remove WPA Supplicant
> sudo apt-get purge wpasupplicant

install dhcp server

> sudo apt-get install isc-dhcp-server

setup dhcp

> sudo nano /etc/dhcp/dhcpd.conf 

and leave this in the end of the file

```
subnet 10.10.0.0 netmask 255.255.255.0 {
range 10.10.0.25 10.10.0.50;
option domain-name-servers 8.8.4.4;
option routers 10.10.0.1;
interface wlan0;
}
```

install hostapd for hosting access point

> sudo apt-get install hostapd

configure hostapd

to create/edit hostapd.conf

> sudo nano /etc/hostapd/hostapd.conf

add these lines to hostapd.conf file

```
interface=wlan0
driver=nl80211
ssid=RLN         
hw_mode=g
channel=11
#wpa=1
#wpa_passphrase=12345         
#wpa_key_mgmt=WPA-PSK
#wpa_pairwise=TKIP CCMP
#wpa_ptk_rekey=600
macaddr_acl=0

```
where `ssid` name of network  `wpa_passphrase` password 

set ip `10.10.0.1` to `wlan0` driver !!!`IMPORTANT`

change dhcp default settings

> sudo nano /etc/default/isc-dhcp-server

```
INTERFACESv4="wlan0 eth0"
INTERFACESv6="wlan0 eth0"

```

Restrart raspi
> sudo reboot

> sudo ifconfig wlan0 10.10.0.1

restart http server

> sudo /etc/init.d/isc-dhcp-server restart

-d is for debug mode so you can see if any errors appear

> sudo hostapd -d /etc/hostapd/hostapd.conf

to make persistent

> sudo nano /etc/network/interfaces

add or eidt these following line

```
auto lo
iface lo inet loopback

iface eth0 inet manual

allow-hotplug wlan0
iface wlan0 inet manual
    wpa-conf /etc/wpa_supplicant/wpa_supplicant.conf

auto wlan0
iface wlan0 inet static
address 10.10.0.1
netmask 255.255.255.0
```


> sudo nano /etc/rc.local


add these lines

```
hostapd -B /etc/hostapd/hostapd.conf
iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
```

add this line to sysctl.conf
> sudo nano /etc/sysctl.conf

```
net.ipv4.ip_forward = 1

```
