#!/bin/bash

echo "UK SeLinux Denial Fixer"
echo "CONNECT YOUR PHONE TO YOUR PC AND PRESS ENTER"
read
adb logcat *:E -d | grep denied > sedenials
python3 policy.py > coms
adb shell su -c mount -o rw,remount /system
adb shell su -c rm -rf /system/SeFix
adb shell su -c mkdir /system/SeFix
adb push helper.sh /sdcard/___HSH_
adb push coms /sdcard/___COMS_
adb shell su -c mv /sdcard/___HSH_ /system/SeFix/helper.sh
adb shell su -c mv /sdcard/___COMS_ /system/SeFix/coms
adb shell su -c chmod a+x /system/SeFix/helper.sh
rm sedenials coms

echo
echo "NOW EXECUTE THESE COMMANDS ON A TERMINAL EMULATOR ON YOUR PHONE:"
echo "su"
echo "cd /system/SeFix"
echo "./helper.sh"
echo
echo "THE PROCESS SHOULD START AND MAY TAKE AS LONG AS 1-2 HOURS."
echo "YOU CAN UNPLUG THE PHONE FROM THE PC NOW."
