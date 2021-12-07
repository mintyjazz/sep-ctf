FROM ubuntu:16.04
RUN apt-get update
RUN apt-get install -y iproute2
RUN apt-get install -y less
RUN apt-get install -y openssh-server
RUN apt-get install -y apache2
RUN apt-get install -y nmap
RUN apt-get install -y netcat
RUN apt-get install -y steghide
RUN apt-get install -y cron

#Configure SSH
RUN mkdir /var/run/sshd
RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd
EXPOSE 22

# Add/configure users then implement challenge flags
RUN useradd -m jet
RUN echo 'jet:idontknow' | chpasswd

RUN echo 'root:onthebebop' | chpasswd

COPY flag6 /tmp/.flag6
RUN touch /tmp/notaflag
RUN echo "nope not this one" > /tmp/notaflag

RUN rm -f /etc/update-motd.d/*
COPY motd /etc/motd


ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile

WORKDIR /setup
COPY sshd.sh .
COPY wrapper.sh .
COPY listen.sh .
RUN chmod +x *


CMD ["./wrapper.sh", "-D"]


