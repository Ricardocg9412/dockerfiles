docker run --rm --ti \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -e DISPLAY=unix$DISPLAY \
    -e QT_DEVICE_PIXEL_RATIO \
    --device /dev/snd \
    soulshake/pycharm
