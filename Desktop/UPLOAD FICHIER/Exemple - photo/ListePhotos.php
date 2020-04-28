<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="fr">
<head>
<title>Liste et téléchargement des photos</title>
<link rel='stylesheet' href="films.css" type="text/css" />
</head>
<body>

<h1>Liste et téléchargement des photos</h1>

<?php
require_once ("UtilBD.php");

$connexion = Connexion (NOM, PASSE, BASE, SERVEUR);

// On affiche la liste des photos

echo "<table border='4' cellspacing='2' cellpadding='2'>"
. "<caption ALIGN='bottom'>Les photos disponibles</caption> "
. "<tr><th>Vignette</th><th>Description</th><th>Taille</th>"
. "<th>Agrandir</th><th>Compteur</th><th>Action</th></tr>\n";

$dir = opendir ("PHOTOS");
while ($fichier = readdir($dir)) {
  if (preg_match("/.jpg$/", $fichier)) {
    $id = substr ($fichier, 0, strpos ($fichier, "."));
    $requete = "SELECT * FROM Album WHERE id='$id'";
    $resultat = ExecRequete ($requete, $connexion);
    $photo = ObjetSuivant($resultat);

    echo  "<tr><td><img src='PHOTOS/$fichier' height='70' width='70'/></td>"
    . "<td>$photo->description</td>"
    . "<td>" . filesize("PHOTOS/$fichier") . "</td>"
    . "<td><a href='PHOTOS/$fichier'>$fichier</a></td>"
    . "<td>$photo->compteur</td>"
    . "<td><a href='ChargerPhoto.php?id=$id'> "
    .     "Télécharger cette photo</a></td>\n";
  }
}
echo "</table>\n";
closedir ($dir);

?>
<a href='FormTransfert.html'>Ajouter une photo</a>
</body>
</html>
