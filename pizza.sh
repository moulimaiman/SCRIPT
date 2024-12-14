#!/bin/bash

declare -a table_pizza

if [ $# -eq 0 ] ; then echo " les éléments invalide " ; exit 1 ; fi


for elts in $@ ; do
	tab_pizza+=( $elts )
done

echo " les éléments de Pizza : "

for elts in ${tab_pizza[@]} ; do
	echo "$elts"
done
