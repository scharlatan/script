#!/bin/bash
if [ $# -le 0 -o $# -ge 2 ]; then
	echo "erm PATTERN"
fi

for i in `ls | grep "$1"`; do
	rm $i
done
