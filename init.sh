# sudo apt-get -y install nginx
pip3 install gunicorn
cd /home/box/web
mkdir -p public/img public/css public/js uploads
sudo unlink /etc/nginx/sites-enabled/default
sudo ln -s /home/box/web/etc/nginx.conf  /etc/nginx/sites-enabled/default
sudo /etc/init.d/nginx restart
gunicorn -w 4 -b '0.0.0.0:8080' hello:app
# sudo ln -s /home/box/web/etc/gunicorn.conf   /etc/gunicorn.d/test
# sudo /etc/init.d/gunicorn restart
# sudo /etc/init.d/mysql start