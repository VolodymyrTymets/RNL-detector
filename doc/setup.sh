# Install programs

# Raspy to router
sudo apt install network-manager network-manager-gnome openvpn \openvpn-systemd-resolved network-manager-openvpn \network-manager-openvpn-gnome
sudo apt purge openresolv dhcpcd5

# git istall
sudo apt-get update
sudo apt-get install git-core
sudo apt-get install npm
sudo npm install -g n
sudo n 10.15.3

#Pm2 - to autorun on launch
sudo npm i -g pm2
#registe pm2 in startup
sudo pm2 startup
#chec if success
sudo systemctl status pm2

#Copy project rectangle generator
cd Documets/
mkdir apps
cd apps
git clone https://github.com/VolodymyrTymets/rectangle-generator.git
cd rectangle-generator
npm i

#Copy project sound up


#run via pm2
npm run autorun
pm2 save