FROM ubuntu:18.04
RUN apt-get update
RUN apt-get install -y sudo
RUN apt-get install -y openssh-server
RUN apt-get install -y cron
RUN apt-get install -y net-tools

RUN useradd -m -d /home/bsmith -s /bin/bash bsmith
RUN usermod -aG sudo bsmith
RUN echo bsmith:98kj23ju18u2nkjn128u3n | chpasswd
RUN chown -R bsmith /home/bsmith
COPY --chown=bsmith:bsmith callback.py /home/bsmith/callback.py
RUN chmod 770 /home/bsmith/callback.py

#Add helpdesk user
RUN useradd -m -d /home/technician -s /bin/bash technician
RUN echo "technician:helpdeskadmin" | chpasswd
RUN usermod -aG sudo technician

#Add malicious user
RUN useradd -m -d /home/purplepanda -s /bin/bash purplepanda
RUN echo "purplepanda:m1911a1" | chpasswd

WORKDIR /setup
COPY sshd.sh .
COPY wrapper.sh .
RUN chmod +x *

COPY mycron /etc/cron.d/mycron
RUN chmod 0644 /etc/cron.d/mycron && sudo -u bsmith crontab /etc/cron.d/mycron

CMD ["./wrapper.sh", "-D"]
