FROM python:2.7
MAINTAINER AJ Bowen <aj@soulshake.net>

RUN apt-get update && apt-get install -y \
    curl \
    vim \
    --no-install-recommends \
    && rm -rf /var/lib/apt/lists/*

RUN pip install jrnl
RUN echo "alias ll='ls -lahF'" >> /root/.profile
LABEL "-v $HOME/.journal"
LABEL "-v $HOME/.jrnl_config"
ENTRYPOINT ["jrnl"]
