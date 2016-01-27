# Run overdrive windows app in a container with wine
#
# docker run --rm -it \
#	-v /etc/localtime:/etc/localtime:ro \
#	--cpuset-cpus 0 \
#	-v /tmp/.X11-unix:/tmp/.X11-unix  \
#	-e DISPLAY=unix$DISPLAY \
#	--device /dev/snd:/dev/snd \
#	--name overdrive-wine \
#	soulshake/overdrive-wine bash
#
FROM soulshake/wine
MAINTAINER AJ Bowen <aj@soulshake.net>

#ADD https://d1clcicqv97n4s.cloudfront.net/ctrl/SpotifySetup.exe /usr/src/SpotifySetup.exe
#ADD http://app.overdrive.com/downloads/ODMediaConsoleSetup.msi /usr/src/ODMediaConsoleSetup.msi
ADD ODMediaConsoleSetup.msi /usr/src/ODMediaConsoleSetup.msi

#RUN echo "wine /usr/src/ODMediaConsoleSetup.msi" >> /root/.bash_history

#RUN wine msiexec /i /usr/src/ODMediaConsoleSetup.msi
CMD [ "bash" ]
