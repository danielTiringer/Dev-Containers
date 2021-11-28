# Dockerized Spring Boot development environment

A dockerized development environment for a Spring Boot application. It uses Gradle to build and contains a database.

## Usage

### Install Docker

To get started, make sure you have Docker installed on your system, and then clone this repository.

### Create a Spring Boot app

Create a new Spring app via the [spring initializr](https://start.spring.io/). Pick the following:
- Gradle Project
- Jar Packaging
- Java version 17 (or if different, modify the `JAVA_VERSION` environmental variable)
- Dependencies:
1. Spring Boot DevTools
1. Spring Web
1. Spring Data JPA
1. Database Driver matching the chosen database implementation

Download the zipped project files and extract it, then rename its folder to `api`.

#### Connect to a database

In order to connect to a database, the following are required in the `api/src/resources/application.properties` file:

For `MySQL`:
``` jproperties
spring.datasource.url=jdbc:mysql://database-mysql:${MYSQL_PORT}/${MYSQL_DATABASE}
spring.datasource.username=${MYSQL_USER}
spring.datasource.password=${MYSQL_PASSWORD}
spring.jpa.show-sql=true
spring.jpa.hibernate.ddl-auto=update
spring.jpa.properties.hibernate.dialect=org.hibernate.dialect.MySQL8Dialect
```

For `PostGreSQL`:
``` jproperties
spring.datasource.url= jdbc:postgresql://database-postgres:${POSTGRES_PORT}/${POSTGRES_DB} 
spring.datasource.username=${POSTGRES_USER}
spring.datasource.password=${POSTGRES_PASSWORD}
spring.datasource.driver-class-name=org.postgresql.Driver
spring.jpa.show-sql=true
spring.jpa.hibernate.ddl-auto=update
spring.jpa.properties.hibernate.dialect=org.hibernate.dialect.PostgreSQLDialect
```

## Start the containers

Copy the `env.example` file to `.env`, and source it.
From the respository's root run `docker-compose up -d --build`.

Containers created and their ports (if used) are as follows:

- **spring** - `:4300`
- **mysql** - `:3306`
- **postgresql**: `:5432`

### Troubleshooting


### Resources
