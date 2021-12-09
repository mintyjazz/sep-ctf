FROM ubuntu
RUN apt-get update
RUN apt-get install -y openssh-server

#Port listener
RUN nc -lp 1337 &
