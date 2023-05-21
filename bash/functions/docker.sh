#! /bin/bash

function build_container() {
  echo building $1
  docker image build --no-cache -t $1 .
}

function push_container() {
  profile=$1
  image=$2
  tag=$3
  docker tag $image $profile/$image:$tag
  docker push $profile/$image:$tag
}