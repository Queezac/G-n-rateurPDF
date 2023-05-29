#!/usr/bin/php
<?php
   $lines = file('regions.conf');
   $annee = date("Y");
   $trimestre = intval(date("m") / 3 + 1);
   $infosRegion = explode(":", $lines[1]);
   $region = $argv[1];

   if ($argc == 2) {
      // do stuff
   } else {
      echo "Nombre d'arguments invalides, il faut mettre l'identifiant de la région en paramètres";
      exit();
   }

   foreach ($lines as $line) {
      $infosRegion = explode(":", $line);
      if ($infosRegion[0] == "FR-$region") {
         break;
      }
   }

   $img = "FR-$region.png";
?>

<!DOCTYPE html>
<html lang="fr">
<head>
   <meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <link rel="stylesheet" href="styles.css">
   <title><?php echo htmlentities($infosRegion[0])?>-<?php echo htmlentities($infosRegion[1])?></title>
</head>
<body>
   <article id="art1">
         <h1>SAE 1.03</h1>
   </article>
   <section id="s1">
      <h1>Nom de la région :</h1>
      <p> <?php echo htmlentities($infosRegion[1])?> </p>
         <h1>Population : </h1>
         <p><?php echo htmlentities($infosRegion[2])?> habitants </p>
         <h1>Superficie :</h1>
         <p> <?php echo htmlentities($infosRegion[3])?> km² </p>
         <h1>Nombre de départements :</h1>
         <p> <?php echo htmlentities($infosRegion[4])?> départements </p>
         <h1>Logo de la région :</h1>
         <p> <img src="logos/<?php echo htmlentities($img)?>" alt = "logo"></p>
      <article class="bottom">
         <p>BUT informatique</p>
         <p>JJ-MM-AAAA HH:MM</p>
         <p>1/4</p>
      </article>
   </section>

<?php
   $texte = file('Texte.dat');
?>

<section id="s2">
      <?php echo $texte[2]?>
      <br>
      <?php echo $texte[3]?>
      <br>

<?php
   $tableau = file('Tableau.dat');
?>

      <table>
         <thead>
            <tr>
               <td>Nom du produit </td>
               <td>Ventes du trimestre</td>
               <td>Chiffre d’affaires du trimestre</td>
               <td>Ventes <br>du même trimestre <br>année précédente </td>
               <td>CA <br>du même trimestre <br>année précédente</td>
               <td>Evolution de CA en %</td>
            </tr>
         </thead>
<?php
   foreach ($tableau as $line) {
      echo $line;
   }
?>
      </table>
      <article class="bottom">
         <p>BUT informatique</p>
         <p>JJ-MM-AAAA HH:MM</p>
         <p>2/4</p>
      </article>
   </section>

<?php
   $comm = file('comm.dat');
?>

   <section id="s3">
      <h1>Nos meilleurs vendeurs du trimestre</h1>
      <hr>
      
<?php
   foreach ($comm as $line) {
      echo $line;
   }
?>
      <article class="bottom">
         <p>BUT informatique</p>
         <p>JJ-MM-AAAA HH:MM</p>
         <p>3/4</p>
      </article>
   </section>
   
   <section id="s4">
         <img src="images/oul.svg" alt="QR code"> 
      <article class="bottom">
         <p>BUT informatique</p>
         <p>JJ-MM-AAAA HH:MM</p>
         <p>4/4</p>
      </article>
   </section>
   
</body>
</html>