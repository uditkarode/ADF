#!/bin/bash

function check_installed() {
	if [ -z "$(which ${1})" ] && [ ! -f "/bin/${1}" ]; then
    		echo "FATAL ERROR: ${1^} executable not found."; exit
	fi
}

echo "UK SeLinux Denial Fixer"
check_installed python3 ; check_installed adb
echo "CONNECT YOUR PHONE TO YOUR PC AND PRESS ENTER"
read
adb logcat *:E -d | grep denied > sedenials
python3 policy.py > denials
adb shell su -c mount -o rw,remount /system
adb shell su -c rm -rf /system/SeFix
adb shell su -c mkdir /system/SeFix
adb push helper.sh /sdcard/___HSH_
adb push coms /sdcard/___DENS_
adb shell su -c mv /sdcard/___HSH_ /system/SeFix/helper.sh
adb shell su -c mv /sdcard/___DENS_ /system/SeFix/denials
adb shell su -c chmod a+x /system/SeFix/helper.sh
rm sedenials denials

echo
echo "NOW EXECUTE THESE COMMANDS ON A TERMINAL EMULATOR ON YOUR PHONE:"
echo "su"
echo "cd /system/SeFix"
echo "./helper.sh"
echo
echo "THE PROCESS SHOULD START AND MAY TAKE AS LONG AS 1-2 HOURS."
echo "YOU CAN UNPLUG THE PHONE FROM THE PC NOW."
