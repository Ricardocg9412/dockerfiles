FROM debian:jessie
MAINTAINER AJ Bowen <aj@soulshake.net>

RUN apt-get update -y
RUN apt-get install -y \
	ca-certificates \
	groff \
	less \
	python \
	python-pip

# AWS access key.
ENV AWS_ACCESS_KEY_ID=AWS_ACCESS_KEY_ID

# AWS secret key. Access and secret key variables override credentials stored in credential and config files.
ENV AWS_SECRET_ACCESS_KEY=AWS_SECRET_ACCESS_KEY

# AWS session token. A session token is only required if you are using temporary security credentials.
ENV AWS_SESSION_TOKEN=AWS_SESSION_TOKEN

# path to a CLI config file.
ENV AWS_CONFIG_FILE=AWS_CONFIG_FILE

# name of the CLI profile to use. This can be the name of a profile stored in a credential or config file, or default to use the default profile.
ENV AWS_DEFAULT_PROFILE=AWS_DEFAULT_PROFILE

# AWS region. This variable overrides the default region of the in-use profile, if set.
ENV AWS_DEFAULT_REGION=AWS_DEFAULT_REGION

# output format (json, text, or table)
ENV AWS_DEFAULT_OUTPUT=AWS_DEFAULT_OUTPUT

# The shared credentials file. Has a default location of ~/.aws/credentials.
ENV AWS_SHARED_CREDENTIALS_FILE=AWS_SHARED_CREDENTIALS_FILE

 
#	&& rm -rf /var/cache/apk/* \
RUN pip install awscli
#RUN mkdir -p /root/.aws \
#	&& { \
#		echo '[default]'; \
#		echo 'output = json'; \
#		echo 'region = $AWS_REGION'; \
#		echo 'aws_access_key_id = $AWS_ACCESS_KEY_ID'; \
#		echo 'aws_secret_access_key = $AWS_SECRET_ACCESS_KEY'; \
#	} > /root/.aws/config

ENTRYPOINT [ "aws" ]
