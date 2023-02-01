#!/usr/bin/bash
 
echo -e "Step1: Install the Prerequesites ..."
sudo apt install -y curl gnupg2 ca-certificates lsb-release ubuntu-keyring

echo -e "\nStep2: Downloading the public signing key in current folder ....."
curl https://nginx.org/keys/nginx_signing.key | gpg --dearmor \
    | sudo tee /usr/share/keyrings/nginx-archive-keyring.gpg >/dev/null
#wget https://nginx.org/keys/nginx_signing.key

echo -e "\nStep3: Step the Repository ..."

echo "deb [signed-by=/usr/share/keyrings/nginx-archive-keyring.gpg] \
http://nginx.org/packages/ubuntu `lsb_release -cs` nginx" \
    | sudo tee /etc/apt/sources.list.d/nginx.list

echo -e "\nStep4: Installing the package ..."
sudo apt update  && sudo apt  install nginx -y

echo -e "\nStep5: Checking if web server running ..."

if ps -ef | grep nginx |grep -v grep > /dev/null;
then
       sudo systemctl start nginx.service #  > /dev/null 
fi
sudo systemctl status nginx  
