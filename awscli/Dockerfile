FROM debian:jessie
MAINTAINER AJ Bowen <aj@soulshake.net>

RUN apt-get upgrade -y
RUN apt-get update

RUN apt-get install -y \
    curl \
    sudo

RUN apt-get install -y \
	ca-certificates \
	groff \
	less \
    python \
    python-pip \
    python-docutils

RUN pip install awscli

ENV HOME /home/user

RUN useradd --create-home --home-dir $HOME user \
    && mkdir -p $HOME/.config/gandi \
    && chown -R user:user $HOME

RUN echo "user ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

WORKDIR $HOME
USER user

ENTRYPOINT [ "aws" ]

#RUN mkdir -p /root/.aws \
#	&& { \
#		echo '[default]'; \
#		echo 'output = json'; \
#		echo 'region = $AWS_REGION'; \
#		echo 'aws_access_key_id = $AWS_ACCESS_KEY_ID'; \
#		echo 'aws_secret_access_key = $AWS_SECRET_ACCESS_KEY'; \
#	} > /root/.aws/config
