#! /system/bin/sh

date >> /data/local/logs/ppp.log
echo "kill pppd" >> /data/local/logs/ppp.log
busybox pid of pppd >> /data/local/logs/ppp.log
busybox killall pppd
echo "kill finished" >> /data/local/logs/ppp.log

