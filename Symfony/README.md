# docker-compose-symfony

A pretty simplified docker-compose workflow that sets up a LEMP network of containers for local Symfony development.

### Install Docker

To get started, make sure you have Docker installed on your system, and then clone this repository.

### Create a Symfony app

Creating a new Symfony application is handled by spinning up a Composer Docker container to generate it.
Keep the project name symfony (the last argument), as the containers expect to use that folder.
Different Symfony versions can be used by appending a version number, e.g. `--version=5.2`.

``` sh
docker-compose run --rm php symfony new .
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

### Troubleshooting

The following issues have occurred:


