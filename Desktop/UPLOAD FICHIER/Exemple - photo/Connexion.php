<?php

 // Fonction Connexion: connexion � MySQL

 function Connexion ($pNom, $pMotPasse, $pBase, $pServeur)
 {
  // Connexion au serveur 
  $connexion = mysql_pconnect ($pServeur, $pNom, $pMotPasse);

  if (!$connexion) {
    echo "D�sol�, connexion au serveur $pServeur impossible\n";
    exit;
  }

  // Connexion � la base
  if (!mysql_select_db ($pBase, $connexion)) {
    echo "D�sol�, acc�s � la base $pBase impossible\n";
    echo "<b>Message de MySQL :</b> " . mysql_error($connexion);
    exit;
  }

  // On renvoie la variable de connexion
  return $connexion;
 } // Fin de la fonction
?>