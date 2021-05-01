ARG RUBY_VERSION
FROM ruby:$RUBY_VERSION
ARG NODE_VERSION=12

RUN apt-get update -qq
RUN apt-get install -y \
    build-essential \
    vim \
    locales \
    git \
    netcat \
    sudo

ARG UID
ENV UID $UID
ARG GID
ENV GID $GID
ARG USER=ruby
ENV USER $USER

RUN groupadd -g $GID $USER && \
    useradd -u $UID -g $USER -m $USER && \
    usermod -p "*" $USER && \
    usermod -aG sudo $USER && \
    echo "$USER ALL=NOPASSWD: ALL" >> /etc/sudoers.d/50-$USER

ENV LANG C.UTF-8

ENV BUNDLE_PATH /gems
ENV BUNDLE_HOME /gems

ENV GEM_HOME /gems
ENV GEM_PATH /gems

ENV PATH /gems/bin:$PATH

RUN mkdir -p "$GEM_HOME" && chown $USER:$USER "$GEM_HOME"
RUN mkdir -p /app && chown $USER:$USER /app

USER $USER

WORKDIR /app
