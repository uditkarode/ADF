#!/bin/bash

function check_installed() {
	if [ -z "$(which ${1})" ] && [ ! -f "/bin/${1}" ]; then
    		echo "FATAL ERROR: ${1^} executable not found."; exit
	fi
}

echo "UK SeLinux Denial Helper"
check_installed python3 ; check_installed adb
echo "CONNECT YOUR PHONE TO YOUR PC AND PRESS ENTER"
read
adb logcat -d | grep denied > sedenials
python3 policy.py | tee denials
echo && echo "These rules have also been written to a file called 'denials'."
echo "Raw captured denials have been written to a file named 'sedenials'."
