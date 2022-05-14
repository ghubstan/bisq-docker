#! /bin/bash


echo "Bisq daemon docker host:"
hostname -I
echo ""
echo "CLI commands must include Bisq daemon hostname arg, e.g.,"
echo "java -jar cli.jar --host=172.17.0.2  --password=xyz getversion"
sleep 5
echo "Bisq daemon will start in 10 seconds..."
sleep 10

cd bisq-daemon-1.9.1
java -jar daemon.jar --apiPort=9998 --apiPassword=xyz

