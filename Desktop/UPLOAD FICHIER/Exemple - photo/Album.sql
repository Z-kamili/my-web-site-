# Création d'une table pour un petit album photo 

CREATE TABLE Album 
   (id INTEGER AUTO_INCREMENT NOT NULL,
   description TEXT,
   compteur INTEGER DEFAULT 0,
   PRIMARY KEY (id)
)
;
