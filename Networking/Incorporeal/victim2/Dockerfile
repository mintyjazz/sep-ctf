FROM ubuntu:latest

RUN apt-get update
RUN apt-get install -y openssh-server sudo
RUN apt-get install -y net-tools iproute2 iputils-ping
RUN apt-get install -y less man vim
RUN apt-get install -y tcpdump
RUN apt-get install -y netcat
RUN sed -i 's/#ListenAddress 0.0.0.0/ListenAddress 10.0.3.188:2222/' /etc/ssh/sshd_config
RUN service ssh start
EXPOSE 2222

RUN useradd -rm -d /home/victim2 -s /bin/bash -g root -G sudo -u 1000 victim2
RUN echo "victim2:victim2" | chpasswd

ADD docker-entrypoint.sh /usr/local/bin
RUN chmod +x /usr/local/bin/docker-entrypoint.sh
ENTRYPOINT [ "docker-entrypoint.sh" ]
CMD ["/usr/sbin/sshd", "-D"]
