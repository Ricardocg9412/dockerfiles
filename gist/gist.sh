#!/bin/bash

docker run -ti --rm \
    -v ${XDG_CONFIG_HOME}/.gist:/root/.gist \
    soulshake/gist "$@"
