# https://spideroak.com/getbuild?platform=ubuntu&arch=x86_64
# vim: ft=dockerfile
FROM centos:7
MAINTAINER Johan Stenqvist <johan@stenqvist.net>
LABEL Description="SpiderOAK client"

RUN \
    yum -y install nmap-ncat \
    && curl -Ls 'https://spideroak.com/getbuild?platform=fedora&arch=x86_64' -o spideroak.rpm \
        && rpm -i spideroak.rpm \
        && rm -f spideroak.rpm \
    && curl -Ls https://github.com/stedolan/jq/releases/download/jq-1.5/jq-linux64 -o /bin/jq \
        && chmod +x /bin/jq

RUN yum -y install git
WORKDIR /src
RUN git clone https://github.com/neochrome/docker-spideroak
WORKDIR /src/docker-spideroak
ENTRYPOINT ["bash"]
#ENTRYPOINT ["./run.sh"]
#CMD ["--headless"]
