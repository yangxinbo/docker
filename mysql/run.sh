#!/bin/bash

docker run -d --restart=always --privileged=true -p 3306:3306 --name=promotion-db openshift/vpclub-mysql:5.7
