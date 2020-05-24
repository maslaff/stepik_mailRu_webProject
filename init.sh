VERSION_PYTHON=3.5
echo "Текущая версия Python3: $(python3 --version)"
if [ $(python3 --version |& sed -r 's/Python [0-9].([0-9]).[0-9]+/\1/') -gt 4  ] 
then
    PYTHON_PATH=$(which python3)
else
   sudo apt update
   sudo apt install python$VERSION_PYTHON
   PYTHON_PATH=$(which python3.5)
fi
echo "Путь к python3: $PYTHON_PATH"

# sudo apt-get -y install nginx
# pip3 install gunicorn
pip3 install gunicorn django==2.1
cd /home/box/web
mkdir -p public/img public/css public/js uploads
sudo unlink /etc/nginx/sites-enabled/default
sudo ln -s /home/box/web/etc/nginx.conf  /etc/nginx/sites-enabled/default
sudo /etc/init.d/nginx restart
gunicorn -w 4 -b '0.0.0.0:8080' hello:app &
gunicorn -w 4 -b '0.0.0.0:8000' ask:wsgi
# sudo ln -s /home/box/web/etc/gunicorn.conf   /etc/gunicorn.d/test
# sudo /etc/init.d/gunicorn restart
# sudo /etc/init.d/mysql start

# git clone https://github.com/maslaff/stepik_mailRu_webProject.git /home/box/web