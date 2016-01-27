overdrive(){
    docker run --rm -it \
        --cpuset-cpus 0 \
        #--device /dev/snd:/dev/snd \
        -v /tmp/.X11-unix:/tmp/.X11-unix  \
        -e DISPLAY=unix$DISPLAY \
        --name overdrive-wine \
        soulshake/overdrive-wine bash
}
        #-v /etc/localetime:/etc/localtime:ro \
