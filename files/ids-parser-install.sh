
# (c) SIV, 2019. All rights reserved
# GNU GPL v1.0 License

# Change /var/www/html to your server directory, if it is a different one
$mydir = '/var/www/html'

# You don't have to change anything below this line
clear
cd $mydir
echo "Now installing IDS Parser (demo version)"
echo "Enter su password if you need"
sudo apt-get update
sudo apt-get install build-essential libssl-dev -y
sudo apt-get install nodejs-legacy -y
sudo apt-get install npm -y
sudo npm install nodemon -g
sudo apt-get install nginx ufw -y
sudo ufw allow 'Nginx HTTP'
sudo ufw allow 'Nginx HTTPS'
echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntuxenial/mongodb-org/4.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.0.list
sudo apt-get update
sudo apt-get install mongodb-org -y --allow-unauthenticated
echo "mongodb-org hold" | sudo dpkg --set-selections
echo "mongodb-org-server hold" | sudo dpkg --set-selections
echo "mongodb-org-shell hold" | sudo dpkg --set-selections
echo "mongodb-org-mongos hold" | sudo dpkg --set-selections
echo "mongodb-org-tools hold" | sudo dpkg --set-selections
sudo service mongod start
sudo npm install
echo "Parser was successfully installed!"