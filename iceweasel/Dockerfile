FROM debian:jessie
MAINTAINER Jessica Frazelle <jess@docker.com>

RUN apt-get update && apt-get install -y \
	hicolor-icon-theme \
	iceweasel \
	libgl1-mesa-dri \
	libgl1-mesa-glx \
	--no-install-recommends \
	&& rm -rf /var/lib/apt/lists/*

COPY local.conf /etc/fonts/local.conf

LABEL clink="-v /home/aj/.mozilla/firefox:/root/.mozilla/firefox"
ENTRYPOINT [ "iceweasel" ]
