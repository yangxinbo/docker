#!/bin/bash
docker run -d -p 3306:3306 --privileged=true -v $PWD/mysqlConf:/etc/mysql/conf.d -v $PWD/data/mysql:/var/lib/mysql -e "MYSQL_ROOT_PASSWORD=vpclub.dev" --name dev-mysql chw717/mysql

