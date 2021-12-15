FROM ubuntu:18.04
RUN apt update
RUN apt install -y openssh-server
RUN apt install -y netcat

#Port listener
#RUN nc -lp 1337 &

WORKDIR /setup
COPY sshd.sh .
COPY wrapper.sh .
RUN chmod +x *
CMD ["./wrapper.sh", "-D"]
