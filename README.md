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

## Activation process

Since ObjectDB relies on MAC for activation process, and if we want to deploy using docker we can bypass the mac or use an specific mac address from where the licecence was activated.

First we need to activate licence using credentials, we can launch the docker and use it to activate the instance (after this process we need to destroy docker and recreate with the activation token):

```bash
docker exec -u 0 -it <CONTAINER NAME> java -cp objectdb.jar com.objectdb.Activator
```

Then we need to follow up the instructions and get the new activation code.

> Keep in mind that you must have a valid activation key to create an activation token.

With the activation token we need to add this to the docker-compose and then run

```bash
docker-compose down
docker-compose up -d --force-recreate
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
