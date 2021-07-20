ARG NODE_VERSION
FROM node:${NODE_VERSION}-alpine AS yarn

RUN mkdir -p /src
WORKDIR /src

FROM yarn AS nest

RUN yarn global add @nestjs/cli
