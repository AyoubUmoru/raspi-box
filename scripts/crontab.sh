#!/bin/bash

(sudo crontab -l 2>/dev/null; echo "*/1 * * * * /home/zdf/raspi-box/tools/monitorMetrics.sh >/tmp/cronny.log 2>&1") | sudo crontab