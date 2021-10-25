#!/bin/bash

# generate the flag
touch /home/victim1/flag.txt
echo "flag{NETWORKING_PROBLEMS_ARE_EASY}" >> /home/victim1/flag.txt

# broadcast onto the network so attacker can identify it
ping 172.16.0.255 -i 10 -b &

# self-deleting script
rm -- "$0"

# make the entrypoint a pass through that then runs the docker command
# https://stackoverflow.com/questions/39082768/what-does-set-e-and-exec-do-for-docker-entrypoint-scripts#:~:text=exec%20%22%24%40%22%20is%20typically%20used,to%20the%20command%20line%20arguments.
exec "$@"
