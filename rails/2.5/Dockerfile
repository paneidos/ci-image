FROM ruby:2.5

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get -y --no-install-recommends install wget git apt-transport-https lsb-release ca-certificates && \
    wget -O - https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    wget -O - https://deb.nodesource.com/gpgkey/nodesource.gpg.key | apt-key add - && \
    wget -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add - && \
    echo "deb https://deb.nodesource.com/node_10.x $(lsb_release -sc) main" >> /etc/apt/sources.list.d/nodesource.list && \
    echo "deb-src https://deb.nodesource.com/node_10.x $(lsb_release -sc) main" >> /etc/apt/sources.list.d/nodesource.list && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" >> /etc/apt/sources.list.d/yarn.list && \
    echo "deb http://apt.postgresql.org/pub/repos/apt/ $(lsb_release -sc)-pgdg main" >> /etc/apt/sources.list.d/pgdg.list && \
    apt-get update && \
    apt-get install -y --no-install-recommends curl openssh-client \
    nodejs yarn libpq-dev postgresql-client && apt-get clean && \
    useradd -m -d /home/ci -U -u 1000 ci

USER ci

RUN gem install bundler --no-document
