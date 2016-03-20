FROM debian:jessie

RUN apt-get update && apt-get install -y \
	python \
    python-docutils

RUN apt-get install -y \
    man \
    vim \
    wget

RUN apt-get install -y \
	python-pip

ENV HOME /home/user

RUN useradd --create-home --home-dir $HOME user \
    && mkdir -p $HOME/.config/gandi \
    && chown -R user:user $HOME

RUN apt-get install -y \
    sudo

RUN echo "user ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

WORKDIR $HOME
RUN pip install gandi.cli
USER user

RUN echo "alias ll='ls -alhF'" >> $HOME/.bashrc
RUN echo "alias lr='ls -latr'" >> $HOME/.bashrc

ENTRYPOINT [ "gandi" ]

#RUN apt-get install -y wget man
#RUN wget https://github.com/Gandi/gandi.cli/blob/master/gandicli.man.rst
#RUN rst2man --no-generator gandicli.man.rst > gandi.1.man
