ARG ruby=3.2

FROM ruby:${ruby}

ARG ruby
ARG node=20

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get -y --no-install-recommends install wget git apt-transport-https lsb-release ca-certificates && \
    mkdir -p /etc/apt/keyrings && \
    curl -fsSL https://dl.yarnpkg.com/debian/pubkey.gpg | gpg --dearmor -o /etc/apt/keyrings/yarn.gpg && \
    curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg && \
    curl -fsSL https://www.postgresql.org/media/keys/ACCC4CF8.asc | gpg --dearmor -o /etc/apt/keyrings/pgdg.gpg && \
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_${node}.x nodistro main" >> /etc/apt/sources.list.d/nodesource.list && \
    echo "deb [signed-by=/etc/apt/keyrings/yarn.gpg] https://dl.yarnpkg.com/debian/ stable main" >> /etc/apt/sources.list.d/yarn.list && \
    echo "deb [signed-by=/etc/apt/keyrings/pgdg.gpg] http://apt.postgresql.org/pub/repos/apt/ $(lsb_release -sc)-pgdg main" >> /etc/apt/sources.list.d/pgdg.list && \
    apt-get update && \
    apt-get install -y --no-install-recommends curl openssh-client \
    nodejs yarn libpq-dev postgresql-client && apt-get clean && \
    useradd -m -d /home/ci -U -u 1000 ci

RUN (test "$ruby" = 2.6 -o "$ruby" = 2.7 && gem update --system 3.2.3 || gem update --system) && \
    (test "$ruby" = 2.6 -o "$ruby" = 2.7 && gem install bundler -v 2.4.22 --no-document || gem install bundler --no-document)

USER ci

RUN echo "gem: --no-document --user" > /home/ci/.gemrc && \
    (test "$ruby" = 2.6 -o "$ruby" = 2.7 && gem install bundler -v 2.4.22 || gem install bundler)
