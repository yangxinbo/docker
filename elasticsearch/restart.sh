#!/bin/bash
docker rm -f elasticsearch
echo "rm success"
docker run -d --name elasticsearch  elasticsearch:1.7.5 elasticsearch -Des.node.name="vpclub-search-server" -Des.node.master=true -Des.node.name=node1
echo "run success"
