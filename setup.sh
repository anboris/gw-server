#!/bin/sh

system_update() {
  freebsd-update fetch install
}

install_packages() {
  pkg update && pkg upgrade -y
  xargs pkg install -y <./package_list.txt
}

add_user() {
  pw user add -n admin -c 'Administrator' -d /usr/admin -G wheel -m -s /bin/tcsh
  echo "permit persist :wheel as root" >/usr/local/etc/doas.conf
}

setup_php() {
  cp /usr/local/etc/php.ini-development /usr/local/etc/php.ini
}

patch_apache() {
  patch /usr/local/etc/apache24/httpd.conf <./patch/httpd.conf.patch
}

setup_apache() {
  sysrc apache24_enable=YES
  service apache24 start
  service apache24 status
}

setup_mysql() {
  sysrc mysql_enable=YES
  sysrc mysql_args="--bind-address=0.0.0.0"
  service mysql-server start
  service mysql-server status

  /usr/local/bin/mysql_secure_installation
}

import_schema() {
  /usr/local/bin/mysql -u root -p <./sql/setup.sql
  /usr/local/bin/mysql -u root -p simpla <./sql/simpla.sql

  service mysql-server restart
}

set_permissions() {
  mkdir -p /usr/local/www/apache24/data/compiled
  mkdir -p /usr/local/www/apache24/data/simpla/design/compiled

  chown -R admin:www /usr/local/www/apache24/data

  find /usr/local/www/apache24/data -type f -exec chmod 644 {} +
  find /usr/local/www/apache24/data -type d -exec chmod 755 {} +

  chmod 755 /usr/local/www/apache24/data
  chmod 777 /usr/local/www/apache24/data/design/
  chmod 777 /usr/local/www/apache24/data/compiled/
  chmod 777 /usr/local/www/apache24/data/simpla/design/
  chmod 777 /usr/local/www/apache24/data/simpla/design/compiled/
}

read -p ':: Update FreeBSD system? [y/N]: ' opt
if [ "$opt" != "${opt#[Yy]}" ]; then
  system_update
fi

read -p ':: Install packages? [y/N]: '
if [ "$opt" != "${opt#[Yy]}" ]; then
  install_packages
fi

read -p ':: Add administrator user and setup privileges? [y/N]: '
if [ "$opt" != "${opt#[Yy]}" ]; then
  add_user
fi

read -p ':: Setup PHP? [y/N]: '
if [ "$opt" != "${opt#[Yy]}" ]; then
  setup_php
fi

read -p ':: Patch Apache configuration file? [y/N]: '
if [ "$opt" != "${opt#[Yy]}" ]; then
  patch_apache
fi

read -p ':: Enable and start Apache? [y/N]: '
if [ "$opt" != "${opt#[Yy]}" ]; then
  setup_apache
fi

read -p ':: Setup  MySQL? [y/N]: '
if [ "$opt" != "${opt#[Yy]}" ]; then
  setup_mysql
fi

read -p ':: Import database schema? [y/N]: '
if [ "$opt" != "${opt#[Yy]}" ]; then
  import_schema
fi

read -p ':: Set (repair) file and folder permissions? [y/N]: '
if [ "$opt" != "${opt#[Yy]}" ]; then
  set_permissions
fi

printf '\n%s\n' ':: All done!'
