#!/bin/bash



cd Traitement/images
#Scripte de Dorian pas le migrant mais bon eu je ne sais pas trop quel mot finis en "en" mais du coup ça sera le vaillant

# Convertion des images.svg en .png

 for objets in *.svg    # On parcours toutes les images.svg
 do
     convert "$objets" "${objets:0:3}.png"    # On convertit les images.svg en .png tout en recupérant les 3 premiers caractères du fichier et non l'entièreté (exemple : nom.svg.png --> nom.png)
 done


# Convertion en nuance de gris | Redimension de l'image sans le bandeau "Created on Face Co".

for objets in *.png     # On parcours toutes les images.png.
do
    convert $objets -colorspace Gray $objets    # On convertit les images en nuances de gris.

    convert $objets -resize 200x200 $objets     # On redimensionne l'image pour qu'elle soit au format 200x200px.

    convert $objets -crop 200x185+0+0 $objets   # On rogne l'image en partant dans haut à gauche (+0+0) et en coupant un rectangle de 200x185px (zone image sans le bandeau "Created on Face Co").

    convert $objets -resize 200x200 $objets     # On redimensionne une nouvelle foix l'image (actuellement au format 200x185px) pour qu'elle soit de nouveau au format 200x200px.

done


cd ../../

#scripte de Slalomé
while read line; do
    iso=$(echo $line | cut -d ":" -f1)
    echo "https://bigbrain.biz/$iso"
    docker run --rm -v $(pwd)/qrcode:/qrcode sae103-qrcode qrencode -o /qrcode/"$iso" "https://bigbrain.biz/$iso"
done <  region.conf

docker container prune -f

cd Traitement

echo "Rentrez le nom du fichier à traité avec extention. Pour finir la saisie, rentré : *"
read nom_fic
fin=*
# isoo = $(cat iso.txt);
#while ["$nom_fic" != "$fin"];
#do 
    cp $nom_fic DATA.txt
    php Traitement.php
    # bon bah c'était pour la variable isoo php iso.php
    php pages.php bre > pages.html   #bon euu j'ai pas réussis donc voilà
    rm DATA.txt
    rm comm.dat
    rm Tableau.dat
    rm Texte.dat
    # rm iso.txt

    docker container run --rm -ti -v /Docker/"$USER"/dossier/Traitement:/work sae103-html2pdf "html2pdf pages.html pages.pdf"

    
#done

echo "Merci pour l'utilisation de ce fichier"
    

