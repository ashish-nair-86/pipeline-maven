#!/bin/bash

echo "********************"
echo "** Pushing image ***"
echo "********************"

IMAGE="maven-project"
PASS='India@123'
echo "** Logging in ***"
docker login -u ashishnair1986 -p $PASS
echo "*** Tagging image ***"
docker tag $IMAGE:$BUILD_TAG ashishnair1986/$IMAGE:$BUILD_TAG
echo "*** Pushing image ***"
docker push ashishnair1986/$IMAGE:$BUILD_TAG
