# Docker Rails App

Ruby on rails development Environment.

### Create new Rails application by running commands within the container

With all the proper files in place, create a new Rails application within the `web` folder via `docker-compose`:

``` bash
docker-compose run web bundle exec rails new . --force --database=postgresql
```

This builds the container defined in `docker-compose.yml` and runs `bundle exec rails new . --force` within it, creating a new Rails application in the `web` directory. It take a couple of minutes to complete.

_Note: this overwrites the existing `Gemfile` with the necessary dependencies for Rails._

### Change ownership of Rails project files to current user

Because containers are run as `root` in Ubuntu, the files created by `rails new` are _owned_ by `root`. To allow local editing of the Rails application files, change the owner of the files to the current user:

```
	sudo chown -R $USER:$USER .
```

### Reinstall Rails-specific Gems within the container

Since the original `Gemfile` was overwritten, the container needs to install the new gems. This can be done by rebuilding the `web` container:

```
docker-compose up -d --no-deps --build web
```

### Run the local Rails development server

Finally, start the container:

```
docker-compose up
```

And visit [`http://localhost:3000`](http://localhost:3000). The default Rails homepage should show up.

### Resources

*   [Quickstart: Compose and Rails by Docker](https://docs.docker.com/compose/rails/)
*   [Rails on Docker by Thoughtbot](https://thoughtbot.com/blog/rails-on-docker)
*   [Get Docker Engine by Docker](https://docs.docker.com/install/linux/docker-ce/ubuntu/)
*   [Rails Development Environment with Docker-Compose](https://era86.github.io/2020/02/26/rails-development-environment-with-docker-compose-ubuntu-1804.html)
*   [Connect Rails to containerized PostgreSQL](https://docs.docker.com/compose/rails/)
