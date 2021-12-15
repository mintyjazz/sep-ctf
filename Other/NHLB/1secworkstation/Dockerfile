FROM ubuntu:18.04
RUN apt update
RUN apt install -y openssh-server
RUN apt install -y sudo
RUN apt install -y vim
RUN apt install -y ftp
RUN apt install -y netcat
RUN apt install -y binutils 

#Add users
RUN useradd -m -d /home/chief -s /bin/bash chief
RUN echo chief:kGMIiCmfip | chpasswd
RUN chown -R chief /home/chief

#Moving files onto system
RUN mkdir /home/chief/.keys/
COPY --chown=chief:chief key.txt /home/chief/key.txt
COPY --chown=chief:chief creds.txt /home/chief/.creds/
COPY --chown=chief:chief case-notes.txt /home/chief/
COPY --chown=chief:chief 20211207malware /home/chief/

WORKDIR /setup
COPY sshd.sh .
COPY wrapper.sh .
RUN chmod +x *
CMD ["./wrapper.sh", "-D"]
