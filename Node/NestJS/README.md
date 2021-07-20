# NestJS development environment

Dockerized development environment for NestJS

## Usage

### Install Docker

To get started, make sure you have Docker installed on your system, and then clone this repository.

### Create new NestJS based application

First, copy the `src/env.example` file to `src/.env`.

Run the command below to create a new NestJS application:
``` bash
docker-compose run --rm nest new . --skip-git --package-manager yarn
```

Because containers are run as `root`, the files created by  the composer script are owned by `root`. To allow local editing of the application files, change the owner of the files to the current user:
``` sh
sudo chown -R $USER:$USER src/
```

### Start the containers

From the repository's root run `docker-compose up -d --build`. Open up your browser of choice to [http://localhost:3000](http://localhost:3000) and you should see your NestJS app running.

Additional commands can be run with Nest and Yarn. Some examples are shown below.

- `docker-compose run --rm yarn add -D nodemon`

Containers created and their ports (if used) are as follows:

- **nest**
- **yarn**
- **dev** - `:3000`

### Troubleshooting

<!-- The following issues have occurred: -->

### Resources

- [Dockerfile multi-stage build](https://docs.docker.com/develop/develop-images/multistage-build/)
- [Docker-Compose multi-stage build target](https://docs.docker.com/compose/compose-file/compose-file-v3/#target)
