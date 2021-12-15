#!/bin/bash

./sshd.sh &
./test.py &

while true; do sleep 1; done
