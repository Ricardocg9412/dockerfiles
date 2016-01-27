FROM debian:jessie
RUN apt-get update --fix-missing
RUN apt-get install -y wget \
    curl \
    zenity
WORKDIR /workdir
RUN wget https://d1opms6zj7jotq.cloudfront.net/python/pycharm-professional-5.0.3.tar.gz
RUN tar xfz pycharm-professional-5.0.3.tar.gz
WORKDIR /workdir/pycharm-5.0.3/bin
RUN ./pycharm.sh
