#!/bin/bash

./sshd.sh &

./vsftpd.sh &

./check.sh &

while true; do sleep 1; done
