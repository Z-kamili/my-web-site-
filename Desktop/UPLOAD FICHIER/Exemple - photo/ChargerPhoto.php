<?php
  require_once ("Connect.php");
  require_once ("Connexion.php");
  require_once ("ExecRequete.php");

  // T�l�chargement d'une photo identifi�e par $_GET['id']

  // On commence par incr�menter le compteur

  $connexion = Connexion (NOM, PASSE, BASE, SERVEUR);
  $requete =  "UPDATE Album SET compteur=compteur+1 "
            . "WHERE id='{$_GET['id']}'";
  $resultat = ExecRequete ($requete, $connexion);

  //  On envoie un en-t�te for�ant le transfert (download)
  $fichier = $_GET['id'] . ".jpg";
  $chemin = "PHOTOS/" ;
  header ("Content-type: application/force-download");
  header ("Content-disposition: filename=$fichier");

  // Apr�s l'en-t�te on transmet le contenu du fichier lui-m�me
  readFile ($chemin . $fichier); 

?>
