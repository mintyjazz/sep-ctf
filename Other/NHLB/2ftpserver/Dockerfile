FROM ubuntu:18.04
RUN apt update
RUN apt install -y openssh-server
RUN apt install -y vsftpd
RUN apt install -y sudo
RUN apt install -y net-tools
run apt install -y vim

#Add nologin to the valid shells to enable FTP users without shell to sign in
RUN echo "/usr/sbin/nologin" >> /etc/shells
RUN sed -i "s/#write_enable=YES/write_enable=YES/" /etc/vsftpd.conf
RUN sed -i "s/#local_umask=022/local_umask=022/" /etc/vsftpd.conf

#Add sudo user
RUN useradd -m -d /home/technician -s /bin/bash technician
RUN usermod -aG sudo technician
RUN echo "technician:helpdeskadmin" | chpasswd

#Add FTP user
RUN useradd -m -d /home/filekeeper -s /usr/sbin/nologin filekeeper
RUN echo "filekeeper:hRC3lTqbA6" | chpasswd
COPY help.txt /home/filekeeper/

#Setp wrapper and execute
WORKDIR /setup
COPY sshd.sh .
COPY vsftpd.sh .
COPY wrapper.sh .
RUN chmod +x * 
CMD ["./wrapper.sh", "-D"]
