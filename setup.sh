#!/bin/tcsh -f

# Update system

freebsd-update fetch install
pkg update && pkg upgrade -y

# Install packages

cat ./package_list.txt | xargs pkg install -y

# Setup user and privileges

pw user add -n admin -c 'Administrator' -d /usr/admin -G wheel -m -s /bin/tcsh
echo "permit persist :wheel as root" > /usr/local/etc/doas.conf

# Setup PHP

cp /usr/local/etc/php.ini-development /usr/local/etc/php.ini

# Setup Apache

patch /usr/local/etc/apache24/httpd.conf < ./patch/httpd.conf.patch

printf "%s " "Press enter to continue"
read ans

sysrc apache24_enable=YES
service apache24 start

printf "%s " "Press enter to continue"
read ans

service apache24 status

# Setup MySQL

sysrc mysql_enable=YES
service mysql-server start

printf "%s " "Press enter to continue"
read ans

service mysql-server status

/usr/local/bin/mysql_secure_installation

printf "%s " "Press enter to continue"
read ans

/usr/local/bin/mysql -u root -p < ./sql/setup.sql

printf "%s " "Press enter to continue"
read ans

/usr/local/bin/mysql -u root -p simpla < ./sql/simpla.sql

printf "%s " "Press enter to continue"
read ans

sysrc mysql_args="--bind-address=0.0.0.0"

service mysql-server restart


# Misc

mkdir -p /usr/local/www/apache24/data/simpla/design/compiled
chown -R admin:www /usr/local/www/apache24/data
find /usr/local/www/apache24/data -type f | xargs chmod -v 644
find /usr/local/www/apache24/data -type d | xargs chmod -v 755
chmod 755 /usr/local/www/apache24/data
chmod 777 /usr/local/www/apache24/data/simpla/design/compiled/
