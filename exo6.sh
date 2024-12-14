#!/bin/sh
if [ $# -eq 2 ] && [ $1 == "-r" -o $1 == "+r" -o $1 == "-w" -o $1 == "+w" ] ; then
	droit=$1
	ext=$2
else
	echo " Error "
	exit 1
fi
for i in *.$ext ; do
	echo $i
	case $droit in
		-r) chmod g-r $i ;;
		+r) chmod g+r $i ;;
		-w) chmod g-w $i ;;
		+w) chmod g+w $i ;;
	esac
done

