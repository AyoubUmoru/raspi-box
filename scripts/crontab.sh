#!/bin/bash

(crontab -l 2>/dev/null; echo "*/5 * * * * /home/pi/raspi-box/tools/monitor.Metrics.sh") | crontab -