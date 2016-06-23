#!/bin/bash

docker run --rm -ti \
    -v $HOME/.config/gitkraken:$HOME/.gitkraken \
    --volume /home/aj/.ssh:/home/aj/.ssh --volume /usr/local/man:/usr/local/man --volume /home/aj/.config:/home/aj/.config --volume /tmp/.X11-unix:/tmp/.X11-unix --volume /run/user:/run/user --volume /dev/log:/dev/log --volume /home/aj/git/dockerfiles/gitkraken:/home/aj/git/dockerfiles/gitkraken --volume /etc/passwd:/etc/passwd:ro --volume /etc/group:/etc/group:ro --volume /etc/localtime:/etc/localtime:ro \
    --device /dev/dri/card0:/dev/dri/card0 --device /dev/dri/controlD64:/dev/dri/controlD64 --device /dev/snd/controlC0:/dev/snd/controlC0 --device /dev/snd/controlC29:/dev/snd/controlC29 --device /dev/snd/hwC0D0:/dev/snd/hwC0D0 --device /dev/snd/pcmC0D0c:/dev/snd/pcmC0D0c --device /dev/snd/pcmC0D0p:/dev/snd/pcmC0D0p --device /dev/snd/seq:/dev/snd/seq --device /dev/snd/timer:/dev/snd/timer \
    soulshake/gitkraken "$@"
