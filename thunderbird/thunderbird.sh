tbird(){
    del_stopped thunderbird
    docker run --rm -it \
        --name thunderbird \
        -v /etc/localtime:/etc/localtime:ro \
        -v /tmp/.X11-unix:/tmp/.X11-unix \
        -v /var/lib/dbus/machine-id:/etc/machine-id \
        -v $HOME/.mozilla \
        -v $HOME/.thunderbird \
        -e G_SLICE=always-malloc \
        -e GDK_SCALE \
        -e GDK_DPI_SCALE \
        --device /dev/snd \
        --device /dev/dri \
        -e DISPLAY=$DISPLAY \
        soulshake/thunderbird
}
