#!/bin/bash

./sshd.sh &

./listen.sh &

while true; do sleep 1; done
