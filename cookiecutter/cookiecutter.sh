#!/bin/bash

docker run -ti \
    -v /home/aj/git/:/src \
    soulshake/cookiecutter "$@"
    #https://github.com/audreyr/cookiecutter-pypackage
