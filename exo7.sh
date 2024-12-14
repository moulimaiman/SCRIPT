#!/bin/sh

if [ $# -eq 0 ] ; then echo " Argument denied " ; exit 1 ; fi

for file in $@ ; do
	read -p " Voulez-Vous réellement effacer le ficher $file ? " reponse
	case $reponse in
		oui) echo " Suppression Confirmée "
		     rm -r $file ;;

	        non) echo " Suppression Abandonnée " ;;

                *) echo " réponse invalide "
		   while [ $reponse != "oui" -a $reponse != "non" ] ; do
			read -p " Voulez-Vous réellement effacer le ficher $file ? " reponse
			case $reponse in

				oui) echo " Suppression Confirmée "
        	                rm -r $file ;;

		                non) echo " Suppression Abandonnée " ;;

				*) echo " réponse invalide " ;;
			esac
		  done ;;
	esac
done

