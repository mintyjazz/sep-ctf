#!/bin/bash

./sshd.sh &

service cron start

while true; do nc -lp 1337; done
