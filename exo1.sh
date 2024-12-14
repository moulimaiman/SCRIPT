#!/bin/sh
m=3345
if [ ! -z $m ] ; then
	time=$m
else
	echo " Argument denied "
	exit 1
fi

min=0
hour=0

while [ $time -ge 59 ] ; do
	time=`expr $time - 60`
	let "min= min + 1"
	if [ $min -gt 59 ] ; then
		let "hour = hour + 1"
		let "min = 0"
	fi
done

echo "$hour H : $min M : $time S"
