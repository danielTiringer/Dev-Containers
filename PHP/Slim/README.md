# Simple dockerized Slim PHP development environment

A simple dockerized development environment for a Slim PHP application. It contains just the bare minimum to get started.

## Usage

### Install Docker

To get started, make sure you have Docker installed on your system, and then clone this repository.

### Create a Slim app

Creating a new Slim PHP application is handled by spinning up a Composer Docker container to generate it.
Find the details about slim applications on the [Slim Framework documentation site](https://www.slimframework.com/docs/v4/start/installation.html).

```sh
docker-compose run --rm composer require slim/slim:"4.*" guzzlehttp/psr7 http-interop/http-factory-guzzle
```
Because containers are run as `root` in base Docker containers, the files created by  the composer script are owned by `root`. To allow local editing of the Slim application files, change the owner of the files to the current user:
```sh
sudo chown -R $USER:$USER .
```

### Start the containers

From the respository's root run `docker-compose up -d --build`. Open up your browser of choice to [http://localhost:8080](http://localhost:8080) and you should see the app running as intended.

Extra containers have been added that handle Composer and PHPUnit commands without having to have these installed on your local computer or starting another copy of the main image. Use the following command templates from your project root, modifiying them to fit your particular use case:

``` sh
docker-compose run --rm composer update
docker-compose run --rm phpunit tests/
docker-compose run --rm phpunit --filter insert_test_name_here
```

Containers created and their ports (if used) are as follows:

- **php-apache** - `:8080`
- **composer**
- **phpunit**

### Resources

- [Slim PHP documentation](https://www.slimframework.com/docs/v4/)
