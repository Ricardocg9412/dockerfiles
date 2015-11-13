# Run Mutt from a container

# docker run -it \
#	-v /etc/localtime:/etc/localtime:ro \
#	-e EMAIL -e EMAIL_NAME \ # pass env variables to config
#	-e EMAIL_PASS -e EMAIL_FROM \
#	-v $HOME/.gnupg:/home/user/.gnupg \ # so you can encrypt ;)
#	--name mutt \
#	jess/mutt
#
FROM debian:sid
MAINTAINER AJ Bowen <aj@soulshake.net>

RUN groupadd -g 1000 user \
	&& useradd --create-home -d /home/user -g user -u 1000 user

RUN apt-get update && apt-get install -y \
	ca-certificates \
	elinks \
	git \
	libsasl2-modules \
	lynx \
	mutt-dbg \
	mutt-patched \
	vim-nox \
	--no-install-recommends \
	&& rm -rf /var/lib/apt/lists/*

COPY entrypoint.sh /entrypoint.sh
ADD entrypoint.sh /entrypoint.sh

# a browser is necessary!
ENV BROWSER lynx

USER user
ENV HOME /home/user
ENV TERM xterm-256color
RUN mkdir -p $HOME/.mutt/cache/headers $HOME/.mutt/cache/bodies \
	&& touch $HOME/.mutt/certificates

# vim settings
RUN git clone https://github.com/jfrazelle/.vim.git $HOME/.vim \
	&& git clone https://github.com/altercation/vim-colors-solarized $HOME/.vim/bundle/vim-colors-solarized \
	&& cp $HOME/.vim/vimrc $HOME/.vimrc

ENV LANG C.UTF-8

COPY .mutt $HOME/.mutt

ENTRYPOINT ["/entrypoint.sh"]

CMD ["mutt-patched", "-F", "~/.mutt/muttrc"]
