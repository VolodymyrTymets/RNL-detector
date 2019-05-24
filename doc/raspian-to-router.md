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
wpa=1
wpa_passphrase=12345         
wpa_key_mgmt=WPA-PSK
wpa_pairwise=TKIP CCMP
wpa_ptk_rekey=600
macaddr_acl=0

```
where `ssid` name of network  `wpa_passphrase` password 

set ip `10.10.0.1` to `wlan0` driver !!!`IMPORTANT`


> sudo ifconfig wlan0 10.10.0.1

restart http server

> sudo /etc/init.d/isc-dhcp-server restart