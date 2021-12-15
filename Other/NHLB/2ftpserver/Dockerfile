FROM ubuntu:18.04
RUN apt update
RUN apt install -y vim

RUN apt install -y vsftpd

WORKDIR /setup
COPY sshd.sh .
COPY wrapper.sh .
RUN chmod +x *
CMD ["./wrapper.sh", "-D"]
