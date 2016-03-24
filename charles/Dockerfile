from debian:jessie
RUN apt-get update -y
RUN apt-get install -y wget

RUN wget -q -O - https://www.charlesproxy.com/packages/apt/PublicKey | apt-key add -

# Then add the repository to your sources:
RUN sh -c 'echo deb https://www.charlesproxy.com/packages/apt/ charles-proxy main > /etc/apt/sources.list.d/charles.list'
# Then update your sources and install Charles:

RUN apt-get install -y --force-yes apt-transport-https
RUN apt-get update -y
RUN apt-get install -y charles-proxy

ENTRYPOINT ["charles"]
