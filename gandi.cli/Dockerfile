FROM debian:jessie
MAINTAINER AJ Bowen <aj@soulshake.net>

RUN apt-get update && apt-get install -y \
	python \
	python-pip \
    python-docutils

RUN pip install gandi.cli

ENTRYPOINT [ "gandi" ]

# Optional: install manpages so we can run 'man gandi' on the host
# Make sure to bindmount a location contained in the host's `manpath` at run time.
RUN sudo apt-get install -y wget man
RUN wget https://raw.githubusercontent.com/Gandi/gandi.cli/master/gandicli.man.rst
RUN rst2man --no-generator gandicli.man.rst > $HOME/gandi.1.man
RUN sudo install -g 0 -o 0 -m 0644 $HOME/gandi.1.man /usr/local/man
RUN sudo gzip /usr/local/man/gandi.1.man
RUN sudo mkdir /usr/local/man/man1
RUN sudo mv /usr/local/man/gandi.1.man.gz /usr/local/man/man1/gandi.1.gz

