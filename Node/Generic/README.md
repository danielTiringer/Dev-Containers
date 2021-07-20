
# Docker Node App

Node development Environment.


### Create new Node based application by running the attached script

With all the proper files in place, create a new Rails application within the `app` folder via `npminit.sh`:

``` bash
cd app
../Scripts/npminit.sh npm init
../Scripts/npminit.sh npm i -D nodemon
```

This creates a `package.json` file and prepares to save the dependencies.

### Install the first node modules

Install the needed dependencies with the same script.

``` bash
cd app
../Scripts/npminit.sh npm i -D nodemon
```

### Start the service

Run `docker-compose up --build` in the root directory.

### Resources

*   [Containerizing a Node.js Application for Development With Docker Compose](https://www.digitalocean.com/community/tutorials/containerizing-a-node-js-application-for-development-with-docker-compose)
*   [How to initialize a node project](https://auth0.com/blog/use-docker-to-create-a-node-development-environment/)
