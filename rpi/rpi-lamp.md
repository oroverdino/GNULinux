### LAMP in Raspberry Pi Zero W
### 171117

# L

Of course there is a raspian stretch running in the rpiz-w. That is the L part.
```
sudo aptitude update && sudo aptitude full-upgrade
```

# A

Apache is the standard http server, so install it
```
sudo aptitude install apache2
```

# M

Mariadb is the fork we'll choice
```
sudo aptitude install mariadb-server mariadb-client
```

After check that mariadb is running
```
systemctl status mysql
```
we should run the post installation security script
```
sudo mysql_secure_installation
```

A password will be asked: mariadb.root

# P

PHP server is the reason for this LAMP, so
```
sudo aptitude install php7.0 php7.0-fpm php7.0-mysql php7.0-gd php7.0-curl
```

Then we must enable the FPM module
```
sudo a2enmod proxy_fcgi setenvif
sudo a2enconf php7.0-fpm
```

It's a good idea to enable the debbuging code in the browser, for that change
in /etc/php/7.0/apache2/php.ini
```
error_reporting = E_ALL
...
display_errors = On
```

Finally we should restart apache2
```
sudo systemctl restart apache2.service
```

## Virtual hosts

Let's setup a virtual host called sgu03
```
sudo mkdir /var/www/sgu03
sudo mkdir /var/www/logs
```

Then create and edit a file called sgu03.conf in /etc/apache2/sites-available
where:
```
<VirtualHost *:80>
     ServerAdmin webmaster@sgu03
     ServerName sgu03
     ServerAlias sgu03
     DocumentRoot /var/www/html/sgu03/
     ErrorLog /var/www/html/logs/errorSgu03.log
     CustomLog /var/www/html/logs/accessSgu03.log combined
</VirtualHost>
```

Then link the virtual host from sites-available to sites-enabled
```
sudo a2ensite sgu03.conf
```

Restart apache2 and get back to work!

## phpMyAdmin

It's handy, so we should install it
```
sudo aptitude install phpmyadmin
```

After that you'll probably have problems to login. Just see what the user
and password are:
```
sudo vim /etc/dbconfig-common/phpmyadmin.conf
```
then find the entries 'dbc_dbuser' and 'dbc_dbpass'.
