FROM ubuntu:18.04
RUN apt update
RUN apt install -y openssh-server
RUN apt install -y netcat
RUN apt install -y net-tools
RUN apt install -y sudo
RUN apt install -y iputils-ping
RUN apt-get install -y cron

#Add sudo user -- remove before going live
#RUN useradd -m -d /home/technician -s /bin/bash technician
#RUN usermod -aG sudo technician
#RUN echo "technician:helpdeskadmin" | chpasswd

#Add malicious user
RUN useradd -m -d /home/purplepanda -s /bin/bash purplepanda
RUN echo "purplepanda:m1911a1" | chpasswd
COPY --chown=purplepanda:purplepanda flag.txt /home/purplepanda/note.txt
COPY --chown=purplepanda:purplepanda les.sh /home/purplepanda/les.sh
RUN chmod u+x /home/purplepanda/les.sh

COPY rflag.txt /root/hostage_location.txt

COPY pingcheck.sh /usr/bin/pingcheck
RUN chmod 0777 /usr/bin/pingcheck
RUN echo "*/5 * * * * root /usr/bin/pingcheck 10.10.15.30" >> /etc/crontab
RUN echo  "purplepanda ALL=(ALL) NOPASSWD: /usr/sbin/ifconfig" >> /etc/sudoers

WORKDIR /setup
COPY sshd.sh .
COPY wrapper.sh .
RUN chmod +x *
CMD ["./wrapper.sh", "-D"]
