FROM node:16-buster

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt update -qq \
    && apt install -y yarn \
    && rm -rf /var/lib/apt/lists/*
RUN npm install -g npm

RUN mkdir -p /app
WORKDIR /app

ENTRYPOINT ["yarn"]
