#!/usr/bin/bash


echo -e "\n USEFUL COMMAND "

docker-compose config --services 
 # |--> will list the services which will be deployed
 
docker-compose images 
 # |--> To list images used in the docker-compose file


docker-compose logs --tail=10 
# |-> Print the last 10 logs 


docker-compose  top
# |-> Display the processes running in each containers.

docker-compose down
# |-> Stop the containers launched in the docker-compose file and clean up, but don't forget to check the volumes created by the docker-compose

