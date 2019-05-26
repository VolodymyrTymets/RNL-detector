# Install programs

# git istall

sudo apt-get install git-core

sudo apt-get install nodejs
sudo apt-get install npm
sudo npm install -g n
sudo n 10.15.3


#Pm2 - to autorun on launch
sudo npm i -g pm2
#registe pm2 in startup
sudo pm2 startup
#chec if success
sudo systemctl status pm2


#Copy projects rectangle generator
cd Documets/
mkdir apps
cd apps
git clone https://github.com/VolodymyrTymets/rectangle-generator.git
cd rectangle-generator
npm i

#run via pm2
npm run autorun
pm2 save