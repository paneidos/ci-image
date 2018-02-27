#!/bin/sh
PHP_VERSION="${1}"

if [ ! -x "/usr/bin/php${PHP_VERSION}" ]; then
    echo "Error: PHP version $PHP_VERSION not found" >&2
    exit 1
fi

update-alternatives --set phar "/usr/bin/phar${PHP_VERSION}"
update-alternatives --set phar.phar "/usr/bin/phar.phar${PHP_VERSION}"
update-alternatives --set php "/usr/bin/php${PHP_VERSION}"
update-alternatives --set php-config "/usr/bin/php-config${PHP_VERSION}"
update-alternatives --set phpize "/usr/bin/phpize${PHP_VERSION}"
