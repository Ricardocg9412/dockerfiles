FROM alpine:latest
MAINTAINER AJ Bowen <aj@soulshake.net>


RUN apk update && apk add \
    ca-certificates \
    curl \
    unzip \
    git \
    make \
    go \
    && rm -rf /var/cache/apk/*


ENV GO_VERSION="1.6"
RUN curl https://storage.googleapis.com/golang/go.{$GO_VERSION}.linux-amd64.tar.gz
RUN tar -C /usr/local -xzf go$GO_VERSION.linux-amd64.tar.gz
RUN echo "export PATH=$PATH:/usr/local/go/bin" >> /root/.bashrc

WORKDIR /src
RUN git clone https://github.com/cbednarski/hostess
WORKDIR /src/hostess
RUN make
RUN make install


# ENV CONSUL_VERSION 0.5.2

# RUN curl -sSL https://jesss.s3.amazonaws.com/binaries/consul/${CONSUL_VERSION}/consul -o /bin/consul \
    # && curl -sSL https://jesss.s3.amazonaws.com/binaries/curl-unix-socket -o /bin/curl-unix-socket \
    # && curl -sSL https://jesss.s3.amazonaws.com/binaries/consul/${CONSUL_VERSION}/ui.zip -o /tmp/ui.zip \
    # && unzip /tmp/ui.zip -d /usr/src/ \
    # && rm -rf /tmp/ui.zip \
    # && mv /usr/src/dist /usr/src/consul \
    # && mkdir -p /etc/consul.d/ \
    # && chmod +x /bin/consul \
    # && chmod +x /bin/curl-unix-socket \
    # && /usr/glibc/usr/bin/ldconfig /lib /usr/glibc/usr/lib

# ENTRYPOINT [ "/bin/consul" ]

