FROM ubuntu:latest

RUN apt-get update
RUN apt update
RUN apt install openssh-server sudo vim -y
RUN apt install net-tools iputils-ping -y
RUN apt install tcpdump -y
RUN service ssh start
EXPOSE 22

RUN apt-get install -y --no-install-recommends vsftpd && apt-get clean && rm -rf /var/lib/apt/lists/*
RUN mkdir -p /var/run/vsftpd/empty && mkdir -p /etc/vsftpd && mkdir -p /var/ftp && mv /etc/vsftpd.conf /etc/vsftpd.orig
EXPOSE 20-21
EXPOSE 65500-65515

RUN useradd -rm -d /home/jeff -s /bin/bash -u 1000 jeff
RUN echo "jeff:12345" | chpasswd

ADD docker-entrypoint.sh /usr/local/bin
RUN chmod +x /usr/local/bin/docker-entrypoint.sh
ENTRYPOINT [ "docker-entrypoint.sh" ]
CMD ["/usr/sbin/sshd","-D"]
