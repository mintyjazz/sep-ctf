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

RUN mkdir -p /var/www/site1/public.html
RUN chmod -R 755 /var/www
COPY index1.html /var/www/site1/public_html/index.html
COPY site1.conf /etc/apache2/sites-available/
COPY doggo.jpg /var/www/site1/public_html/
RUN a2dissite 000-default.conf
RUN a2ensite site1.conf
RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf
COPY pass /var/www/site1/public_html/
RUN chmod 755 /var/www/site1/public_html/pass
EXPOSE 80

# Add/configure users then implement challenge flags
RUN useradd -m ein
RUN echo 'ein:datadog' | chpasswd
COPY hint /home/ein/

RUN echo 'root:onthebebop' | chpasswd
COPY flag8 /home/root/
RUN chmod 700 /home/root

RUN cp /etc/shadow /tmp/.shadow.bak
RUN chmod 755 /tmp/.shadow.bak


RUN rm -f /etc/update-motd.d/*
COPY motd /etc/motd


ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile

WORKDIR /setup
COPY sshd.sh .
COPY apache2.sh .
COPY wrapper.sh .
RUN chmod +x *


CMD ["./wrapper.sh", "-D"]


