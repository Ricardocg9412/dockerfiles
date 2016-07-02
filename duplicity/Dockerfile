FROM debian:jessie
MAINTAINER AJ Bowen <aj@soulshake.net>

RUN apt-get update && apt-get install -y \
    ncftp \
    python-paramiko \
    python-pycryptopp \
    lftp python-boto \
    python-dev \
    librsync-dev \
    wget \
    python \
    python-pip

RUN pip install lockfile

ENV DUPLICITY_VERSION 0.6.26
WORKDIR /src
RUN wget https://code.launchpad.net/duplicity/0.6-series/0.6.26/+download/duplicity-${DUPLICITY_VERSION}.tar.gz \
    && tar -xvzf duplicity-${DUPLICITY_VERSION}.tar.gz \
    && rm duplicity-${DUPLICITY_VERSION}.tar.gz

WORKDIR /src/duplicity-${DUPLICITY_VERSION}
RUN python setup.py install

CMD ["--help"]
ENTRYPOINT ["duplicity"]
