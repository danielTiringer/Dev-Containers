# docker-compose-symfony

A docker-compose workflow that sets up a network of containers for local Symfony development with Yarn and Webpack support.

### Install Docker

To get started, make sure you have Docker installed on your system, and then clone this repository.

### Create a Symfony app

Creating a new Symfony application is handled by spinning up a Docker container to generate it.
Keep the project name symfony (the last argument), as the containers expect to use that folder.
Different Symfony versions can be used by appending a version number, e.g. `--version=5.2`.

``` sh
docker-compose run --rm php symfony new .
```

Alternativelty, a new project can be made with Composer as well, like below:

``` sh
docker-compose run --rm php composer create-project symfony/skeleton:4.3.99 .
```

Because containers are run as `root` in Ubuntu, the files created by  the composer script are owned by `root`. To allow local editing of the Symfony application files, change the owner of the files to the current user:
``` sh
sudo chown -R $USER:$USER .
```

### Connect to the database

Modify the database credentials in the `symfony/.env` file to connect to the database container, like below:
```
DATABASE_URL="mysql://user:password@mysql:3306/database?serverVersion=5.7"
```

### Use webpack to recompile assets

A webpack container is set up to watch file changes and recompile assets. It is started automatically upon the cluster's start.
It does require extra packages to run if the `enableReactPreset()` configuration is enabled in the `webpack.config.js` that can be installed as below:

``` sh
docker-compose run --rm yarn add @babel/preset-react --dev
docker-compose run --rm yarn add react react-dom prop-types
```

### Start the containers

From the respository's root run `docker-compose up -d --build`. Open up your browser of choice to [http://localhost:8080](http://localhost:8080) and you should see your Symfony app running as intended.

Additional commands can be run from the Symfony command line, like adding composer packages, run tests. Some examples are shown below.

- `docker-compose run --rm php symfony composer require http-clinet doctrine maker phpunit`
- `docker-compose run --rm php symfony console make:entity EntityName`
- `docker-compose run --rm php symfony php bin/phpunit tests/`

Containers created and their ports (if used) are as follows:

- **nginx** - `:8080`
- **mysql** - `:3306`
- **php** - `:9000`
- **phpmyadmin** - `:8884`
- **yarn**
- **webpack**

### Troubleshooting

<!-- The following issues have occurred: -->
