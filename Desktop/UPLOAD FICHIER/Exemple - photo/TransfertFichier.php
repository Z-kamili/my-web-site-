<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<head>
<title>Transfert du fichier</title>
<link rel='stylesheet' href="films.css" type="text/css" />
</head>
<body>

<h1>R�ception du fichier</h1>

<?php
require_once ("Connect.php");
require_once ("Connexion.php");
require_once ("ExecRequete.php");
#require_once ("Normalisation.php");

// Normalisation des donn�es HTTP
#Normalisation();

// R�cup�ration du code indicateur du transfert
$codeErreur = $_FILES['maPhoto']['error'];

if ($codeErreur == UPLOAD_ERR_OK) {
  // Le fichier a bien �t� transmis
  $fichier = $_FILES['maPhoto'];
  echo "<b>Nom du fichier client :</b> " . $fichier['name'] . "<br/>";
  echo "<b>Nom du fichier serveur :</b> " .$fichier['tmp_name'] . "<br/>";
  echo "<b>Taille du fichier :</b> " . $fichier['size'] . "<br/>";
  echo "<b>Type du fichier :</b>" . $fichier['type']  . "<br/>";

  // On ins�re la description dans la table Album

  $connexion = Connexion (NOM, PASSE, BASE, SERVEUR);
  // Protection des donn�es � ins�rer
  $description =
  htmlSpecialChars(mysql_real_escape_string($_POST['description']));
  $requete = "INSERT INTO Album (description) VALUES ('$description')";

  $resultat = ExecRequete ($requete, $connexion);

  // On r�cup�re l'identifiant attribu� par MySQL
  $id = mysql_insert_id ($connexion);

  // Copie du fichier dans le r�pertoire PHOTOS
  copy($fichier['tmp_name'], "./PHOTOS/$id.jpg");

}
else {
  // Une erreur quelque part
  switch ($codeErreur)  {
    case UPLOAD_ERR_NO_FILE:
      echo "Vous avez oubli� de transmettre le fichier !?\n";
      break;

    case UPLOAD_ERR_INI_SIZE:
      echo "Le fichier d�passe la taille max. autoris�e par PHP";
      break;

    case UPLOAD_ERR_FORM_SIZE:
      echo "Le fichier d�passe la taille max. autoris�e par le formulaire";
      break;

    case UPLOAD_ERR_PARTIAL:
      echo "Le fichier a �t� transf�r� partiellement";
      break;

    default:
      echo "Ne doit pas arriver!!!";
  }
}
?>
<a href='ListePhotos.php'>Lister les Photos</a>
</body>
</html>
