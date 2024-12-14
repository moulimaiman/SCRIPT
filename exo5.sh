#!/bin/sh

file=$1

nbre_ligne=`wc -l $file | awk -F " " '{ print $1 }'`

for i in `seq 1 $nbre_ligne` ; do
	awk -v var=$i 'NR==var' $file
	sleep 2
done
