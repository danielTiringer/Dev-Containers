# Docker Golang App With Autoreload

Dockerized Golang development Environment.

### Fine-tune the Docker configuration

Set the appropriate parameters (Go version, ports, project name in Gopath, etc) in the Dockerfile, docker-compose.yml and .env files.

### Change ownership of Go project files to current user

Because containers are run as `root` in Linux, the files created by docker-compose are _owned_ by `root`. To allow local editing of the Golang application files, change the owner of the files to the current user:

``` bash
sudo chown -R $USER:$USER .
```

### Challenges

*   Realize wasn't easy to get going, it required an install script that I found amongst the issues for the repo. The link is in the resources.

### Resources

*   [Go-autoreload with Docker containers](https://mikemadisonweb.github.io/2018/03/06/go-autoreload/)
*   [Go-Migrate with docker-compose](https://stackoverflow.com/questions/55779979/how-to-run-golang-migrate-with-docker-compose)
*   [Install Realize with a script](https://github.com/oxequa/realize/issues/229#issuecomment-450451535)
