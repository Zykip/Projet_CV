DROP TABLE IF EXISTS Experience;
DROP TABLE IF EXISTS Formation;
DROP TABLE IF EXISTS CandidatLangue;
DROP TABLE IF EXISTS CandidatCompetence;
DROP TABLE IF EXISTS CentreInteretCandidat;
DROP TABLE IF EXISTS Entreprise;
DROP TABLE IF EXISTS Ecole;
DROP TABLE IF EXISTS Langue;
DROP TABLE IF EXISTS Competence;
DROP TABLE IF EXISTS CentreInteret;
DROP TABLE IF EXISTS Candidat;


CREATE TABLE IF NOT EXISTS Candidat(
    idCandidat INTEGER AUTO_INCREMENT,
	nom VARCHAR(50) NOT NULL,
	prenom VARCHAR(50) NOT NULL,
    dateNaissance DATE,
	nationalite VARCHAR(50) NOT NULL,
	adresse VARCHAR(50) NOT NULL,
	numeroTelephone VARCHAR(15) NOT NULL,
	adresseEmail VARCHAR(50) NOT NULL,
	PRIMARY KEY (idCandidat)
);

/*
	Table : Entreprise
*/
CREATE TABLE IF NOT EXISTS Entreprise(
    idEntreprise INTEGER AUTO_INCREMENT,
	nomEntreprise VARCHAR(80) NOT NULL,
    domaineActivite VARCHAR(80) NOT NULL,
	PRIMARY KEY (idEntreprise)
);

/*
	Table : Ecole
*/
CREATE TABLE IF NOT EXISTS Ecole(
    idEcole INTEGER AUTO_INCREMENT,
	nomEcole VARCHAR(100) NOT NULL,
	PRIMARY KEY (idEcole)
);

/*
	Table : Langue
*/
CREATE TABLE IF NOT EXISTS Langue(
    idLangue INTEGER AUTO_INCREMENT,
	nomLangue VARCHAR(50) NOT NULL,
	PRIMARY KEY (idLangue)
);

/*
	Table : Competence
*/
CREATE TABLE IF NOT EXISTS Competence(
    idCompetence INTEGER AUTO_INCREMENT,
	nomCompetence VARCHAR(100) NOT NULL,
	PRIMARY KEY (idCompetence)
);

/*
	Table : CentreInteret
*/
CREATE TABLE IF NOT EXISTS CentreInteret(
    idCentreInteret INTEGER AUTO_INCREMENT,
	nomCentreInteret VARCHAR(100) NOT NULL,
	PRIMARY KEY (idCentreInteret)
);

/*
	Table : Experience
*/
CREATE TABLE IF NOT EXISTS Experience(
    idCandidat INTEGER,
	idEntreprise INTEGER,
	nature varchar(40) NOT NULL,
	dateDebut DATE NOT NULL,
	dateFin DATE,
	sujet varchar(1000),
	PRIMARY KEY (idCandidat,idEntreprise),
	FOREIGN KEY (idCandidat) REFERENCES Candidat(idCandidat),
	FOREIGN KEY (idEntreprise) REFERENCES Entreprise(idEntreprise)
);

/*
	Table : Formation
*/
CREATE TABLE IF NOT EXISTS Formation(
    idCandidat INTEGER,
	idEcole INTEGER,
	specialite varchar(100) NOT NULL,
	diplome varchar(100) NOT NULL,
	promotion INTEGER,
	PRIMARY KEY (idCandidat,idEcole),
	FOREIGN KEY (idCandidat) REFERENCES Candidat(idCandidat),
	FOREIGN KEY (idEcole) REFERENCES Ecole(idEcole)
);

/*
	Table : CandidatLangue
*/
CREATE TABLE IF NOT EXISTS CandidatLangue(
    idCandidat INTEGER,
	idLangue INTEGER,
	niveau varchar(20) NOT NULL,
	PRIMARY KEY (idCandidat,idLangue),
	FOREIGN KEY (idCandidat) REFERENCES Candidat(idCandidat),
	FOREIGN KEY (idLangue) REFERENCES Langue(idEcole)
);

/*
	Table : CompetenceCandidat
*/
CREATE TABLE IF NOT EXISTS CompetenceCandidat(
    idCandidat INTEGER,
	idCompetence INTEGER,
	niveauMaitrise varchar(100) NOT NULL,
	PRIMARY KEY (idCandidat,idCompetence),
	FOREIGN KEY (idCandidat) REFERENCES Candidat(idCandidat),
	FOREIGN KEY (idCompetence) REFERENCES Competence(idCompetence)
);

/*
	Table : CentreInteretCandidat
*/
CREATE TABLE IF NOT EXISTS CentreInteretCandidat(
    idCandidat INTEGER,
	idCentreInteret INTEGER,
	PRIMARY KEY (idCandidat,idCentreInteret),
	FOREIGN KEY (idCandidat) REFERENCES Candidat(idCandidat),
	FOREIGN KEY (idCentreInteret) REFERENCES CentreInteret(idCentreInteret)
);


/*
table Candidat
*/

INSERT INTO Candidat (nom, prenom, dateNaissance, nationalite, adresse, numeroTelephone, adresseEmail) 
VALUES ('Idriss', 'Moustaghfir', '2000-12-28', 'Français', 'Lyon', '0614416917','idriss@emeka.fr');

/*
table Entreprise
*/

INSERT INTO Entreprise (nomEntreprise, domaineActivite) 
VALUES ('Emeka','Informatique');

INSERT INTO Entreprise (nomEntreprise, domaineActivite) 
VALUES ('Leo Mazzotti','E-commerce');

INSERT INTO Entreprise (nomEntreprise, domaineActivite) 
VALUES ('Paul Gosselin','E-commerce');
/*
table Ecole
*/

INSERT INTO Ecole (nomEcole) 
VALUES ('Ynov');

INSERT INTO Ecole (nomEcole) 
VALUES ('Lycée Saint Louis Saint Bruno');

/*
table Langue
*/

INSERT INTO Langue (nomLangue) 
VALUES ('Francais');

INSERT INTO Langue (nomLangue) 
VALUES ('Anglais');

INSERT INTO Langue (nomLangue) 
VALUES ('Allemand');

INSERT INTO Langue (nomLangue) 
VALUES ('Arabe');

/*
table Competence
*/

INSERT INTO Competence (nomCompetence) 
VALUES ('Programmation WEB');

INSERT INTO Competence (nomCompetence) 
VALUES ('Programmation Mobile');

/*
table CentreInteret
*/

INSERT INTO CentreInteret (nomCentreInteret) 
VALUES ('Sport');

INSERT INTO CentreInteret (nomCentreInteret) 
VALUES ('Théâtre');

INSERT INTO CentreInteret (nomCentreInteret) 
VALUES ('Cinéma');

INSERT INTO CentreInteret (nomCentreInteret) 
VALUES ('Voyage');

INSERT INTO CentreInteret (nomCentreInteret) 
VALUES ('Entrepreneuriat');

INSERT INTO CentreInteret (nomCentreInteret) 
VALUES ('Lecture');

/*
table Experience
*/

INSERT INTO Experience (idCandidat, idEntreprise, nature, dateDebut, dateFin, sujet) 
VALUES (1,1,'Stage d\'observation','2018-07-01','2019-08-01','Création site E-commerce');

/*
table Formation
*/

INSERT INTO Formation (idCandidat, idEcole, specialite, diplome, promotion) 
VALUES (1,1,'Développement WEB','Master Informatique',2018);


