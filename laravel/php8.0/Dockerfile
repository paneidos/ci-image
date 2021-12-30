FROM debian:buster

ARG php=php8.0
ARG node_version=14

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get -y --no-install-recommends install wget git apt-transport-https lsb-release ca-certificates locales gnupg2 && \
    wget -O - https://packages.sury.org/php/apt.gpg | apt-key add - && \
    wget -O - https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    wget -O - https://deb.nodesource.com/gpgkey/nodesource.gpg.key | apt-key add - && \
    echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" >> /etc/apt/sources.list.d/php.list && \
    echo "deb https://deb.nodesource.com/node_${node_version}.x $(lsb_release -sc) main" >> /etc/apt/sources.list.d/nodesource.list && \
    echo "deb-src https://deb.nodesource.com/node_${node_version}.x $(lsb_release -sc) main" >> /etc/apt/sources.list.d/nodesource.list && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" >> /etc/apt/sources.list.d/yarn.list && \
    apt-get update && \
    printf "Package: php5.6-common php7.0-common php7.1-common php7.2-common php7.3-common php7.4-common php8.0-common php8.1-common\nPin: release *\nPin-Priority: -1\n" | \
        sed "s/ ${php}-common//" > /etc/apt/preferences.d/no-other-php && \
    apt-get install -y --no-install-recommends curl openssh-client zip unzip \
    nodejs yarn mariadb-client build-essential \
    ${php}-bcmath ${php}-cli ${php}-curl ${php}-gd ${php}-intl ${php}-mbstring \
    ${php}-mysql ${php}-soap ${php}-xml ${php}-xsl ${php}-zip ${php}-xdebug \
    ${php}-memcached && apt-get clean && \
    curl --silent --show-error https://getcomposer.org/installer | \
    php -- --install-dir=/usr/local/bin --filename=composer && \
    useradd -m -d /home/ci -U -u 1000 ci

USER ci

RUN composer global require "laravel/envoy"
