FROM ubuntu:22.04


# OS Setup #
RUN apt-get update
RUN apt-get install -y iproute2
RUN apt-get install -y less
RUN apt-get install -y openssh-server
RUN apt-get install -y nmap
RUN apt-get install -y netcat
RUN apt-get install -y acl

# Load Resources #
COPY //secret.pcap// /tmp
COPY //flag3.sh// /tmp
COPY //no_caps_for_user_and_pass.jpg// /tmp
COPY //flag4.sh// /tmp
COPY //service.sh// /tmp
COPY //usernamepasswordnocaps.wav// /tmp
COPY //Overflow// /tmp
# Resources # 


# Restricted USER alice setup #
RUN useradd -m alice
RUN echo 'alice:1234' | chpasswd
USER alice
RUN echo "Download the pcap and carve out the file to get the credentials for the next account." >> /home/alice/flag.txt
RUN mkdir /home/alice/bin
RUN chmod  744 /home/alice/bin
RUN chmod 744 /home/alice
RUN echo 'PATH=$HOME/bin' >> /home/alice/.bashrc
RUN echo 'export PATH' >> /home/alice/.bashrc
USER root
RUN cp /tmp/secret.pcap /home/alice
RUN ln -s /bin/ls /home/alice/bin/
RUN ln -s /bin/cat /home/alice/bin/
RUN ln -s /bin/clear /home/alice/bin/
RUN chsh -s /bin/rbash alice
RUN chmod 744 /home/alice/secret.pcap

# Restricted USER bob setup #
RUN useradd -m bob
RUN echo 'bob:)(*&qaz' | chpasswd
USER bob
RUN mkdir /home/bob/bin
RUN cp /tmp/no_caps_for_user_and_pass.jpg /home/bob
RUN echo "What helped us carve out the file in the previous step?" >> /home/bob/flag.txt
# FF D8 FF E0 00 10 4A 46 49 46 00 01  Magic  Bytes for .jpg #
RUN chmod 744 /home/bob/bin
RUN chmod 744 /home/bob
RUN echo 'PATH=$HOME/bin' >> /home/bob/.bashrc
RUN echo 'export PATH' >> /home/bob/.bashrc
USER root
RUN ln -s /bin/ls /home/bob/bin/
RUN ln -s /bin/cat /home/bob/bin/
RUN ln -s /bin/clear /home/bob/bin/
RUN chsh -s /bin/rbash bob


# Restricted USER charles setup #
RUN useradd -m charles
RUN echo 'charles:zsxnjm!@#' | chpasswd
USER charles
RUN echo "Find the file with size of 113kB, it will contain the next flag!" >> /home/charles/flag.txt
RUN mkdir /home/charles/bin
RUN cp /tmp/flag3.sh /home/charles
RUN chmod +x /home/charles/flag3.sh
RUN /home/charles/flag3.sh
RUN chmod 744 /home/charles/bin
RUN chmod 744 /home/charles
RUN echo 'PATH=$HOME/bin' >> /home/charles/.bashrc
RUN echo 'export PATH' >> /home/charles/.bashrc
USER root
RUN rm /home/charles/flag3.sh
RUN ln -s /bin/ls /home/charles/bin/
RUN ln -s /bin/cat /home/charles/bin/
RUN ln -s /bin/file /home/charles/bin/
RUN ln -s /bin/du /home/charles/bin/
RUN ln -s /bin/find /home/charles/bin/
RUN ln -s /bin/grep /home/charles/bin/
RUN ln -s /bin/clear /home/charles/bin/
RUN chsh -s /bin/rbash charles



# Restricted USER danny setup #
RUN useradd -m danny
RUN echo 'danny:1234TGB!' | chpasswd
USER danny
RUN mkdir /home/danny/bin
RUN cp /tmp/flag4.sh /home/danny
RUN chmod +x /home/danny/flag4.sh
RUN /home/danny/flag4.sh
RUN chmod 744 /home/danny/bin
RUN chmod 744 /home/danny
RUN echo 'PATH=$HOME/bin' >> /home/danny/.bashrc
RUN echo 'export PATH' >> /home/danny/.bashrc
USER root
RUN rm /home/danny/flag4.sh
#RUN rm /home/danny/.ignore.txt'$'\r
RUN ln -s /bin/ls /home/danny/bin/
RUN ln -s /bin/cat /home/danny/bin/
RUN ln -s /bin/clear /home/danny/bin/
RUN chsh -s /bin/rbash danny
# coolbeans&&!! 1100101011001010 2643403ED9101BE30FBB79FB9D02EDC #


# Restricted USER edward setup #
RUN useradd -m edward
RUN echo 'edward:coolbeans&&!!' | chpasswd
USER edward
RUN mkdir /home/edward/bin
RUN echo "Copy file to localhost and take a listen" >> /home/edward/flag.txt
RUN cp /tmp/usernamepasswordnocaps.wav /home/edward
RUN chmod 744 /home/edward/bin
RUN chmod 744 /home/edward
RUN echo 'PATH=$HOME/bin' >> /home/edward/.bashrc
RUN echo 'export PATH' >> /home/edward/.bashrc
USER root
RUN ln -s /bin/ls /home/edward/bin/
RUN ln -s /bin/cat /home/edward/bin/
RUN ln -s /bin/clear /home/edward/bin/
RUN chsh -s /bin/rbash edward



# Restricted USER frank setup #
RUN useradd -m frank
RUN echo 'frank:mammoth1' | chpasswd
RUN cp /tmp/Overflow /home/frank
USER frank
RUN mkdir /home/frank/bin
RUN chmod 744 /home/frank/bin
RUN chmod 744 /home/frank
RUN echo 'PATH=$HOME/bin' >> /home/frank/.bashrc
RUN echo 'export PATH' >> /home/frank/.bashrc
USER root
RUN chmod 777 /home/frank/Overflow
RUN chmod +x /home/frank/Overflow
RUN ln -s /bin/ls /home/frank/bin/
RUN ln -s /bin/cat /home/frank/bin/
RUN ln -s /bin/clear /home/frank/bin/
RUN chsh -s /bin/rbash frank





# Stupid Docker #
WORKDIR /tmp

CMD ["./service.sh", "-D", "FOREGROUND"]