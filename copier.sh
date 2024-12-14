#!/bin/sh

# On Considere Comme On a Deux Arguments
#file2 dans file1

file1=$1
file2=$2

cat $file2 > $file1

