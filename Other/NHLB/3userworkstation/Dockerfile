FROM ubuntu:18.04
RUN apt-get update
RUN apt-get install -y sudo
RUN apt-get install -y openssh-server
RUN apt-get install -y cron
RUN apt-get install -y net-tools

RUN useradd -m -d /home/testuser -s /bin/bash testuser
RUN usermod -aG sudo testuser
RUN echo testuser:test | chpasswd
RUN chown -R testuser /home/testuser

WORKDIR /setup
COPY sshd.sh .
COPY wrapper.sh .
RUN chmod +x *

COPY mycron /etc/cron.d/mycron
RUN chmod 0644 /etc/cron.d/mycron && sudo -u testuser crontab /etc/cron.d/mycron

CMD ["./wrapper.sh", "-D"]
