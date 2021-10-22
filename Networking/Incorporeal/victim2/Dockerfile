FROM ubuntu:latest

RUN apt-get update
RUN apt update
RUN apt install openssh-server sudo -y
RUN apt install net-tools iputils-ping -y
RUN apt install tcpdump -y
RUN service ssh start
EXPOSE 22

RUN useradd -rm -d /home/victim2 -s /bin/bash -g root -G sudo -u 1000 victim2
RUN echo "victim2:victim2" | chpasswd

CMD ["/usr/sbin/sshd","-D"]
