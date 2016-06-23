FROM golang:latest

RUN apt-get update && apt-get install -y \
    git

RUN git clone https://github.com/github/hub.git /src/hub
WORKDIR /src/hub
RUN /src/hub/script/build -o /usr/bin/hub
RUN apt-get install -y vim

#ENV GOPATH="/root/.go"
#ENV GOBIN="/bin"
#ENV PATH="$PATH:$GOPATH"
ENTRYPOINT ["hub"]
