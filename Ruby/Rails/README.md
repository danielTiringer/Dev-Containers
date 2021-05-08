# Docker Rails App

Ruby on Rails development Environment.

### Select the Docker configuration

A lot of extra containers are set up in the cluster to make it generic. Remove the services that aren't needed for the current project.

### Designate Ruby and Rails version

Update the `Gemfile` for the desired Rails version. The Ruby version can be set in `docker-compose.yml`.

### Create new Rails application by running commands within the container

With all the proper files in place, create a new Rails application within the `Rails-Backend` folder via `docker-compose`:

``` bash
docker-compose run rails bundle exec rails new . --database=postgresql
```

This builds the container defined in `docker-compose.yml` and runs `bundle exec
rails new .` within it, creating a new Rails application in the `project root`
directory. It can take a couple of minutes to complete.

_Note: this overwrites the existing `Gemfile` with the necessary dependencies for Rails._

### Reinstall the Gems

Depending on the Ruby and Rails versions, there might be a few dependency
conflicts. Run the command below to fix them, then the change-owner one again.

``` bash
docker-compose run --rm rails bundle update
```

### Run the local Rails development server

Finally, start the container:

``` bash
docker-compose up -d
```

And visit [`http://localhost:3000`](http://localhost:3000). The default Rails homepage should show up.

### Use Rails CLI

In order to run commands, spin up temporary containers:

``` bash
docker-compose run -rm rails bundle update
```

To get into the Rails command line:

``` bash
docker-compose run -rm rails bundle exec rails c
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

Run `docker-compose run --rm rails rake db:create` to create the database.

### Resources

*   [Rails development in Docker](https://dev.to/hint/rails-development-with-docker-13np)
*   [Enrtypoint and Guard autoreload](https://devato.com/dockerizing-a-rails-app-part-2-beefing-up-development/)
*   [Get Better Errors working in a container](https://github.com/BetterErrors/better_errors/issues/270#issuecomment-263125304)
