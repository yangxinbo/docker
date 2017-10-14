#!/bin/bash
docker run -d -p 3306:3306 --privileged=true  -v $PWD/data/:/var/lib/mysql/data/ -e MYSQL_USER=kfman -e MYSQL_PASSWORD='Kfman123!' -e MYSQL_DATABASE=moses_user -e "MYSQL_ROOT_PASSWORD=vpclub.dev" --name dev-mysql centos/mysql-56-centos7

