#!/bin/sh

system_update()
{
	freebsd-update fetch install
}

install_packages()
{
	pkg update && pkg upgrade -y
	cat ./package_list.txt | xargs pkg install -y
}

add_user()
{
	pw user add -n admin -c 'Administrator' -d /usr/admin -G wheel -m -s /bin/tcsh
	echo "permit persist :wheel as root" > /usr/local/etc/doas.conf
}

setup_php()
{
	cp /usr/local/etc/php.ini-development /usr/local/etc/php.ini
}

patch_apache()
{
	patch /usr/local/etc/apache24/httpd.conf < ./patch/httpd.conf.patch
}

setup_apache()
{
	sysrc apache24_enable=YES
	service apache24 start
	service apache24 status
}

setup_mysql()
{
	sysrc mysql_enable=YES
	sysrc mysql_args="--bind-address=0.0.0.0"
	service mysql-server start
	service mysql-server status

	/usr/local/bin/mysql_secure_installation
}

import_schema()
{
	/usr/local/bin/mysql -u root -p < ./sql/setup.sql
	/usr/local/bin/mysql -u root -p simpla < ./sql/simpla.sql

	service mysql-server restart
}

set_permissions()
{
	mkdir -p /usr/local/www/apache24/data/compiled
	mkdir -p /usr/local/www/apache24/data/simpla/design/compiled
	
	chown -R admin:www /usr/local/www/apache24/data

	find /usr/local/www/apache24/data -type f | xargs chmod -v 644
	find /usr/local/www/apache24/data -type d | xargs chmod -v 755

	chmod 755 /usr/local/www/apache24/data
	chmod 777 /usr/local/www/apache24/data/compiled/
	chmod 777 /usr/local/www/apache24/data/simpla/design/
	chmod 777 /usr/local/www/apache24/data/simpla/design/compiled/
}

printf '\n%s\n' ':: Update FreeBSD system (y/N)? '
read answer

if [ "$answer" != "${answer#[Yy]}" ] ; then
	system_update
fi

printf '\n%s\n' ':: Install packages (y/N)? '
read answer
if [ "$answer" != "${answer#[Yy]}" ] ; then
	install_packages
fi

printf '\n%s\n' ':: Add administrator user and setup privileges (y/N)? '
read answer
if [ "$answer" != "${answer#[Yy]}" ] ; then
	add_user
fi

printf '\n%s\n' ':: Setup PHP (y/N)? '
read answer
if [ "$answer" != "${answer#[Yy]}" ] ; then
	setup_php
fi

printf '\n%s\n' ':: Patch Apache configuration file (y/N)? '
read answer
if [ "$answer" != "${answer#[Yy]}" ] ; then
	patch_apache	
fi

printf '\n%s\n' ':: Enable and start Apache (y/N)? '
read answer
if [ "$answer" != "${answer#[Yy]}" ] ; then
	setup_apache
fi

printf '\n%s\n' ':: Setup  MySQL (y/N)? '
read answer
if [ "$answer" != "${answer#[Yy]}" ] ; then
	setup_mysql
fi

printf '\n%s\n' ':: Import database schema (y/N)? '
read answer
if [ "$answer" != "${answer#[Yy]}" ] ; then
	import_schema
fi

printf '\n%s\n' ':: Set (repair) file and folder permissions (y/N)? '
read answer
if [ "$answer" != "${answer#[Yy]}" ] ; then
	set_permissions
fi

printf '\n%s\n' ':: All done!'
