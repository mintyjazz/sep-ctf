FROM ubuntu:18.04
RUN apt-get update
RUN apt-get install -y sudo
RUN apt-get install -y openssh-server
RUN apt-get install -y cron

RUN useradd -m -d /home/testuser -s /bin/bash testuser
RUN usermod -aG sudo testuser
RUN echo testuser:test | chpasswd
RUN chown -R testuser /home/testuser

WORKDIR /setup
COPY test.py .
COPY sshd.sh .
COPY wrapper.sh .
RUN chmod +x *

#Cron job
#RUN cron 
#write out current crontab
#RUN crontab -l > mycron
#echo new cron into cron fil
#RUN echo "@reboot ./setup/test.py" >> mycron
#install new cron file
#RUN crontab mycron
#RUN rm mycron

CMD ["./wrapper.sh", "-D"]
