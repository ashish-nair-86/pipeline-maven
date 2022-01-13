#!/bin/bash

echo maven-project > /tmp/.auth
echo $BUILD_TAG >> /tmp/.auth
echo $PASS >> /tmp/.auth


/bin/scp -o StrictHostKeyChecking=no /tmp/.auth prod_user@172.18.0.6:/tmp
/bin/scp -o StrictHostKeyChecking=no jenkins/deploy/publish.sh prod_user@172.18.0.6:/tmp

ssh  prod_user@172.18.0.6 "/tmp/publish.sh"
