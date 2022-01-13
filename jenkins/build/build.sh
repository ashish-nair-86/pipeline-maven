#!/bin/bash


##copy new jar to build location
cp -f java-app/target/*.jar jenkins/build/


echo "*************************"
echo " Building Docker images "
echo "*************************"


cd jenkins/build && docker-compose -f docker-compose-build.yaml build --no-cache
