ARG NODE_VERSION
FROM node:${NODE_VERSION}-buster AS yarn

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo 'deb https://dl.yarnpkg.com/debian/ stable main' | tee /etc/apt/sources.list.d/yarn.list
RUN apt update -qq \
    && apt install -y yarn \
    && rm -rf /var/lib/apt/lists/*
RUN npm install -g npm

RUN mkdir -p /src
WORKDIR /src

FROM yarn AS nest

RUN npm install -g @nestjs/cli
