FROM node
# docker run -ti -v src:/src soulshake/marked /src/index.md

MAINTAINER AJ Bowen <aj@soulshake.net>

RUN apt-get update && apt-get install -y \
    git

RUN npm install --global https://github.com/chjj/marked.git
COPY ./src /src


RUN echo "alias ll='ls -lahF'" >> /root/.profile

CMD ["--help"]
ENTRYPOINT ["marked"]
