#!/bin/bash
if [ $# -le 1 -o $# -ge 4 ]; then
	echo "ecp [-t] FROM TO"
	exit 1
fi

if [ $# -eq 2 ]; then
	from="$1"; to="$2";
else
	if [ "$1" != '-t' ]; then
		echo "error: flag $1 not recognized, exiting" >/dev/stderr; exit 2;
	fi
	trust="1"; from="$2"; to="$3"
fi

for i in `ls | grep "$from"`; do
	j=`echo "$i" | sed "s/$from/$to/"`

	if [ -e "$j" -a "$trust" != "1" ]; then
		echo "error: not replacing $j with $i, exiting" >/dev/stderr; exit 3;
	fi
	cp "$i" "$j"
done
