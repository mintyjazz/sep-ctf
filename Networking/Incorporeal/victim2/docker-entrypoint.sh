#!/bin/bash

# Misconfigurations go here, or at least unusual configurations that docker compose doesn't support
ifconfig eth0 add 10.0.3.188
ifconfig eth0:0 netmask 255.255.255.252

# generate the flag
touch /home/victim2/flag.txt
echo "flag{AT_LEAST_IN_RETROSPECT}" >> /home/victim2/flag.txt

# Send traffic onto the network so attacker can identify it (ARPs are what we're looking for)
while true; do echo 'Reminder for sysadmins: remote access blocked on this subnet' | nc 172.16.3.11 4444; sleep 3;  done &
while true; do echo "Reminder for sysadmins: remote access via ssh on TCP/2222"    | nc 10.0.3.190  4444; sleep 15; done &

# self-deleting script
rm -- "$0"

# make the entrypoint a pass through that then runs the docker command
# https://stackoverflow.com/questions/39082768/what-does-set-e-and-exec-do-for-docker-entrypoint-scripts#:~:text=exec%20%22%24%40%22%20is%20typically%20used,to%20the%20command%20line%20arguments.
exec "$@"
