#FROM kalilinux/kali-rolling 
#RUN apt update && apt -yqq install kali-linux-headless
#FROM archlinux:latest
#RUN apt update
#RUN pacman -Syu --noconfirm
#
#hi
#
#RUN pacman -Sy openssh --noconfirm
#
#RUN systemctl enable sshd.service
FROM ubuntu:18.04
RUN apt update
RUN apt install -y openssh-server
RUN apt install -y netcat

#Add users
RUN useradd -m -d /home/chief -s /bin/bash chief
RUN echo chief:kGMIiCmfip | chpasswd
RUN chown -R chief /home/chief

#Moving files onto system
RUN mkdir /home/chief/.keys/
COPY --chown=chief:chief ftpkey.txt /home/chief/.keys/
COPY --chown=chief:chief case-notes.txt /home/chief/
COPY --chown=chief:chief 20211207malware /home/chief/

ENTRYPOINT ["tail","-f","/dev/null"]

