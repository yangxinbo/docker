#!/bin/bash
#sudo yum install epel-release
#sudo yum install -y python-pip
#sudo yum upgrade python*
#sudo pip install docker-compose

function compose-script(){
 echo home is $HOME
 echo "alias docker-compose='docker run -v \"\$(pwd)\":\"\$(pwd)\" -v /var/run/docker.sock:/var/run/docker.sock -e COMPOSE_PROJECT_NAME=\$(basename \"\$(pwd)\") -ti --rm --workdir=\"\$(pwd)\" chw717/docker-compose:latest'" >> ~/.bashrc
}
function docker-compose-install() {
if [ ! -f "$DOCKER_COMPOSE_SRC" ]; then
  echo "no src $DOCKER_COMPOSE_SRC"
  sudo docker pull chw717/docker-compose:latest
else
  echo "has src"
  sudo docker load < $DOCKER_COMPOSE_SRC
fi
echo 'install docker-compose script'
compose-script
source ~/.bashrc
#sudo docker-compose -v
}

docker-compose-install
