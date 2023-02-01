#!/usr/bin/bash 

docker rmi image-name
# OR
docker image rm image-name

# OR by image ID
docker rmi image-id --force

# Remove a container
docker container rm mycontainer

# Dangling all container and free resources
docker container prune

# Or remove all on the system
docker system prune 
