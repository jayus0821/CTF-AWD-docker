#!/bin/bash

service nginx start

su - ctf -c "nohup python3 /home/ctf/Flaskshop/run.py &"
