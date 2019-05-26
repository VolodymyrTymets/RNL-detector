# Install programs
To Install the program fallo the nex command or run setup.sh script

## git istall
```
sudo apt-get install git-core

sudo apt-get install nodejs
sudo apt-get install npm
sudo npm install -g n
sudo n 10.15.3
```

##Pm2 - to autorun on launch
> sudo npm i -g pm2
###registe pm2 in startup
> sudo pm2 startup
> sudo systemctl enable pm2-root
> sudo pm2 startup

!!! then fallow instructions

###chec if success
> sudo systemctl status pm2

## Copy project rectangle generator
```
cd Documets/
mkdir apps
cd apps
git clone https://github.com/VolodymyrTymets/rectangle-generator.git
cd rectangle-generator
npm i

#run via pm2
pm2 start index.js --name "test-pm2-3005"
pm2 save
```