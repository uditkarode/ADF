
function check_installed() {
        if [ -z "$(which ${1})" ] && [ ! -f "/bin/${1}" ]; then
                echo "FATAL ERROR: ${1^} executable not found."; exit
        fi
}


check_installed supolicy

counter=1
lines=$(wc -l coms)

cat denials | while read line; do
	eval $line
	echo "$counter / $lines patched."
	(( counter++ ))
	echo
	echo " --------------- "
	echo
done

echo "FIXES APPLIED."
