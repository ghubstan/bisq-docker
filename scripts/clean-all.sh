#! /bin/bash
# https://www.geeksforgeeks.org/remove-all-containers-and-images-in-docker
set -x
sudo docker stop $(sudo docker ps -aq)
sudo docker rm $(sudo docker ps -aq)
sudo docker rmi $(sudo docker images -q)
set +x




