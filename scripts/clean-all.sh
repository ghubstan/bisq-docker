#! /bin/bash
# https://www.geeksforgeeks.org/remove-all-containers-and-images-in-docker
set -x
sudo docker stop $(sudo docker ps -aq)
sudo docker rm -f $(sudo docker ps -aq)
sudo docker rmi -f $(sudo docker images -q)
set +x




