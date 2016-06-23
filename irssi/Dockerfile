FROM debian:jessie
MAINTAINER AJ Bowen <aj@soulshake.net>

RUN apk --no-cache add \
	ca-certificates

ENV LANG C.UTF-8

#RUN gpg --keyserver wwwkeys.pgp.net --recv-keys DDBEF0E1
RUN gpg --keyserver pool.sks-keyservers.net --recv-keys 7EE65E3082A5FB06AC7C368D00CCB587DDBEF0E1

ENV IRSSI_VERSION 0.8.18
ENV LIB_OTR_VERSION 4.1.0
ENV IRSSI_OTR_VERSION 1.0.0

RUN set -x \
	&& apk add --no-cache --virtual .build-deps \
		autoconf \
		automake \
		ca-certificates \
		gcc \
		glib-dev \
		gnupg \
		libc-dev \
		libgcrypt-dev \
		libtool \
		lynx \
		make \
		pkg-config \
	' \
	&& set -x \
	&& apt-get update && apt-get install -y $buildDeps --no-install-recommends \
	&& rm -rf /var/lib/apt/lists/* \
	#&& curl -sSL "http://www.irssi.org/files/irssi-${IRSSI_VERSION}.tar.bz2.sig" -o /tmp/irssi.tar.bz2.sig \
	&& curl -sSL "https://github.com/irssi/irssi/releases/download/${IRSSI_VERSION}/irssi-${IRSSI_VERSION}.tar.gz.asc" -o /tmp/irssi.tar.gz.asc \
    && curl -sSL "https://github.com/irssi/irssi/releases/download/${IRSSI_VERSION}/irssi-${IRSSI_VERSION}.tar.gz" -o /tmp/irssi.tar.gz

RUN gpg --verify /tmp/irssi.tar.gz.asc \
	&& mkdir -p /usr/src/irssi

RUN tar -xvzf /tmp/irssi.tar.gz -C /usr/src/irssi --strip-components 1 \
	&& rm /tmp/irssi.tar.gz* \
	&& cd /usr/src/irssi \
	&& ./configure \
		--enable-true-color \
		--prefix="/usr" \
		--with-bot \
		--with-proxy \
		--with-socks \
	&& make \
	&& make install

RUN curl -sSL "https://otr.cypherpunks.ca/libotr-${LIB_OTR_VERSION}.tar.gz" -o /tmp/libotr.tar.gz \
	&& curl -sSL "https://otr.cypherpunks.ca/libotr-${LIB_OTR_VERSION}.tar.gz.asc" -o /tmp/libotr.tar.gz.asc \
	&& curl -sSL "https://otr.cypherpunks.ca/gpgkey.asc" | gpg --import \
	&& gpg --verify /tmp/libotr.tar.gz.asc \
	&& mkdir -p /usr/src/libotr \
	&& tar -xzf /tmp/libotr.tar.gz -C /usr/src/libotr --strip-components 1 \
	&& rm /tmp/libotr.tar.gz \
	&& ( \
		cd /usr/src/libotr \
		&& ./configure \
			--with-pic \
			--prefix=/usr \
		&& make \
		&& make install \
	) \
	&& mkdir -p /usr/src/irssi-otr \
	&& wget "https://github.com/cryptodotis/irssi-otr/archive/v${IRSSI_OTR_VERSION}.tar.gz" -O /tmp/irssi-otr.tar.gz \
	&& mkdir -p /usr/src/irssi-otr \
	&& tar -xf /tmp/irssi-otr.tar.gz -C /usr/src/irssi-otr --strip-components 1 \
	&& rm /tmp/irssi-otr.tar.gz \
	&& ( \
		cd /usr/src/irssi-otr \
		&& wget "$PATCH_FOR_IRSSI_OTR" -O patch.diff \
		&& patch -p1 < patch.diff \
		&& ./bootstrap \
		&& ./configure \
			--prefix=/usr \
		&& make \
		&& make install \
	) \
	&& rm -rf /usr/src/irssi-$IRSSI_VERSION \
	&& rm -rf /usr/src/libotr \
	&& rm -rf /usr/src/irssi-otr \
	&& runDeps="$( \
		scanelf --needed --nobanner --recursive /usr \
			| awk '{ gsub(/,/, "\nso:", $2); print "so:" $2 }' \
			| sort -u \
			| xargs -r apk info --installed \
			| sort -u \
	)" \
	&& apk add --no-cache --virtual .irssi-rundeps $runDeps perl-libwww \
	&& apk del .build-deps

WORKDIR $HOME
VOLUME $HOME/.irssi

CMD ["irssi"]
