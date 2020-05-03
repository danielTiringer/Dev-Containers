ARG RUBY_VERSION
FROM ruby:$RUBY_VERSION

RUN apt-get update -qq && apt-get install -y build-essential nodejs
RUN curl -sL https://deb.nodesource.com/setup_12.x | bash -
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update -qq
RUN apt-get install -y build-essential nodejs
RUN apt-get install -y yarn

RUN mkdir /app
RUN mkdir /scripts
WORKDIR /app

COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock

RUN bundle check || bundle install

COPY . /app
