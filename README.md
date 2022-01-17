# ObjectDB Docker Config

> **IMPORTANT!** This repository is in development, use at your own risk!

[ObjectDB](https://www.objectdb.com/) is a powerful Object-Oriented Database Management System (ODBMS)
whose native API is the Java Persistence API (JPA).

This repository has a basic configuration for running a server instance of ObjectDB using docker.

## Using Docker

### Build Image

```bash
docker build -t ruslanguns/java-objectdb:<TAG NAME> .
```

### Create container

```bash
docker run --rm -it -v $(pwd)/data:/home/user/db -p 6136:6136 ruslanguns/java-objectdb:latest
```

## Using Docker Compose

```bash
docker-compose up # If you want to run standalone OR
docker-compose up -d # If you want to run as daemon
```

## Limitations

Feel free to edit the config.xml file to change the configuration, but be careful with the environment variables "DB_PORT", "DB_USERNAME" and "DB_PASSWORD", since if you change them you will need to update the dockerfile and docker-compose.yml file to make it dynamic (you can see the entrypoint where I'm replacing coincidences).

## Project currently in development

If you want to contribute to this project, please, feel free to fork it and make your changes.
There are few tasks that I'm currently working on:

- [ ] fix user permission for data persistency: Issue TBC
- [ ] create a dynamic replication: Issue TBC
- [ ] document the project: Issue TBC
- [ ] refact the dockerfile: Issue TBC

## Author

Ruslan Gonzalez
Twitter: [@ruslangonzalez](https://twitter.com/ruslangonzalez)
