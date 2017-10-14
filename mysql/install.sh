#!/bin/bash
storage=$1
if [ $($UID) != 0 ];then
  echo  "please run as root"
  exit
fi
os=$(echo $(lsb_release -i))
if [ "$os" == "Distributor ID: CentOS" ]; then
   　echo  "current os is $os"
       export APT_INSTALL='sudo yum --assume-yes install'
       export APT_UPDATE='sudo yum --assume-yes update'
       export APT_PURGE='sudo yum --assume-yes purge'
fi
if [ "$os" == "Distributor ID:  Ubuntu" ]; then
    　echo  "current os is $os"
   export APT_INSTALL='sudo apt-get --assume-yes install'
   export APT_UPDATE='sudo apt-get --assume-yes update'
   export APT_PURGE='sudo apt-get --assume-yes purge'
fi

MYSQL_SRC=$PWD/../docker-images-src/mysql-5.tar
MONGODBL_SRC=$PWD/../docker-images-src/mongodb.tar
REDIS_SRC=$PWD/../docker-images-src/redis-3.tar
#config docker-compose
cp -r docker-storage /
function mysql-install() {
if [ ! -f "$MYSQL_SRC" ]; then
  echo "no src $MYSQL_SRC"
  exit
else
  echo "has src"
  sudo docker load < $MYSQL_SRC
fi
}
function redis-install() {
if [ ! -f "$REDIS_SRC" ]; then
  echo "no src $REDIS_SRC"
  exit
else
  echo "has src"
  sudo docker load < $REDIS_SRC
fi
}
function mongodb-install() {
if [ ! -f "$MONGODBL_SRC" ]; then
  echo "no src $MONGODBL_SRC"
  exit
else
  echo "has src"
  sudo docker load < $MONGODBL_SRC
fi
}

if [ "$storage" == "" ]; then
    echo "Ready install mysql,redis,mongodb..."
    mysql-install
    redis-install
    mongodb-install

    pushd /docker-storage
    /usr/local/bin/docker-compose up -d mysql redis mongodb
    popd
else
    if [[ "$storage" == "mysql" ]]; then
       #statements
       mysql-install
     elif [[ "$storage" == "redis" ]]; then
       #statements
       redis-install
     elif [[ "$storage" == "mongodb" ]]; then
            #statements
       mongodb-install
     fi
     pushd /docker-storage
     /usr/local/bin/docker-compose up -d $storage
     popd
fi
echo "storage $storage install success"
docker ps
