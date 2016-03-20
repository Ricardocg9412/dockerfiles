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

# Install manpages. Make sure to bindmount a location contained in the `manpath` of the host
RUN sudo apt-get install -y wget man
RUN wget https://raw.githubusercontent.com/Gandi/gandi.cli/master/gandicli.man.rst
RUN rst2man --no-generator gandicli.man.rst > $HOME/gandi.1.man
RUN sudo install -g 0 -o 0 -m 0644 $HOME/gandi.1.man /usr/local/man
RUN sudo gzip /usr/local/man/gandi.1.man
RUN sudo mkdir /usr/local/man/man1
RUN sudo mv /usr/local/man/gandi.1.man.gz /usr/local/man/man1/gandi.1.gz

