FROM ubuntu
RUN apt-get update
RUN apt-get install -y openssh-server
RUN apt-get install -y apache2
RUN apt-get install -y php libapache2-mod-php
RUN apt-get install -y sudo
RUN apt-get install -y man
RUN apt-get install -y less
RUN apt-get install -y locate
RUN apt-get install -y python
RUN apt-get install -y vim
RUN apt-get install -y ncat

#Configure SSH server
RUN mkdir /var/run/sshd
EXPOSE 22

#Copy website into root and configure Apache2
RUN mkdir /var/www/coffeepoint/
COPY --chown=www-data:www-data  html/ /var/www/coffeepoint/
RUN sed -i 's/html/coffeepoint/' /etc/apache2/sites-available/000-default.conf
RUN sed -i 's/upload_max_filesize = 2M/upload_max_filesize = 25M/' /etc/php/7.4/apache2/php.ini
RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf
COPY --chown=www-data:www-data  www-flag.txt /var/www/flag.txt
RUN chown www-data:www-data /var/www/coffeepoint
RUN chmod 660 /var/www/flag.txt
EXPOSE 80

#Copy in root flag
COPY root-flag.txt /root/flag.txt
RUN chmod 200 /root/flag.txt

#Add webmaster user and set password, copy flag to home directory
RUN useradd -m -d /home/arogers -s /bin/bash arogers
RUN echo "arogers:dr0wssap" | chpasswd 
RUN mkdir -p  /home/arogers/Documents/Personal/
COPY --chown=arogers:arogers arogers-flag.txt /home/arogers/Documents/Personal/rememberme.txt
RUN chown -R  arogers:arogers /home/arogers/
RUN chmod -R 660 /home/arogers/Documents/Personal/
COPY --chown=arogers:arogers backup.py /home/arogers/backup.py
COPY --chown=arogers:arogers backup-instructions.txt /home/arogers/backup-instructions.txt


#Add additional users
RUN useradd -m -d /home/yacosta -s /bin/bash yacosta
RUN echo "yacosta:ihL4uIpVxF" | chpasswd

RUN useradd -m -d /home/gsamuels -s /bin/bash gsamuels
RUN echo "gsamuels:yiDx4HAFPa" | chpasswd

RUN useradd -m -d /home/bsmith -s /bin/bash bsmith
RUN echo "bsmith:ilovecoffee" | chpasswd
RUN mkdir /home/bsmith/Documents
COPY --chown=bsmith:bsmith secret-recipe.txt /home/bsmith/Documents/secret-recipe.txt
RUN chown -R bsmith:bsmith /home/bsmith/
RUN chmod -R 660 /home/bsmith/Documents/

RUN useradd -m -d /home/eselby -s /bin/bash eselby
RUN echo "eselby:my6txIU5ej" | chpasswd

RUN useradd -m -d /home/jharrison -s /bin/bash jharrison
RUN echo "jharrison:HKuXUIhz8z" | chpasswd

RUN useradd -m -d /home/tandrews -s /bin/bash tandrews
RUN echo "tandrews:vCin83gpV5" | chpasswd

#Add sudo privileges
RUN echo  "arogers ALL=(ALL) NOPASSWD: /usr/bin/python3 /home/arogers/backup.py" >> /etc/sudoers
RUN echo  "bsmith  ALL=(ALL) NOPASSWD: /usr/bin/cp /home/bsmith/Documents/secret-recipe.txt /media/usb" >> /etc/sudoers

#Add SUID bit for privesc
#RUN chmod +s /usr/bin/less
RUN chmod u+s /usr/bin/find

WORKDIR /setup
COPY apache2.sh .
COPY sshd.sh .
COPY wrapper.sh .
RUN chmod +x *
CMD ["./wrapper.sh", "-D"]

