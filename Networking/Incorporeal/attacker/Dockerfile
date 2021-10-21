FROM kalilinux/kali
RUN apt-get update && apt-get install -y iproute2 tcpdump ssh sudo less man vim openssl
# alternatively, install kali-linux-headless metapackage
#WORKDIR /chal
#COPY . .

# Set up kali user.  openssl is only needed for this.  could echo -e "kali\nkali" | passwd instead
RUN useradd kali -p $(echo kali | openssl passwd -1 -stdin) -G sudo -s /usr/bin/bash -md /home/kali

RUN service ssh start
# The -e gives verbose logging to the screen
CMD ["/usr/sbin/sshd", "-D", "-e"]
EXPOSE 22
