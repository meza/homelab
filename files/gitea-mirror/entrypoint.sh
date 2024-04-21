#!/bin/sh

ls -la /config
ls -la /app
cp /config/config.json /app/config.json

python3 /app/mirror.py
