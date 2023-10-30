# Workspace

A simple local development environment for running multiple applications, with a plug and play approach. 

---

### Requirements

- [Docker](https://www.docker.com/products/docker-desktop/)
- Bash (optionally)
- Make (optionally)

---

### Included

- __Traefik__
- __Redis__
- __RabbitMQ__
- __MySQL__
- __phpMyAdmin__
- __Mailpit__

Additionally there's a stub available to quickstart a project with __Nginx__ and __PHP__.

---

### Getting started

#### Start workspace
Before running a project make sure the workspace is started.
This can be easily done:
```
#bash
./app.sh start

#make
make start
```

All services at this point will be available.

---

#### Create a new project

```
#bash
./app.sh new

#make
make new
```
After  installation there will be a project folder available.
By default it is configured with Nginx and PHP, but feel free to change anything you desire.\
Further domain customization, such as subdomains and wildcards, is possible through Traefik router rules.

---

#### Start project
Note that the workspace environment should be started prior.

```
#bash: start specific project
./app.sh start my-project

#bash: start all projects
./app.sh start

#make: start all projects
make start
```
Additionally use Docker desktop to start a service.

---

#### Stop project
```
#bash: stop specific project
./app.sh stop my-project

#bash: stop all projects
./app.sh stop 

#make: stop all projects
make stop 
```
Additionally use Docker desktop to stop a service.

---

Feel free to play around, or suggest any issues.

> :warning: This workspace is not meant to run on a production server.
