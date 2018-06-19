FROM golang:latest

MAINTAINER <panther93@protonmail.com>

EXPOSE 11626
EXPOSE 8000
EXPOSE 5432
EXPOSE 8006

RUN apt-get update
RUN apt-get install -y wget
RUN wget https://github.com/stellar/go/releases/download/horizon-v0.12.3/horizon-v0.12.3-linux-amd64.tar.gz
RUN tar -zvxf horizon-v0.12.3-linux-amd64.tar.gz
RUN mv horizon-v0.12.3-linux-amd64 stellar_horizon
RUN cp stellar_horizon/horizon /usr/local/bin
RUN chmod +x /usr/local/bin/horizon
RUN rm -rf horizon-v0.12.3-linux-amd64.tar.gz 

VOLUME ["/opt/stellar/horizon"]

WORKDIR /opt/stellar/horizon

ADD start.sh .
RUN ["chmod", "+x", "start.sh"]
CMD "/opt/stellar/horizon/start.sh"
