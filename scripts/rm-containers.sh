#! /bin/bash
# https://www.geeksforgeeks.org/remove-all-containers-and-images-in-docker
sudo docker rm $(sudo docker ps -aq)


