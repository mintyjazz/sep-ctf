FROM kalilinux/kali-rolling 
RUN apt update && apt -y install kali-linux-headless

#Add users
RUN adduser chief
RUN echo chief:kGMIiCmfip | chpasswd

#Moving files onto system
RUN mkdir /home/chief/.keys/
RUN mv ftpkey.txt /home/chief/.keys/
RUN mv case-notes.txt /home/chief/
RUN mv 20211207malware /home/chief/
