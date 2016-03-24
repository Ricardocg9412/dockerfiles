FROM debian:jessie
RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install -y \
    wget \
    python

WORKDIR /src
RUN wget -nv -O- https://raw.githubusercontent.com/kovidgoyal/calibre/master/setup/linux-installer.py > linux-installer.py
RUN python2 /src/linux-installer.py
#RUN python -c "import sys; main=lambda:sys.stderr.write('Download failed\n'); exec(sys.stdin.read()); main()"

