FROM debian:jessie
RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y gobby-infinote infinoted
CMD gobby

# docker run --rm -it --name gobby --net=host -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=unix$DISPLAY -e QT_DEVICE_PIXEL_RATIO --entrypoint gobby soulshake/gobby
