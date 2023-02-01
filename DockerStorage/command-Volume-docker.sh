# Create a Volume in docker
docker volume create myvolume1

# Start a container with a Volume
docker run -d --volume myvolume1:/var/log ubuntu:latest
 ## |-> will mount the volume myvolume1 from Host to the directroy "/var/log" in docker container


# List volume
docker volume ls

#Listing volume not mounted
docker volume ls --filter "dangling=true"

# Delete a Volume 
docker volume rm myvolume1  ## Container should detached before unmount it ...

# Inspect a mounted volume to a container
docker container inspect --format "{{json .Mounts}}" mycontainer1 | python3 -m json.tool


### On local we can get Docker volume at
/var/lib/docker/volumes/'name-of-volume-created'/_data
