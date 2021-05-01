ARG NODE_VERSION
ARG ENV_PORT
FROM node:$NODE_VERSION

RUN mkdir -p /home/node/app/{node_modules, scripts} && chown -R node:node /home/node/app

WORKDIR /home/node/app

COPY package*.json ./

USER node

RUN npm install

COPY --chown=node:node . .

ENV PORT $ENV_PORT
EXPOSE $ENV_PORT

CMD [ "node", "app.js" ]
