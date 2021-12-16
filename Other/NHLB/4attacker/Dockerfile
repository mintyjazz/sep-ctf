FROM ubuntu:18.04
RUN apt update
RUN apt install -y openssh-server
RUN apt install -y netcat
RUN apt install -y net-tools
RUN apt install -y sudo

#Add sudo user -- remove before going live
RUN useradd -m -d /home/technician -s /bin/bash technician
RUN usermod -aG sudo technician
RUN echo "technician:helpdeskadmin" | chpasswd

#Add malicious user
RUN useradd -m -d /home/purplepanda -s /bin/bash purplepanda
RUN echo "purplepanda:m1911a1" | chpasswd

WORKDIR /setup
COPY sshd.sh .
COPY wrapper.sh .
RUN chmod +x *
CMD ["./wrapper.sh", "-D"]
