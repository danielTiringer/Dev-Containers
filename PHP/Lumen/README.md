# docker-compose-lumen
A simplified docker-compose workflow that sets up containers for local Lumen development.

### Install Docker

To get started, make sure you have Docker installed on your system, and then clone this repository.

## Create a Lumen app

Creating a new Laravel application is handled by spinning up a Composer Docker container to generate it.
Keep the project name laravel (the last argument), as the containers expect to use that folder.
Different Laravel versions can be used by appending a version number, e.g. `laravel/laravel:5.2.29`.

```
docker-compose run --rm php composer create-project --prefer-dist laravel/lumen .
```

## Configure Lumen

Update the following in the Laravel `.env` file:
```
DB_CONNECTION=pgsql
DB_HOST=postgres
```

## Start the containers

From the respository's root run `docker-compose up -d --build`. Open up your browser of choice to [http://localhost:8080](http://localhost:8080) and you should see your Laravel app running as intended. **Your Laravel app needs to be in the laravel directory first before bringing the containers up, otherwise the artisan container will not build, as it's missing the appropriate file.**

Three containers have been added that handle Composer, PHPUnit, NPM, and Artisan commands without having to have these platforms installed on your local computer. Use the following command templates from your project root, modifiying them to fit your particular use case:

- `docker-compose run --rm php composer update`

Containers created and their ports (if used) are as follows:

- **nginx** - `:4200`
- **postgres** - `:5432`
- **php** - `:9000`

## Troubleshooting
