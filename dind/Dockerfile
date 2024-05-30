FROM cruizba/ubuntu-dind:focal-26.1.3

# check https://github.com/cruizba/ubuntu-dind/tree/master

RUN apt update && apt install -y openssh-server iproute2

EXPOSE 22

RUN wget https://raw.githubusercontent.com/samiemostafavi/perfmeas/master/pfm -P /usr/local/bin/
RUN chmod +x /usr/local/bin/pfm

COPY entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/entrypoint.sh
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
