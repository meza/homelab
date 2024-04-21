#!/bin/sh

ls -la /config
ls -la /app
cp /config/config.json -f /app/src/config.json

python3 /app/mirror.py
