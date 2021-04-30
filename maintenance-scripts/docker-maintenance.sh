#!/bin/bash

cd /home/ubuntu/data-dev-jupyter-docker

echo '####################################################'
echo 'Stopping running containers (if available)...'
echo '####################################################'
docker-compose down

echo '####################################################'
echo 'Removing image ...'
echo '####################################################'
docker rmi data-dev-jupyter-docker_jupyter-data

echo '####################################################'
echo 'Start running container'
echo '####################################################'
docker-compose down