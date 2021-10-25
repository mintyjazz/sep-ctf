FROM kalilinux/kali
RUN apt-get update && apt-get install -y iproute2 tcpdump ssh sudo less man vim openssl
# net-tools iputils-ping tcpdump

RUN useradd -rm -d /home/attacker -s /usr/bin/bash -g root -G sudo -u 1000 attacker
RUN echo "attacker:attacker" | chpasswd

RUN service ssh start
EXPOSE 22

ADD docker-entrypoint.sh /usr/local/bin
RUN chmod +x /usr/local/bin/docker-entrypoint.sh
ENTRYPOINT [ "docker-entrypoint.sh" ]
CMD ["/usr/sbin/sshd", "-D", "-e"]

