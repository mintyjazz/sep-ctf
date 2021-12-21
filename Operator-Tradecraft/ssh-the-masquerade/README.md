SSH: THE MASQUERADE
==========

Utilize forward SSH tunneling in conjuction with named pipes (control paths) to navigate through the network to the flags after a cursory survey.

ROE's:
==========
1. Terminal windows are only to be opened from op_station.
2. The only target that can be SSHed into directly from op_station is box_1.
3. SSHing directly from one target's terminal window into another target is not authorized.
4. Each SSH tunnel will utilize a separate named master pipe per target. (used in exfil/pivoting)
5. Verify the IP of each box upon gaining access to ensure you are on the correct target.
6. Use SSH flag options "-o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null" to prevent key mismatch errors.
7. Port 22 will be used on each target to SSH tunnel to. Creds are for each target are root::acomplexpassword
8. Follow the below order of operations when maneuvering through the network.
	e.g. reach box_4, back out to box_2, go to box_6, back out to box_5, go to box_8


Order of Operations:
==========
'''
                             -> box_3 -> box_4 [flag]
                            |
                            |
op_station -> box_1 -> box_2
                            |         -> box_6 [flag]
                            |        |
                             -> box_5
                                     |
                                      -> box_7 -> box_8 [flag]
'''

IP Addresses/Arbitrary Local Port to Assign:
==========
'''
op_station [YOU]: 10.42.0.2
box_1: 10.42.0.11:22
box_2: 10.42.0.12:2222
box_3: 10.42.0.13:3333
box_4: 10.42.0.14:4444
box_5: 10.42.0.15:5555
box_6: 10.42.0.16:6666
box_7: 10.42.0.17:7777
box_8: 10.42.0.18:8888
'''

Getting Started:
==========
- Connecting from op_station to the first target:
'''
	ssh -M -S /tmp/b1 -p <box_1's SSH port> -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null <box_1's username>@<box_1's IP> 
	-L127.0.0.1:<box_2's local port>:<box_2's IP>:<box_2's SSH port>
'''
- Pivoting to the next target:
'''
	ssh -M -S /tmp/b2 -p <box_2's local port> -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null <box_2's username>@127.0.0.1 
	-L127.0.0.1:<box_3's local port>:<box_3's IP>:<box_3's SSH port> -L127.0.0.1:<box_5's local port>:<box_5's IP>:<box_5's SSH port>
'''
In the above command, multiple tunnels are added to the same control path (/tmp/box_2) in one command. The "-O forward" flag can also be used after specifying the desired controlpath with the "-S" flag.

Hu/Jansen