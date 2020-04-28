/* Création d'une table FilmComplet   */

CREATE TABLE FilmComplet
  (titre      VARCHAR (30),
   annee      INTEGER,
   nom_realisateur  VARCHAR (30),
   prenom_realisateur  VARCHAR (30),
   annee_naissance INTEGER,
   pays   ENUM ("FR", "US", "DE", "JP"),
   genre  SET ("C", "D", "H", "S"),
   resume       TEXT
  )
;