#!/bin/bash

function check_installed() {
        if [ -z "$(which ${1})" ] && [ ! -f "/bin/${1}" ]; then
                echo "FATAL ERROR: ${1^} executable not found."; exit
        fi
}


echo "UK SeLinux Denial Fixer"
echo "PRESS ENTER TO CONTINUE"
check_installed su ; check_installed python3
read
su -c logcat *:E -d | grep denied > sedenials
python3 policy.py > denials
su -c mount -o rw,remount /system
su -c rm -rf /system/SeFix
su -c mkdir /system/SeFix
su -c cp helper.sh /system/SeFix/helper.sh
su -c cp denials /system/SeFix/denials
su -c chmod a+x /system/SeFix/helper.sh
rm sedenials denials
echo
echo "THE PROCESS SHOULD START AND MAY TAKE AS LONG AS 1-2 HOURS."
echo "PRESS ENTER TO CONTINUE"
read
cd /system/SeFix
su -c ./helper.sh
