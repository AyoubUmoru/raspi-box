#!/bin/bash

(crontab -l 2>/dev/null; echo "*/5 * * * * /home/pi/raspi-box/tools/monitorMetrics.sh >/dev/null 2>&1") | crontab -