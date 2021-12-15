#!/bin/bash

./sshd.sh &

while true; do echo hi |  nc -lp 1337; done
