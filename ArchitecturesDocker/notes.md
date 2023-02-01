## Docker Client
- Docker CLI
- Docker API


## Docker Host 
 - Docker daemon
 - Containers
 - Images

## Docker Registry
 - Images

## Dockerfile
- A sequential set of instruction for Docker Engine
- Primarry way of interacting with Docker
- Order of sequence is important !
- Each instruction creates a layer
- Layers can be cached and reused by Docker

## Dockerfile Structure
1. Fundamental Instructions
    
    ARG CODE_VERSION=latest ==> It specifies the version code to be used
    FROM redhat/ubi8:{CODE_VERSION}
    RUN yum apt update -y
    CMD [" bash "]

2. Configuration Instructions
   
   RUN yum update 

3. Expose Instructions
   EXPOSE 80

## Stages of Containerization
- Dockerfile ---> Build
- Container  ---> Run
- Docker image ---> Ship

***What do we need to interact with Docker ? ***
```Diff 
@@ Ans: Docker Client @@
```

*** Docker containers can't communicate directly to Docker daemon ***

*** ENV --> should be used to set $PATH of an application in container? Yes ***


## Docker Image
```Diff
@@ A stack of multiple layers created from Dockerfile Instructions
@@ Each layer apart from the top one is R/O @@
@@ The top layer is R/W @@
@@ Recognized by name or Image ID @@
They are pushed to and can be pulled from Docker Hub @@
```

> `` Tmpfs can be used to store an SSH key in docker environment ``
> `` Volume cane be  used to keep your data backed up without exposing the backup location ``
> `` Directory from R/W layer should be mounted to a volume in docker container  ``

