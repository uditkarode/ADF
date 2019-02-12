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
