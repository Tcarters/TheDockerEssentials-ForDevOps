#!/usr/bin/bash

echo -e "Step1: Remove old repositiory ..."

sudo apt-get remove docker docker-engine docker.io containerd runc

echo -e "\nStep2: Update repo and Install pre-requisites"
sudo apt-get update && sudo apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

echo -e "\nStep3: Configuring repo ..."

if [ ! -d "/etc/apt/keyrings" ] 
then 
    sudo mkdir -p /etc/apt/keyrings && curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
    echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

    echo -e "\nDone ..." 
elif [ -d "/etc/apt/keyrings" ]
then
  echo -e "\nOK already exists..."
  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
    echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null ;

fi

echo -e "\nStep3: Installation ..."
sudo apt update && sudo chmod a+r /etc/apt/keyrings/docker.gpg &&
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin

echo -e "\nStep4: Updating user permission ..."
sudo groupadd docker
sudo usermod -aG docker ${USER}

echo -e "\n \n YOU NEED TO RESTART UR SYSTEM FOR PERMISSION TAKE EFFECT .."

echo -e "\n Before That let's me Test Docker "
su - ${USER}
sudo systemctl status docker.service

echo -e "\n Testing docker😋 by downloading ngnix web image ...."
docker pull tcdocker2021/ubuntu-nginx:latest


docker container run -dit --name nginx-web-app -p 8080:80 tcdocker2021/ubuntu-nginx:latest


# The nginx web server will be accessible on port 8080 on your browser 
echo -e "Access nginx web App in container running ..."
curl localhost:8080

echo -e "\n\t 😚 H😋PP😛 LE😝RNING😜 ...."
