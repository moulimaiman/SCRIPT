#!/bin/sh

read -p " Saisir Un Nom de Fichier " file

select var in "Saisir Lignes" "afficher nbre ligne" "Quitter" ; do
	case $REPLY in
		1) read ligne
		   echo "$ligne" >> $file ;;
		2) echo "`wc -l $file`" ;;
		3) break ;;
	esac
done
