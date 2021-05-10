#------------------------------------------------------------
#        Script MySQL.
#------------------------------------------------------------


#------------------------------------------------------------
# Table: Categorie
#------------------------------------------------------------

CREATE TABLE Categorie(
        idCategorie          Int  Auto_increment  NOT NULL ,
        nomCategorie         Varchar (25) NOT NULL ,
        descriptionCategorie Varchar (250) NOT NULL
	,CONSTRAINT Categorie_PK PRIMARY KEY (idCategorie)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Article
#------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `Article`(
        idArticle              Int  Auto_increment  NOT NULL ,
        titreArticle           Varchar (50) ,
        dateCreationArticle    Date ,
        datePublicationArticle Date ,
        statutArticle          Enum ("Brouillon","Publié","Corbeille") ,
        contenuArticle         Varchar (250) ,
        idCategorie            Int
	,CONSTRAINT Article_PK PRIMARY KEY (idArticle)

	,CONSTRAINT Article_Categorie_FK FOREIGN KEY (idCategorie) REFERENCES Categorie(idCategorie)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Tag
#------------------------------------------------------------

CREATE TABLE Tag(
        idTag           Int  Auto_increment  NOT NULL ,
        nomTag          Varchar (50) NOT NULL ,
        description_Tag Varchar (250) NOT NULL
	,CONSTRAINT Tag_PK PRIMARY KEY (idTag)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Appartient à
#------------------------------------------------------------

CREATE TABLE Appartient_a(
        idArticle Int NOT NULL ,
        idTag     Int NOT NULL
	,CONSTRAINT Appartient_a_PK PRIMARY KEY (idArticle,idTag)

	,CONSTRAINT Appartient_a_Article_FK FOREIGN KEY (idArticle) REFERENCES Article(idArticle)
	,CONSTRAINT Appartient_a_Tag0_FK FOREIGN KEY (idTag) REFERENCES Tag(idTag)
)ENGINE=InnoDB;