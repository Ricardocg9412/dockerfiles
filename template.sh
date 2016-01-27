#!/bin/bash

dir_name=$(dirname "$PWD")
script_name=$(basename "$0")

# -v $HOME/.$dir_name:/root/.$dir_name \

docker run --rm -it \
    --name $script_name \
    $DOCKER_HUB_USER/$script_name "$@"
