FROM ubuntu:16.04

RUN apt-get update && apt-get install -y openssh-server
RUN apt-get install -y ssh sudo
RUN apt-get install -y net-tools iproute2 iputils-ping
RUN service ssh start
RUN mkdir /var/run/sshd
RUN touch /etc/flag3
RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd
EXPOSE 22

RUN echo 'root:acomplexpassword' | chpasswd

CMD ["/usr/sbin/sshd", "-D"]