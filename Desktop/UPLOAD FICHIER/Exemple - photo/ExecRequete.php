<?php
 // Ex�cution d'une requ�te avec MySQL

 function ExecRequete ($requete, $connexion)
 {
  $resultat = mysql_query ($requete, $connexion);

  if ($resultat)
   return $resultat;
  else {  
    echo "<b>Erreur dans l'ex�cution de la requ�te '$requete'.</b><br/>";
    echo "<b>Message de MySQL :</b> " .  mysql_error($connexion);
    exit;
  }  
 } // Fin de la fonction ExecRequete

 // Recherche de l'objet suivant
 function ObjetSuivant ($resultat)
 {
   return  mysql_fetch_object ($resultat);
 } 

 // Recherche de la ligne suivante (retourne un tableau)
 function LigneSuivante ($resultat)
 {
   return  mysql_fetch_assoc ($resultat);
 }
?>
