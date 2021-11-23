# Angular development environment

Dockerized development environment for Angular

## Usage

### Install Docker

To get started, make sure you have Docker installed on your system, and then clone this repository.

### Create new Angular application

First, copy the `env.example` file to `.env`.

Run the command below to create a new Angular application:
``` bash
docker-compose run --rm angular ng new <project name> --skip-git true --directory .
```
The Angular CLI uses `npm` by default. If `yarn` is preferred, add ` --package-manager yarn` to the end of the above command.

Because containers are run as `root`, the files created by the angular commands are owned by `root`. To allow local editing of the application files, change the owner of the files to the current user:
``` sh
sudo chown -R $USER:$USER client/
```

### Start the containers

From the repository's root run `docker-compose up -d --build`. Open up your browser of choice to [http://localhost:4200](http://localhost:4200) and you should see your Angular app running.

Additional commands can be run with `ng` and `yarn` or `npm`. Some examples are shown below.

- `docker-compose run --rm angular yarn add -D nodemon`
- `docker-compose run --rm angular ng add @angular/pwa`

Containers created and their ports (if used) are as follows:

- **angular** - `:4200`

### Troubleshooting

<!-- The following issues have occurred: -->

### Resources

- [Angular CLI reference](https://angular.io/cli)
