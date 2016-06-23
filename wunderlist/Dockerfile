FROM python:latest
RUN pip install --upgrade pip
RUN pip install wunderpy
COPY . /src
WORKDIR /src
RUN pip install .
ENTRYPOINT ["wunderpy-cli"]
