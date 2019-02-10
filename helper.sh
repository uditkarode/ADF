counter=1
lines=$(wc -l coms)

cat coms | while read line; do
	eval $line
	echo "$counter / $lines denials patched."
	(( counter++ ))
	echo
	echo " --------------- "
	echo
done

echo "FIXES APPLIED."
