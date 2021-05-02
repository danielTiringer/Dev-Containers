# Dockerized CakePHP development environment

A dockerized development environment for a CakePHP application. It comes with a webserver, a database and a database manager tool as well.

## Usage

### Install Docker

To get started, make sure you have Docker installed on your system, and then clone this repository.

### Create a CakePHP app

Creating a new CakePHP application is handled by spinning up a Docker container to generate it.
Find the details about CakePHP applications on the [Cake Framework documentation site](https://book.cakephp.org/4/en/installation.html).

```sh
docker-compose run --rm php composer create-project --prefer-dist cakephp/app:~4.2 .
```
Because containers are run as `root` in base Docker containers, the files created by  the composer script are owned by `root`. To allow local editing of the Cakeapplication files, change the owner of the files to the current user:
```sh
sudo chown -R $USER:$USER .
```

#### Connect to a database

In order to connect to a database, the following updates are required in the `php/config/app_local.php`'s `Datasources['default']` array:

``` php
            'host' => 'database',
            'username' => env('MYSQL_USER', 'my_app'),
            'password' => env('MYSQL_PASSWORD', 'secret'),
            'database' => env('MYSQL_DATABASE', 'my_app'),
```

## Start the containers

From the respository's root run `docker-compose up -d --build`. Open up your browser of choice to [http://localhost:8080](http://localhost:8080) and you should see the app running as intended.

Extra containers have been added that handle Composer commands without having to have these installed on your local computer. Use the following command templates from your project root, modifiying them to fit your particular use case:

``` sh
docker-compose run --rm php composer update
docker-compose run --rm php composer test # Runs the test suite
docker-compose run --rm php composer check # Runs the test suite and codesniffer
```

Containers created and their ports (if used) are as follows:

- **php** - `:9000`
- **nginx** - `:8080`
- **mariadb** - `:3306`
- **phpmyadmin** - `:8884`

### Troubleshooting

- Cake comes with a github actions CI workflow installed. If that is to be used, move the `php/.github` folder to the document root, add [default working directories](https://docs.github.com/en/actions/reference/workflow-syntax-for-github-actions#jobsjob_iddefaultsrun) to each job, and rename / remove all **php 7.2** references, as some of the installed dependencies are not compatible with it.

### Resources

- [CakePHP documentation](https://book.cakephp.org/4/en/quickstart.html)
