# Dockerized Zend / Laminas development environment

A dockerized development environment for a Laminas application. It comes with a webserver, a database and a database manager tool as well.

## Usage

### Install Docker

To get started, make sure you have Docker installed on your system, and then clone this repository.

### Create a Laminas app

Creating a new Laminas application is handled by spinning up a Docker container to generate it.
Find the details about Laminas applications on the [Laminas Framework documentation site](https://docs.laminas.dev/tutorials/getting-started/skeleton-application/).

``` sh
docker-compose run --rm php composer create-project -s dev laminas/laminas-mvc-skeleton .
```

Because containers are run as `root` in base Docker containers, the files created by  the composer script are owned by `root`. To allow local editing of the Cakeapplication files, change the owner of the files to the current user:

```sh
sudo chown -R $USER:$USER .
```

You should also move the `.htaccess` file from the root folder to `src/` after the skeleton is installed (the skeleton needs an empty folder).

``` sh
mv .htaccess src/
```

### Connect to a database

In order to connect to the database, add the following to `src/config/autoload/global.php`, in the `return` array:

``` php
    'db' => [
        'driver' => 'Pdo_Mysql',
        'dsn'    => 'mysql:dbname=database;host=database;charset=utf8',
        'username' => 'user',
        'password' => 'password',
    ],
```

### Start the containers

From the respository's root run `docker-compose up -d --build`. Open up your browser of choice to [http://localhost:4400](http://localhost:4400) and you should see the app running as intended.

Use the following command templates from your project root, modifiying them to fit your particular use case:

``` sh
docker-compose run --rm php composer update
```

Containers created and their ports (if used) are as follows:

- **php** - `:4400`
- **mysql** - `:3306`
- **phpmyadmin** - `:4500`

### Start after git clone

When pulling a fresh copy of a repository, installing the vendor packages are necessary, as the `vendor/` folder is in `.gitignore`.

``` sh
docker-compose run --rm php composer install
```

You may have to add extra permissions to the `data` folder:

``` sh
sudo chmod -R 777 src/data
```

Run the `.sql` files from `src/module/Blog/database` to create the required table and add some data.

## Troubleshooting


## Resources

- [Laminas documentation and tutorials](https://docs.laminas.dev/tutorials/getting-started/overview/)
