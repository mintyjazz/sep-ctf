FROM ubuntu:18.04
RUN apt-get update
RUN apt-get install -y openssh-server

#Port listener
RUN nc -lp 1337 &

ENTRYPOINT ["tail","-f","/dev/null"]
