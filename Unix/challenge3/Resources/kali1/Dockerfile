FROM kalilinux/kali-rolling
RUN apt-get update
RUN apt-get install -y iproute2
RUN apt-get install -y less
RUN apt-get install -y openssh-server
RUN apt-get install -y apache2
RUN apt-get install -y nmap
RUN apt-get install -y steghide
RUN apt-get install -y dirb
RUN apt-get install -y cron
RUN apt-get install -y john

#Configure SSH and apache
RUN mkdir /var/run/sshd
RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd
EXPOSE 22

# Add/configure users then implement challenge flags
RUN useradd -m faye
RUN echo 'faye:easycomeeasygo' | chpasswd

RUN chmod go-rwx /usr/bin/passwd

RUN echo 'root:onthebebop' | chpasswd

RUN rm -f /etc/update-motd.d/*
COPY motd /etc/motd

COPY flag_write.sh /usr/bin/flag_write.sh
RUN chmod 700 /usr/bin/flag_write.sh

RUN chmod +s /usr/bin/cp

COPY common.txt /usr/share/dirb/wordlists/
COPY password.lst /usr/share/john/


WORKDIR /root/setup
COPY sshd.sh .
COPY wrapper.sh .
RUN chmod +x *

ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile

CMD ["./wrapper.sh", "-D"]


