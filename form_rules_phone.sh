#!/bin/bash

function check_installed() {
        if [ -z "$(which ${1})" ] && [ ! -f "/bin/${1}" ]; then
                echo "FATAL ERROR: ${1^} executable not found."; exit
        fi
}

echo "UK SeLinux Denial Helper"
echo "PRESS ENTER TO CONTINUE"
check_installed tee ; check_installed python3
read
logcat -d | grep denied > sedenials
python3 policy.py | tee denials
echo && echo "These rules have also been written to a file called 'denials'."
echo "Raw captured denials have been written to a file named 'sedenials'."
