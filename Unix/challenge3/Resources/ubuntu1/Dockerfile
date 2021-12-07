FROM ubuntu:16.04
RUN apt-get update
RUN apt-get install -y iproute2
RUN apt-get install -y less
RUN apt-get install -y openssh-server
RUN apt-get install -y apache2
RUN apt-get install -y nmap
RUN apt-get install -y netcat
RUN apt-get install -y steghide

#Configure SSH and apache
RUN mkdir /var/run/sshd
RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd
EXPOSE 22

# Add/configure users then implement challenge flags
RUN useradd -m spike
RUN echo 'spike:whateverhappens' | chpasswd

RUN chmod go-rwx /usr/bin/passwd

RUN echo 'root:onthebebop' | chpasswd
COPY flag5 /home/root/flag5
RUN chmod 700 /home/root

RUN rm -f /etc/update-motd.d/*
COPY motd /etc/motd

RUN chmod +s /bin/chown

ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile

WORKDIR /root/setup
COPY sshd.sh .
COPY wrapper.sh .
RUN chmod +x *

CMD ["./wrapper.sh", "-D"]


