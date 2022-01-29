# docker-compose-lumen

A simplified docker-compose workflow that sets up containers for local Lumen development.

### Install Docker

To get started, make sure you have Docker installed on your system, and then clone this repository.

## Create a Lumen app

Creating a new Lumen application is handled by spinning up a Composer Docker container to generate it.
Keep the project name laravel (the last argument), as the containers expect to use that folder.
Different Lumen versions can be used by appending a version number, e.g. `laravel/lumen:8.0.0`.

```
docker-compose run --rm php composer create-project --prefer-dist laravel/lumen .
```

## Configure Lumen

Remove the database parts from the Lumen `.env` file - the root env file contains db details:
```
DB_CONNECTION=pgsql
DB_HOST=postgres
```

## Start the containers

From the respository's root run `docker-compose up -d --build`. Open up your browser of choice to [http://localhost:4200](http://localhost:4200) and you should see your Lumen app running as intended.

- `docker-compose run --rm php composer update`

Containers created and their ports (if used) are as follows:

- **nginx** - `:4200`
- **postgres** - `:5432`
- **php** - `:9000`

## Troubleshooting
