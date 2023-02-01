#!/usr/bin/bash

# Create a container withou run it
docker container create -it  --name  mycont ubuntu:latest

# STart the created container
docker container start mycont

# Stop a container
docker stop mycontainer-name


# Run a container in detached and delete it after executing
docker run -dit --rm --name mycontainer ubuntu:latest


# Reanming a container 
docker container rename mycontainer-name

