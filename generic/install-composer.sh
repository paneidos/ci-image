#!/bin/sh -e
echo "xdebug.max_nesting_level=\"256\"" >> /etc/php/5.6/mods-available/xdebug.ini
echo "xdebug.max_nesting_level=\"256\"" >> /etc/php/7.0/mods-available/xdebug.ini
echo "xdebug.max_nesting_level=\"256\"" >> /etc/php/7.1/mods-available/xdebug.ini

EXPECTED_SIGNATURE=$(wget -q -O - https://composer.github.io/installer.sig)
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
ACTUAL_SIGNATURE=$(php -r "echo hash_file('SHA384', 'composer-setup.php');")

if [ "$EXPECTED_SIGNATURE" != "$ACTUAL_SIGNATURE" ]
then
    >&2 echo 'ERROR: Invalid installer signature'
    rm composer-setup.php
    exit 1
fi

php composer-setup.php --quiet
RESULT=$?
rm composer-setup.php
exit $RESULT
