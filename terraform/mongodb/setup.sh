#!/bin/bash
apt-get update
apt-get upgrade -y

apt-get install apt-transport-https ca-certificates curl software-properties-common -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

apt-get update
apt-get install docker-ce -y

systemctl start docker
systemctl enable docker

docker run --name mongodb -d -p 27017:27017 mongo
