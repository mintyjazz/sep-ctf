FROM ubuntu:latest

RUN apt-get update
RUN apt install openssh-server sudo -y
RUN apt install net-tools iputils-ping -y

RUN useradd -rm -d /home/attacker -s /bin/bash -g root -G sudo -u 1000 attacker
RUN echo "attacker:attacker" | chpasswd

RUN service ssh start
EXPOSE 22
CMD ["/usr/sbin/sshd","-D"]