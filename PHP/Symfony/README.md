# docker-compose-symfony

A docker-compose workflow that sets up a network of containers for local Symfony development.

### Install Docker

To get started, make sure you have Docker installed on your system, and then clone this repository.

### Create a Symfony app

Creating a new Symfony application is handled by spinning up a Docker container to generate it.
Keep the project name symfony (the last argument), as the containers expect to use that folder.
Different Symfony versions can be used by appending a version number, e.g. `--version=5.2`.

``` sh
docker-compose run --rm php composer create-project symfony/skeleton .
```
If a full-on webapp is needed:
``` sh
docker-compose run --rm php composer require webapp
```

Alternativelty, a new project can be made with Composer as well, like below:

``` sh
docker-compose run --rm php composer create-project symfony/skeleton:4.3.99 .
```

Because containers are run as `root`, the files created by the commands are owned by `root`. To allow local editing of the Symfony application files, change the owner of the files to the current user:
``` sh
sudo chown -R $USER:$USER .
```

### Connect to the database

Modify the database credentials in the `src/.env` file to connect to the database container.
Find examples below:
```
DATABASE_URL="mysql://${MYSQL_USER}:${MYSQL_PASSWORD}@mysql:${MYSQL_PORT}/${MYSQL_DATABASE}?serverVersion=${MYSQL_VERSION}"
DATABASE_URL="postgresql://${POSTGRES_USER}:${POSTGRES_PASSWORD}@postgres:${POSTGRES_PORT}/${POSTGRES_DB}?serverVersion=${POSTGRES_VERSION}&charset=utf8"
```

### Start the containers

From the respository's root run `docker-compose up -d --build`. Open up your browser of choice to [http://localhost:8080](http://localhost:8080) and you should see your Symfony app running as intended.

Additional commands can be run from the command line, like adding composer packages, run tests. Some examples are shown below.

- `docker-compose run --rm php composer require http-client doctrine maker phpunit`
- `docker-compose run --rm php php bin/phpunit tests/`

Containers created and their ports (if used) are as follows:

- **nginx** - `:4600`
- **php** - `:9000`
- **mysql** - `:3306`
- **postgres** - `:5432`

### Troubleshooting

<!-- The following issues have occurred: -->

### Resources

- [Creating Symfony applications](https://symfony.com/doc/current/setup.html#creating-symfony-applications)
