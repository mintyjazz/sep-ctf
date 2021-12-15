FROM kalilinux/kali-rolling 
RUN apt update && apt -yqq install kali-linux-headless
RUN apt update

RUN systemctl enable ssh.service && systemctl start ssh.service

#Add users
RUN useradd -m -d /home/chief -s /bin/bash chief
RUN echo chief:kGMIiCmfip | chpasswd
RUN chown -R chief /home/chief

#Moving files onto system
RUN mkdir /home/chief/.keys/
COPY --chown=chief:chief ftpkey.txt /home/chief/.keys/
COPY --chown=chief:chief case-notes.txt /home/chief/
COPY --chown=chief:chief 20211207malware /home/chief/

#Login as chief
RUN su chief
RUN echo kGMIiCmfip
