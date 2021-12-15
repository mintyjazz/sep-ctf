#!/bin/bash

./sshd.sh &

./vsftpd.sh &

while true; do sleep 1; done
