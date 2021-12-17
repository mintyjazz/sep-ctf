#!/bin/bash

./sshd.sh &

./apache2.sh &


while true; do sleep 1; done
