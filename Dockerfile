FROM ubuntu:20.04

RUN apt update && apt install -y openssh-server iproute2

EXPOSE 22

RUN wget https://raw.githubusercontent.com/samiemostafavi/perfmeas/master/pfm -P /usr/local/bin/
RUN chmod +x /usr/local/bin/pfm

COPY entrypoint.sh /tmp/entrypoint.sh
RUN chmod +x /tmp/entrypoint.sh
ENTRYPOINT ["/tmp/entrypoint.sh"]
