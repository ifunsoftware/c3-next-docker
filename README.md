c3-next-docker
==============

## Installation

Install from Docker Hub or build from Dockerfile:

```
docker pull ifunsofware/c3-next
```
or
```
git clone https://github.com/ifunsofware/c3-next-docker.git
cd c3-next-docker
docker build -t ifunsoftware/c3-next .
```


## Run

```
docker run -d -p 8082:22 -p 8080:8080 -p 7375:7375 -p 8443:8443 ifunsoftware/c3-next
```

## How To Access

### C3 Management Console

http://\<your-server\>:8080/manage/

Basic Auth credentials:

* login: `admin`
* password: `password`

### SSH

ssh -p 8022 root@\<your-server\>

* 'root' password: `password`

### API

*TODO*

## About image

Base image of this Docker container:
https://github.com/ifunsoftware/c3-base-docker
