#! /bin/bash

. bash/functions/docker.sh


if [ -d "docker/$1" ]; then
  echo "Image $1 found."
  cd docker/$1
  export $(egrep -v '^#' .env | xargs)
  build_container $1
  push_container $profile $1 latest
else
  echo "Image $1 does not exist."
  exit 1
fi

