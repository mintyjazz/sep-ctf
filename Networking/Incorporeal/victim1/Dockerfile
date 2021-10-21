FROM ubuntu:latest

RUN apt-get update
RUN apt install openssh-server sudo -y
RUN apt install net-tools iputils-ping -y

RUN useradd -rm -d /home/victim -s /bin/bash -g root -G sudo -u 1000 victim1
RUN echo "victim1:victim1" | chpasswd

RUN service ssh start
EXPOSE 22
CMD ["/usr/sbin/sshd","-D"]