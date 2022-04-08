#!/bin/bash
########################################################

## Shell Script to Build Docker Image and run.

########################################################


result=$( docker images -q apptest01angular )
if [[ -n "$result" ]]; then
  echo "image exists"
  docker rmi -f apptest01angular
else
  echo "No such image"
fi


echo "built docker images and proceeding to delete existing container"
result=$( docker ps -q -f name=apptest01angular )
if [[ $? -eq 0 ]]; then
  echo "Container exists"
   docker container rm -f apptest01angular
  echo "Deleted the existing docker container"
else
  echo "No such container"
fi

cp -a /home/francisco/estudos/azuredevops/myagent/_work/6/s/.  /home/francisco/estudos/azuredevops/myagent/_work/r5/a/

echo "build the docker image"
docker build -t apptest01angular .

echo "built docker images and proceeding to delete existing container"

echo "Deploying the updated container"

docker run -d -p 8086:80 --name apptest01angular  apptest01angular

echo "Deploying the container"
