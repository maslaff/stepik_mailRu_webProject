#sudo apt-get -y install nginx
sudo pip install gunicorn
mkdir /home/box/web
cd /home/box/web
mkdir -p public/img public/css public/js uploads
sudo ln -s /home/box/web/etc/nginx.conf  /etc/nginx/sites-enabled/default
sudo /etc/init.d/nginx restart
sudo ln -s /home/box/web/etc/gunicorn.conf   /etc/gunicorn.d/test
sudo /etc/init.d/gunicorn restart
#sudo /etc/init.d/mysql start