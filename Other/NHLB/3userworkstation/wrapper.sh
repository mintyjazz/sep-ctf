#!/bin/bash

./sshd.sh &

service cron start

while true; do sleep 1; done
