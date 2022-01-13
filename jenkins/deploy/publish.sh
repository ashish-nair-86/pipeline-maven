#!/bin/bash

export IMAGE=$(sed -n '1p' /tmp/.auth)
export TAG=$(sed -n '2p' /tmp/.auth)

PASS='India@123'

docker login -u ashishnair1986 -p $PASS
cd ~/maven && docker-compose up -d
