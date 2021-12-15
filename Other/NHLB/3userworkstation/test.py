#!/usr/bin/python3

import socket
import sys
import time


s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

s.connect(('192.168.150.69', 1337))

while 1:
    time.sleep(1)
    continue
