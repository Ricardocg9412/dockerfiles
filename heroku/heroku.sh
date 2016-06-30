#!/bin/bash

docker run -ti --rm \
    -e HEROKU_PASSWORD \
    -v ${XDG_CONFIG_HOME}/heroku:/root/.config/heroku \
    -v ${HOME}/.cache/:/root/.cache \
    -v ${HOME}/.local/share/heroku/:/root/.local/share/heroku \
    -v ${HOME}/.heroku/:/root/.heroku \
    -v ${HOME}/.netrc:/root/.netrc \
    soulshake/heroku "$@"
