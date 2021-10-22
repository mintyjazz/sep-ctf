FROM ubuntu:latest

RUN apt-get update
RUN apt update
RUN apt install openssh-server sudo -y
RUN apt install net-tools iputils-ping -y
RUN apt install tcpdump -y
RUN service ssh start
EXPOSE 22

RUN useradd -rm -d /home/victim1 -s /bin/bash -g root -G sudo -u 1000 victim1
RUN echo "victim1:victim1" | chpasswd

ADD docker-entrypoint.sh /usr/local/bin
RUN chmod +x /usr/local/bin/docker-entrypoint.sh
ENTRYPOINT [ "docker-entrypoint.sh" ]
CMD ["/usr/sbin/sshd","-D"]
