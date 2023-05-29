#!/bin/bash

# Convertion des images.svg en .png

 for objets in *.svg    # On parcours toutes les images.svg
 do
     convert "$objets" "${objets:0:3}.png"    # On convertit les images.svg en .png tout en recupérant les 3 premiers caractères du fichier et non l'entièreté (exemple : nom.svg.png --> nom.png)
 done


# Convertion en nuance de gris | Redimension de l'image sans le bandeau "Created on Face Co".

for objets in *.png     # On parcours toutes les images.png.
do
    convert $objets -colorspace Gray $objets    # On convertit les images en nuances de gris.

    convert $objets -rezise 200x200 $objets     # On redimensionne l'image pour qu'elle soit au format 200x200px.

    convert $objets -crop 200x185+0+0 $objets   # On rogne l'image en partant dans haut à gauche (+0+0) et en coupant un rectangle de 200x185px (zone image sans le bandeau "Created on Face Co").

    convert $objets -rezise 200x200 $objets     # On redimensionne une nouvelle foix l'image (actuellement au format 200x185px) pour qu'elle soit de nouveau au format 200x200px.

done
