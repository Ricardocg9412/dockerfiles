from debian:jessie
#RUN rm /etc/resolv.conf
#ADD resolv.conf /etc/resolv.conf
ADD entrypoint.sh /entrypoint.sh
RUN cat /etc/resolv.conf
#RUN apt-get update
EXPOSE 80:80

##RUN apt-get install -y python-software-properties
#RUN apt-get install -y software-properties-common 
#RUN sleep 2
#RUN add-apt-repository -y ppa:lookit/daily 
#RUN apt-get update
#RUN apt-get install -y lookit 
#RUN apt-get install -y python-gconf
#RUN apt-get install -y python-pip
# RUN pip install pyxdg
# CMD lookit -h
#CMD sleep 5000
