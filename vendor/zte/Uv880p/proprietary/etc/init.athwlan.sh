#!/system/bin/sh

chmod 755 /system/wifi/*.sh
setprop wlan.default.dns1 168.95.1.1
setprop wifi.interface wlan0
setprop wifi.supplicant_scan_interval 10
setprop wifi.supp_delay_para 800
setprop wifi.wapi.supported true
setprop wifi.eng.enabled false
setprop wifi.chip.type AR_6002

#ZTE_RIL_LCF_20110609  
/system/bin/ifconfig rmnet0 mtu 1460
#ZTE_RIL_LCF_20110609 

