FROM golang:1.9-alpine

RUN apk add --no-cache \
    wget \
    libarchive-tools \
  && wget https://storage.googleapis.com/shellcheck/shellcheck-latest.linux.x86_64.tar.xz \
  && bsdtar -xf shellcheck-latest.linux.x86_64.tar.xz \
  && mv shellcheck-latest/shellcheck /bin \
  && rm -r shellcheck-latest shellcheck-latest.linux.x86_64.tar.xz \
  && rm -rf /var/cache/apk/*

CMD shellcheck
