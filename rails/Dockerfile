ARG ruby=3.2

FROM ruby:${ruby}

ARG ruby
ARG node=20

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get -y --no-install-recommends install wget git apt-transport-https lsb-release ca-certificates && \
    wget -O - https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    wget -O - https://deb.nodesource.com/gpgkey/nodesource.gpg.key | apt-key add - && \
    wget -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add - && \
    echo "deb https://deb.nodesource.com/node_${node}.x $(lsb_release -sc) main" >> /etc/apt/sources.list.d/nodesource.list && \
    echo "deb-src https://deb.nodesource.com/node_${node}.x $(lsb_release -sc) main" >> /etc/apt/sources.list.d/nodesource.list && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" >> /etc/apt/sources.list.d/yarn.list && \
    echo "deb http://apt.postgresql.org/pub/repos/apt/ $(lsb_release -sc)-pgdg main" >> /etc/apt/sources.list.d/pgdg.list && \
    apt-get update && \
    apt-get install -y --no-install-recommends curl openssh-client \
    nodejs yarn libpq-dev postgresql-client && apt-get clean && \
    useradd -m -d /home/ci -U -u 1000 ci

RUN (test "$ruby" = 2.6 -o "$ruby" = 2.7 && gem update --system 3.2.3 || gem update --system) && \
    (test "$ruby" = 2.6 -o "$ruby" = 2.7 && gem install bundler -v 2.4.22 --no-document || gem install bundler --no-document)

USER ci

RUN echo "gem: --no-document --user" > /home/ci/.gemrc && \
    (test "$ruby" = 2.6 -o "$ruby" = 2.7 && gem install bundler -v 2.4.22 || gem install bundler)
