FROM kalilinux/kali-rolling 
RUN apt update && apt -y install kali-linux-headless

#Add users
RUN useradd -m -d /home/chief -s /bin/bash chief
RUN echo chief:kGMIiCmfip | chpasswd
RUN chown -R chief /home/chief

#Moving files onto system
RUN mkdir /home/chief/.keys/
RUN mv ftpkey.txt /home/chief/.keys/
RUN mv case-notes.txt /home/chief/
RUN mv 20211207malware /home/chief/

#Login as chief
RUN su chief
RUN echo kGMIiCmfip
