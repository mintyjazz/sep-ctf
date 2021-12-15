#!/bin/bash

./sshd.sh &

while true; do nc -lp 1337; done
