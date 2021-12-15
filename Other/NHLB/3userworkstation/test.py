#!/usr/bin/python3

import socket
import sys

sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
sock.connect(('192.168.150.69', 1337))
