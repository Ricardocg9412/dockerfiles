# Run spotify windows app in a container with wine
#
# docker run --rm -it \
#	-v /etc/localtime:/etc/localtime:ro \
#	--cpuset-cpus 0 \
#	-v /tmp/.X11-unix:/tmp/.X11-unix  \
#	-e DISPLAY=unix$DISPLAY \
#	--device /dev/snd:/dev/snd \
#	--name spotify-wine \
#	jess/spotify-wine bash
#
FROM soulshake/wine
MAINTAINER AJ Bowen

# ADD https://d1clcicqv97n4s.cloudfront.net/ctrl/SpotifySetup.exe /usr/src/SpotifySetup.exe
ADD https://dl.google.com/picasa/picasa39-setup.exe /usr/src/picasa39-setup.exe

#RUN echo "wine /usr/src/SpotifySetup.exe" > /root/.bash_history
RUN echo "wine /usr/src/picasa39-setup.exe" > /root/.bash_history
RUN wine /usr/src/picasa39-setup.exe

CMD [ "bash" ]
