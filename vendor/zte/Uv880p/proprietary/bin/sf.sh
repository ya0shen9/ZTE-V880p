#!/system/bin/sh
/system/bin/dumpsys SurfaceFlinger > /data/local/logs/logcat/sf.txt
sleep 5
busybox killall logcat
ps -t > /data/local/logs/logat/sf_ps.txt
