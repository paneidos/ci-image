FROM ruby:2.6

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update -y && \
    apt-get install -y software-properties-common curl apt-transport-https lsb-release ca-certificates locales && \
    wget -O - https://packages.sury.org/php/apt.gpg | apt-key add - && \
    wget -O - https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    wget -O - https://deb.nodesource.com/gpgkey/nodesource.gpg.key | apt-key add - && \
    echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" >> /etc/apt/sources.list.d/php.list && \
    echo "deb https://deb.nodesource.com/node_14.x $(lsb_release -sc) main" >> /etc/apt/sources.list.d/nodesource.list && \
    echo "deb-src https://deb.nodesource.com/node_14.x $(lsb_release -sc) main" >> /etc/apt/sources.list.d/nodesource.list && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" >> /etc/apt/sources.list.d/yarn.list && \
    apt-get update -y && \
    apt-get install -y yarn git acl default-jre-headless mariadb-client wget && \
    locale-gen nl_NL.UTF-8 nl_NL@euro && \
    apt-get install -y --no-install-recommends php7.2-bcmath php7.2-cli php7.2-curl php7.2-gd php7.2-intl \
    php7.2-mysql php7.2-soap php7.2-xml php7.2-xsl php7.2-zip php7.2-mbstring php7.2-xdebug && \
    apt-get install -y --no-install-recommends php7.3-bcmath php7.3-cli php7.3-curl php7.3-gd php7.3-intl \
    php7.3-mysql php7.3-soap php7.3-xml php7.3-xsl php7.3-zip php7.3-mbstring php7.3-xdebug && \
    apt-get install -y --no-install-recommends php7.4-bcmath php7.4-cli php7.4-curl php7.4-gd php7.4-intl \
    php7.4-mysql php7.4-soap php7.4-xml php7.4-xsl php7.4-zip php7.4-mbstring php7.4-xdebug && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ADD install-composer.sh /
RUN sh -e /install-composer.sh && mv composer.phar /usr/bin/composer
ADD switch-php.sh /usr/bin/switch-php
