FROM debian:trixie

ARG php=php8.2
ARG node=18

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get -y --no-install-recommends install wget git apt-transport-https lsb-release ca-certificates locales gnupg2 && \
    curl -fsSL https://packages.sury.org/php/apt.gpg | gpg --dearmor -o /etc/apt/keyrings/sury.gpg && \
    curl -fsSL https://dl.yarnpkg.com/debian/pubkey.gpg | gpg --dearmor -o /etc/apt/keyrings/yarn.gpg && \
    curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg && \
    curl -fsSL https://www.postgresql.org/media/keys/ACCC4CF8.asc | gpg --dearmor -o /etc/apt/keyrings/pgdg.gpg && \
    echo "deb [signed-by=/etc/apt/keyrings/sury.gpg] https://packages.sury.org/php/ $(lsb_release -sc) main" >> /etc/apt/sources.list.d/php.list && \
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_${node}.x nodistro main" >> /etc/apt/sources.list.d/nodesource.list && \
    echo "deb [signed-by=/etc/apt/keyrings/yarn.gpg] https://dl.yarnpkg.com/debian/ stable main" >> /etc/apt/sources.list.d/yarn.list && \
    echo "deb [signed-by=/etc/apt/keyrings/pgdg.gpg] http://apt.postgresql.org/pub/repos/apt/ $(lsb_release -sc)-pgdg main" >> /etc/apt/sources.list.d/pgdg.list && \
    apt-get update && \
    printf "Package: php5.6-common php7.0-common php7.1-common php7.2-common php7.3-common php7.4-common php8.0-common php8.1-common php8.2-common\nPin: release *\nPin-Priority: -1\n" | \
        sed s/${php}-common// > /etc/apt/preferences.d/no-other-php && \
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
