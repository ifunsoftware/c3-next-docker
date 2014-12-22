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
docker run -d -p 8080:8080 -p 7375:7375 -p 8443:8443 ifunsoftware/c3-next
```



