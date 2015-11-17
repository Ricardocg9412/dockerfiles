FROM debian

RUN apt-get update && apt-get install -y \
	python \
	python-pip \
    python-docutils \
	&& pip install gandi.cli

ADD ./entrypoint.sh /entrypoint.sh
#RUN rst2man --no-generator gandicli.man.rst > gandi.1.man
ENV GANDI_CONFIG /home/root/.config/gandi/config.yaml

ENTRYPOINT [ "gandi" ]
