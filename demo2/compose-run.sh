#! /bin/bash
sudo docker build  --force-rm --tag ubuntu-bisq .
sudo docker compose up
sudo docker run -ti --hostname ubuntu-bisq ubuntu-bisq

