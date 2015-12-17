FROM debian

RUN apt-get update && apt-get install -y \
	python \
	python-pip \
    python-docutils \
	&& pip install gandi.cli

ADD ./gen-config.sh /gen-config.sh

#RUN apt-get install -y wget man
#RUN wget https://github.com/Gandi/gandi.cli/blob/master/gandicli.man.rst
#RUN rst2man --no-generator gandicli.man.rst > gandi.1.man

ENV GANDI_CONFIG /home/root/.config/gandi/config.yaml
# ENV API_ENV      # production gandi domain list
# ENV API_HOST         # allow to specify a HTTP URL to connect and to send the API commands.
# ENV API_KEY      # allow to specify an API key for the chosen environment (multiple accounts)

ENTRYPOINT [ "gandi" ]
