# Docker Rails App

Ruby on rails development Environment.

### Select the Docker configuration

Use the *Simple* Dockerfile for regular Rails applications. If Webpack is
utilized, change the Dockerfile used in `docker-compose.yml` to the *With-Yarn*
one by updating the context.

### Designate Ruby and Rails version

Update the `Gemfile` for the desired Rails version. The Ruby version can be set in `docker-compose.yml`.

### Create new Rails application by running commands within the container

With all the proper files in place, create a new Rails application within the `Rails-Backend` folder via `docker-compose`:

``` bash
docker-compose run rails rails new . --database=postgresql
```

This builds the container defined in `docker-compose.yml` and runs `bundle exec
rails new .` within it, creating a new Rails application in the `Rails-Backend`
directory. It can take a couple of minutes to complete.

_Note: this overwrites the existing `Gemfile` with the necessary dependencies for Rails._

### Change ownership of Rails project files to current user

Because containers are run as `root` in Linux, the files created by `rails new` are _owned_ by `root`. To allow local editing of the Rails application files, change the owner of the files to the current user:

``` bash
sudo chown -R $USER:$USER .
```

### Reinstall the Gems

Depending on the Ruby and Rails versions, there might be a few dependency
conflicts. Run the command below to fix them, then the change-owner one again.

``` bash
docker-compose run rails-backend bundle update
```

### Run the local Rails development server

Finally, start the container:

``` bash
docker-compose up -d
```

And visit [`http://localhost:3000`](http://localhost:3000). The default Rails homepage should show up.

### Use Rails CLI

In order to 

``` bash
docker-compose run rails-backend bundle update
```

### Update `config/database.yml`

Install the desired driver gem, then update the database config details according to the one you want to use. Below
is postgresql example. The `host` refers to the docker container's designation in
the `docker-compose` file.

``` yml
default: &default
  adapter: postgresql
  encoding: unicode
  host: db
  port: 5432
  pool: 5
  username: user
  password: password
  
development:
  <<: *default
  database: rails_development
  
test:
  <<: *default
  database: rails_test
  
production:
  <<: *default
  database: rails_production
  username: app
  password: <%= ENV['APP_DATABASE_PASSWORD'] %>
```

Run `docker-compose run rails rake db:create` to create the database.

### Resources

*   [Quickstart: Compose and Rails by Docker](https://docs.docker.com/compose/rails/)
*   [Create Rails app using Docker](https://installvirtual.com/create-ruby-on-rails-app-using-docker/)
*   [Rails on Docker by Thoughtbot](https://thoughtbot.com/blog/rails-on-docker)
*   [Rails Development Environment with Docker-Compose](https://era86.github.io/2020/02/26/rails-development-environment-with-docker-compose-ubuntu-1804.html)
*   [Connect Rails to containerized PostgreSQL](https://docs.docker.com/compose/rails/)
*   [Enrtypoint and Guard autoreload](https://devato.com/dockerizing-a-rails-app-part-2-beefing-up-development/)
