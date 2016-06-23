FROM haskell:7.10
# Borrowed from https://github.com/jagregory/pandoc-docker
MAINTAINER AJ Bowen <aj@soulshake.net>

# will ease up the update process
# updating this env variable will trigger the automatic build of the Docker image
ENV PANDOC_VERSION "1.17.0.3"

# install pandoc
RUN cabal update && cabal install pandoc-${PANDOC_VERSION}

# install latex packages
RUN apt-get update -y \
  && apt-get install -y --no-install-recommends \
    texlive-latex-base \
    texlive-xetex latex-xcolor \
    texlive-math-extra \
    texlive-latex-extra \
    texlive-fonts-extra \
    texlive-bibtex-extra \
    fontconfig

RUN apt-get install -y \
    wkhtmltopdf

WORKDIR /src

ENTRYPOINT ["/root/.cabal/bin/pandoc", "--tab-stop=4"]

CMD ["--help"]
