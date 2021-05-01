FROM node:12-buster

RUN mkdir -p /app
WORKDIR /app

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt update -qq && apt install -y yarn
RUN npm install -g npm

ENTRYPOINT ["yarn"]
