#!/bin/bash
set -e
cp /tmp/puma.service /etc/systemd/system/
chmod 644 /etc/systemd/system/puma.service
systemctl enable puma.service
