# docker-compose-laravel
A pretty simplified docker-compose workflow that sets up a LEMP network of containers for local Laravel development.

## Usage

To get started, make sure you have Docker installed on your system, and then clone this repository.

Creating a new Laravel application is handled by spinning up a Composer Docker container to generate it. The script is written into the `composer.sh` shell script.
Keep the project name laravel (the last argument), as the containers expect to use that folder.
Different Laravel versions can be used by appending a version number, e.g. `laravel/laravel:5.2.29`.

```
sh composer.sh create-project --prefer-dist laravel/laravel laravel
```
Because containers are run as `root` in Ubuntu, the files created by  the composer script are owned by `root`. To allow local editing of the Laravel application files, change the owner of the files to the current user:
```
sudo chown -R $USER:$USER .
```

From the respository's root run `docker-compose up -d --build`. Open up your browser of choice to [http://localhost:8080](http://localhost:8080) and you should see your Laravel app running as intended. **Your Laravel app needs to be in the laravel directory first before bringing the containers up, otherwise the artisan container will not build, as it's missing the appropriate file.**

Three containers have been added that handle Composer, NPM, and Artisan commands without having to have these platforms installed on your local computer. Use the following command templates from your project root, modifiying them to fit your particular use case:

- `docker-compose run --rm composer update`
- `docker-compose run --rm npm run dev`
- `docker-compose run --rm artisan migrate`

Containers created and their ports (if used) are as follows:

- **nginx** - `:8080`
- **mysql** - `:3308`
- **php** - `:9000`
- **npm**
- **composer**
- **artisan**
- **phpmyadmin** - `:8884`

## Troubleshooting

The following issues have occurred:

- On certain Laravel versions (5.2 series), the index.php doesn't display and returns a 500 error. Running `sudo chmod -R 777 .` in `/storage` resolved the issue.

