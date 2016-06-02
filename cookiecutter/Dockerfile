FROM python:latest
MAINTAINER AJ Bowen <aj@soulshake.net>

RUN apt-get update
RUN pip install --upgrade pip
RUN pip install cookiecutter
RUN mkdir /src
WORKDIR /src
ENTRYPOINT ["cookiecutter"]

# docker run -ti \
#    -v $HOME/parent_dir_of_your_project:/src \
#    soulshake/cookiecutter \
#    https://github.com/audreyr/cookiecutter-pypackage
