#!/bin/sh
if [ ! -f tele_agenda.txt ] ; then
	touch tele_agenda.txt
fi
select i in " Ajouter une nouvelle fiche ." " Rechercher une fiche ." " Détruire une fiche ." " Modifier une fiche ." " Lister l'annaire ." " Fin ." ; do
	case $REPLY in
		1) read -p " Nom : " name ; read -p " Numéro Téléphone : " phone
		   echo "$name,$phone" >> tele_agenda.txt ;;

		2) read -p " Nom : " name ; grep $name tele_agenda.txt ;;

		3) read -p " Nom détruit : " name
		   touch t_file.txt
		   nbre_ligne=`wc -l tele_agenda.txt | awk -F " " '{ print $1 }'`

		   for i in `seq 1 $nbre_ligne` ; do
	           	x=`awk -F, -v var=$i 'NR==var{print $1}' tele_agenda.txt`

			if [ $x != $name ] ; then
				awk -v var=$i 'NR==var' tele_agenda.txt >> t_file.txt
			fi

		   done
		   cat t_file.txt > tele_agenda.txt
		   rm -r t_file.txt ;;

		4) read -p " Nom Modifier : " name
                   touch t_file.txt
                   nbre_ligne=`wc -l tele_agenda.txt | awk -F " " '{ print $1 }'`
                   for i in `seq 1 $nbre_ligne` ; do
                        x=`awk -F, -v var=$i 'NR==var{print $1}' tele_agenda.txt`
                        if [ $x == $name ] ; then
				echo " Modifier cet Enregistrement : "
				awk -v var=$i 'NR==var' tele_agenda.txt
                                read -p " Nom : " name ; read -p " Numéro Téléphone : " phone
				echo "$name,$phone" >> t_file.txt
                        else
				awk -v var=$i 'NR==var' tele_agenda.txt >> t_file.txt
			fi
                   done
                   cat t_file.txt > tele_agenda.txt
                   rm -r t_file.txt ;;

		5) cat tele_agenda.txt ;;
		6) break ;;
		*) echo " Choix invalide " ;;
	esac
done
echo " END :) "
