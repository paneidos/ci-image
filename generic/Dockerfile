FROM ruby:2.3

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update -y && \
    apt-get install -y software-properties-common curl apt-transport-https lsb-release ca-certificates locales && \
    wget -O - https://packages.sury.org/php/apt.gpg | apt-key add - && \
    wget -O - https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    wget -O - https://deb.nodesource.com/gpgkey/nodesource.gpg.key | apt-key add - && \
    echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" >> /etc/apt/sources.list.d/php.list && \
    echo "deb https://deb.nodesource.com/node_6.x jessie main" >> /etc/apt/sources.list.d/nodesource.list && \
    echo "deb-src https://deb.nodesource.com/node_6.x jessie main" >> /etc/apt/sources.list.d/nodesource.list && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" >> /etc/apt/sources.list.d/yarn.list && \
    apt-get update -y && \
    apt-get install -y yarn git acl default-jre-headless mariadb-client wget && \
    locale-gen nl_NL.UTF-8 nl_NL@euro && \
    apt-get install -y php5.6-bcmath php5.6-cli php5.6-curl php5.6-dev php5.6-gd php5.6-json php5.6-mcrypt \
        php5.6-mysql php5.6-readline php5.6-xml php5.6-xsl php5.6-zip php5.6-mbstring php5.6-xdebug && \
    apt-get install -y php7.0-bcmath php7.0-cli php7.0-curl php7.0-dev php7.0-gd php7.0-mcrypt php7.0-mysql \
    php7.0-xml php7.0-xsl php7.0-zip php7.0-mbstring php7.0-xdebug && \
    apt-get install -y php7.1-bcmath php7.1-cli php7.1-curl php7.1-dev php7.1-gd php7.1-mcrypt php7.1-mysql \
    php7.1-xml php7.1-xsl php7.1-zip php7.1-mbstring php7.1-xdebug && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ADD install-composer.sh /
RUN sh -e /install-composer.sh && mv composer.phar /usr/bin/composer
ADD switch-php.sh /usr/bin/switch-php
