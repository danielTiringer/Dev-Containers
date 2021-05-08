# Docker Django App

Django development Environment.

### Designate Django version and required dependencies

Add all required dependencies with their version numbers to `requirements.txt`.
These will be installed when the *Dockerfile* executes the `RUN pip install -r
requirements.txt` command.

### Create new Django application by running commands within the container

With all the proper files in place, create a new Django application within the `root` folder via `docker-compose`:

``` bash
docker-compose run --rm django-admin startproject projectname .
```

This builds the container defined in `docker-compose.yml` and initializes a new
Django project in the root directory. If another folder is preferred, modify the
`startproject` command accordingly.

### Change ownership of Rails project files to current user

Because containers are run as `root` in Linux, the files created by `rails new` are _owned_ by `root`. To allow local editing of the Rails application files, change the owner of the files to the current user:

``` bash
sudo chown -R $USER:$USER .
```

### Run the local Django development server

Start the container:

``` bash
docker-compose up -d
```

And visit [`http://localhost:8000`](http://localhost:8000). The default Django homepage should show up.

### Use Django commands and the Django CLI

In order to run commands, spin up a temp container, and issue commands:

``` bash
docker-compose run --rm django python manage.py createsuperuser
```

To enter the shell:

``` bash
docker-compose run --rm django python manage.py shell
```

### If using a database, update `projectfolder/settings.py`

The default database is SQLite. If something else is used:
* Install the desired driver by adding it to requirements.txt and rebuilding the
  container
* Update the `settings.py` file with the database details. `host` refers to the
  container's identification in `docker-compose.yml`

``` python
# settings.py
   
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.postgresql',
        'NAME': 'postgres',
        'USER': 'postgres',
        'PASSWORD': 'postgres',
        'HOST': 'db',
        'PORT': 5432,
    }
}
```

Run `docker-compose run --rm django python manage.py migrate` to create the database.

### Resources

*   [Quickstart: Compose and Django by Docker](https://docs.docker.com/compose/django/)
