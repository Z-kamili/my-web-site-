<?php
  require_once ("Connect.php");
  require_once ("Connexion.php");
  require_once ("ExecRequete.php");

  // Téléchargement d'une photo identifiée par $_GET['id']

  // On commence par incrémenter le compteur

  $connexion = Connexion (NOM, PASSE, BASE, SERVEUR);
  $requete =  "UPDATE Album SET compteur=compteur+1 "
            . "WHERE id='{$_GET['id']}'";
  $resultat = ExecRequete ($requete, $connexion);

  //  On envoie un en-tête forçant le transfert (download)
  $fichier = $_GET['id'] . ".jpg";
  $chemin = "PHOTOS/" ;
  header ("Content-type: application/force-download");
  header ("Content-disposition: filename=$fichier");

  // Après l'en-tête on transmet le contenu du fichier lui-même
  readFile ($chemin . $fichier); 

?>
