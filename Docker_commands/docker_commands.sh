#!/usr/bin/bash

docker search python3

docker search --filter "is-official=true" registry
#  |-> will show unofficial images

echo -e "\n\t TABLE FORMAT ..."

# To get in a Table format:
docker search --format "table {{ .Name}}\t{{.Description}}\t{{.IsOfficial}}" registry


docker image ls 
# |-> Listing image 

## List a particular image
docker images ubuntu

## To get image with version
docker images ubuntu:16.04

## To get images with id
docker images --no-trunc ubuntu:23.01

## TO pull the latest image
docker image pull nginx:latest

## To get all variant of an images locally 
docker image pull --all-tags nginx 

## To inspect an image

docker image inspect ubuntu:latest
# or inspect the image in json 
docker image inspect --format "{{json .Config}}" ubuntu:latest

## To get image history
docker image history redhat/ubi8:latest

# Map a port on container
docker container run -dit --name mycont -p host-port:container-port myimage
# OR can use:  -P --> will choose a random port  

##-------------------------Networking------
# Create a bridge networking 
docker network create --driver bridge mybridge1

docker network create --driver bridge --subnet=192.168.0.0/16 --ip-range=192.168.5.0/24 mybridge1

# Listing network 
docker network ls

# COnnect a container to a particular bridge
docker network connect mybridge mycontainer

# Start a container with a particular network
docker container run -dit --network host --name container1 image-name

# get Port associated to a container
docker port container-name

# Inspect bridge Network
docker network inspect --format "{{.Scope}}" bridge

# To disconnect to a container from a network
docker network disconnect my-bridge my-network

#Inspect Network Ip
docker inspect --format='{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' container-name