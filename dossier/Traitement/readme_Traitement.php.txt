Notre script php traite le fichier fournit par le client. Pour le traiter, il faut renommer le fichier en question en "DATA.txt". 

Pour le traiter, il prend le contenu de "DATA.txt" et le met dans la variable "$fichier". Après, il créé les trois fichiers ".dat" et leur attribut une variable.

Il parcourt ensuite le fichier "DATA.txt" grâce à une boucle foreach, et stock les lignes dans une variable "$ligne". Nous utilisons ensuite un "trim" pour enlever les espaces non nécessaires. 

Après cela, il effectue trois "explode" et stock les tableaux obtenus dans des variables ($mot, $mot_2, $mot_3).  

Pour traiter les cas où il y a du contenu entre "DEBUT_TRUC" et "FIN_TRUC", il teste si $mot[0] correspond à "DEBUT_TRUC". Si oui, il donne la valeur 1 à $test_txt. Ensuite, il y a un if qui test si $test_txt est égal à 1. Si l'est, il teste ensuite si $mot[0] est égal à "FIN_TRUC". Il y a donc 2 cas: celui où c'est égal et celui où ça ne l'est pas.

Dans le cas où $mot[0] n'est pas égal à "FIN_TRUC", il écrit le contenu de $mot[0] dans le fichier voulue.

Dans le cas où c'est différent, Il passe la variable $test_txt et n'écrit rien dans le fichier voulue.


Pour traiter les cas où il y a du contenue apès un = ou un : mais sur la même ligne, on utilise $mot_2 ou $mot_3 (un pour "=" et l'autre pour ":"), puis on test si $mot_2[0] (la même avec $mot_3 si besoin) est égale au bout de texte permettant d'identifier la suite (par exemple SOUS_TITRE ou même TITRE). Si il y a une égalitée, On écrit la suite dans le fichier concerné, sinon bah on ne fait rien.

Quand on doir écrire, le script fait en sorte de placé les balise html de manière a facilité la suite du projet. Les seuls moment où il y a certain problème est pour le contenue entre DEBUT_STATS et FIN_STATS mais aussi après MEILLEUR.

Entre DEBUT_STATS et FIN_STATS, Il applique la même logique que vue précédemment pour ce genre de cas. On effectue un autre explode afin de séparer les mots entouré de "," et de toout mettre ça dans un tableau $data. Grâce à une boucle while qui parcours $data et qui écrit avec les balises nésséssaires pour l'html.

Pour "MEILLEUR", on fait 2 explode afin d'obtenir le tableau adéquat, puis met en place les balises si il y en a besoin. Les 2 explodes ont permis d'obtenir le tableau $emp qui est utilisé dans une boucle while qui parcours les information d'une personne. On effectue ensuite un autre explode afin d'obtenir le nom de son fichier et de mettre le reste de ses information dans $id_emp[1]. Puis on effectue ensuite un autre ecplode sur $id_emp[1] pour obtenir son nom ($reste[0]) et le chiffre d'affaire générer ($reste[1]).
 


 
