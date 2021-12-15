FROM ubuntu:18.04
RUN apt-get update
RUN apt-get install -y sudo
RUN apt-get install -y openssh-server

WORKDIR /setup
COPY sshd.sh .
COPY wrapper.sh .
RUN chmod +x *
CMD ["./wrapper.sh", "-D"]
