FROM debian:jessie
MAINTAINER AJ Bowen <aj@soulshake.net>

RUN apt-get update && apt-get install -y \
    git \
    python-pip

RUN git clone https://github.com/soulshake/startup-threads-cli.git
WORKDIR startup-threads-cli
RUN pip install .
ENTRYPOINT ["swag"]

