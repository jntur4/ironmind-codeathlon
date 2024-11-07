-- Ceci est un test de migration SQL
-- Les migrations sont exécutées en ordre alphabétique sur les fichiers du répertoire db/migrations

-- garder au cas ou sa brise qqch
CREATE OR REPLACE TABLE items (
    name VARCHAR(255) PRIMARY KEY,
    description TEXT,
    price FLOAT
);

INSERT INTO items VALUES ('Item 1', 'This is item 1', 1);
INSERT INTO items VALUES ('Item 2', 'This is item 2', 2);
INSERT INTO items VALUES ('Item 3', 'This is item 3', 3);
INSERT INTO items VALUES ( 'Item 5 (where the fuck is 4)', 'This is WHAT', 100);


CREATE OR REPLACE TABLE Sexe (
    id INT NOT NULL AUTO_INCREMENT,
    sexe VARCHAR(255) NOT NULL,
    PRIMARY KEY (id)
);

CREATE OR REPLACE TABLE Sexe_log (
    id INT,
    sexe VARCHAR(255)
);

DELIMITER $$
CREATE TRIGGER sexe_data AFTER INSERT ON Sexe
FOR EACH ROW
BEGIN
  INSERT INTO Sexe_log (id, sexe)
  VALUES('insert', NOW(), NEW.id, NEW.sexe);
END$$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER sexe_dataupdate AFTER UPDATE ON Sexe
FOR EACH ROW
BEGIN
  INSERT INTO Sexe_log (id, sexe)
  VALUES('update', NOW(), NEW.id, NEW.sexe);
END$$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER sexe_datadelete AFTER DELETE ON Sexe
FOR EACH ROW
BEGIN
  INSERT INTO Sexe_log (id, sexe)
  VALUES('delete', NOW(), OLD.id, OLD.sexe);
END$$
DELIMITER ;

INSERT INTO Sexe (sexe) VALUES
('Homme'),
('Femme'),
('Non-Binaire');

CREATE OR REPLACE TABLE Programme (
    id INT NOT NULL AUTO_INCREMENT,
    nom VARCHAR(255),
    faculte VARCHAR(255),
    PRIMARY KEY (id)
);

CREATE OR REPLACE TABLE Programme_log (
    id INT,
    nom VARCHAR(255),
    faculte VARCHAR(255)
);

DELIMITER $$
CREATE TRIGGER programme_data AFTER INSERT ON Programme
FOR EACH ROW
BEGIN
  INSERT INTO Programme_log (id, nom, faculte)
  VALUES('insert', NOW(), NEW.id, NEW.nom, NEW.faculte);
END$$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER programme_dataupdate AFTER UPDATE ON Programme
FOR EACH ROW
BEGIN
  INSERT INTO Programme_log (id, nom, faculte)
  VALUES('update', NOW(), NEW.id, NEW.nom, NEW.faculte);
END$$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER programme_datadelete AFTER DELETE ON Programme
FOR EACH ROW
BEGIN
  INSERT INTO Programme_log (id, nom, faculte)
  VALUES('delete', NOW(), OLD.id, OLD.nom, OLD.faculte);
END$$
DELIMITER ;

INSERT INTO Programme (nom, faculte) VALUES
('IFT', 'FSG'),
('GLO', 'FSG'),
('IIG', 'FSG');

CREATE OR REPLACE TABLE Utilisateur (
    id INT NOT NULL AUTO_INCREMENT,
    prenom VARCHAR(255),
    nom VARCHAR(255),
    email VARCHAR(255) UNIQUE,
    sexe_id INT,
    programme_id INT,
    password VARCHAR(255),
    PRIMARY KEY (id),
    CONSTRAINT fk_sexe_id FOREIGN KEY (sexe_id) REFERENCES Sexe(id),
    CONSTRAINT fk_programme_id FOREIGN KEY (programme_id) REFERENCES Programme(id)
);

-- we need to add host name and add it to all other tables
CREATE TABLE Utilisateur_log (
    action VARCHAR(255),
    action_time   TIMESTAMP,
    id INT,
    prenom VARCHAR(255),
    nom VARCHAR(255),
    email VARCHAR(255),
    sexe_id INT,
    programme_id INT,
    password VARCHAR(255)
);

DELIMITER $$
CREATE TRIGGER utilisateur_data AFTER INSERT ON Utilisateur
FOR EACH ROW
BEGIN
  INSERT INTO Utilisateur_log (action, action_time, id, prenom,nom,email,sexe_id,programme_id,password)
  VALUES('insert', NOW(), NEW.id, NEW.prenom, NEW.nom, NEW.email,NEW.sexe_id,NEW.programme_id,"the password");
END$$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER utilisateur_dataupdate AFTER UPDATE ON Utilisateur
FOR EACH ROW
BEGIN
  INSERT INTO Utilisateur_log (action, action_time, id, prenom,nom,email,sexe_id,programme_id,password)
  VALUES('update', NOW(), NEW.id, NEW.prenom, NEW.nom, NEW.email,NEW.sexe_id,NEW.programme_id,"the password");
END$$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER utilisateur_datadelete AFTER DELETE ON Utilisateur
FOR EACH ROW
BEGIN
  INSERT INTO Utilisateur_log (action, action_time, id, prenom,nom,email,sexe_id,programme_id,password)
  VALUES('delete', NOW(), OLD.id, OLD.prenom, OLD.nom, OLD.email,OLD.sexe_id,OLD.programme_id,OLD.password);
END$$
DELIMITER ;

INSERT INTO Utilisateur (prenom, nom, email, sexe_id, programme_id,password) VALUES
('Jean-Nicolas', 'Turbis', 'jntur4@ulaval.ca', 1, 1,"ultra fort pswd");

CREATE OR REPLACE TABLE Siege (
    numero INT NOT NULL AUTO_INCREMENT,
    section INT,
    prix FLOAT,
    PRIMARY KEY (numero)
);

CREATE OR REPLACE TABLE Siege_log (
    numero INT,
    section INT,
    prix FLOAT
);

DELIMITER $$
CREATE TRIGGER siege_data AFTER INSERT ON Siege
FOR EACH ROW
BEGIN
  INSERT INTO Siege_log (id, nom, faculte)
  VALUES('insert', NOW(), NEW.numero, NEW.section, NEW.prix);
END$$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER Siege_dataupdate AFTER UPDATE ON Siege
FOR EACH ROW
BEGIN
  INSERT INTO Siege_log (id, nom, faculte)
  VALUES('update', NOW(), NEW.numero, NEW.section, NEW.prix);
END$$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER Siege_datadelete AFTER DELETE ON Siege
FOR EACH ROW
BEGIN
  INSERT INTO Siege_log (id, nom, faculte)
  VALUES('delete', NOW(), OLD.numero, OLD.section, OLD.prix);
END$$
DELIMITER ;

INSERT INTO Siege (numero, section, prix) VALUES 
                    (1, 1, 10),
                    (2, 1, 10),
                    (3, 1, 10),
                    (4, 1, 10),
                    (5, 1, 10),
                    (6, 1, 10),
                    (7, 1, 10),
                    (8, 1, 10),
                    (9, 1, 10),
                    (10, 1, 10),
                    (11, 1, 10),
                    (12, 1, 10),
                    (13, 1, 10),
                    (14, 1, 10),
                    (15, 1, 10),
                    (16, 1, 10),
                    (17, 1, 10),
                    (18, 1, 10),
                    (19, 1, 10),
                    (20, 1, 10),
                    (21, 1, 10);


CREATE OR REPLACE TABLE Evenement(
    id INT NOT NULL AUTO_INCREMENT,
    nom VARCHAR(255),
    description TEXT,
    date DATETIME,
    PRIMARY KEY (id)
);

CREATE OR REPLACE TABLE Evenement_log(
    id INT,
    nom VARCHAR(255),
    description TEXT,
    date DATETIME
);

DELIMITER $$
CREATE TRIGGER evenement_data AFTER INSERT ON Evenement
FOR EACH ROW
BEGIN
  INSERT INTO Evenement_log (id, nom, description, date)
  VALUES('insert', NOW(), NEW.id, NEW.nom, NEW.description, NEW.date);
END$$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER evenement_dataupdate AFTER UPDATE ON Evenement
FOR EACH ROW
BEGIN
  INSERT INTO Evenement_log (id, nom, description, date)
  VALUES('update', NOW(), NEW.id, NEW.nom, NEW.description, NEW.date);
END$$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER evenement_datadelete AFTER DELETE ON Evenement
FOR EACH ROW
BEGIN
  INSERT INTO Evenement_log (id, nom, description, date)
  VALUES('delete', NOW(), OLD.id, OLD.nom, OLD.description, OLD.date);
END$$
DELIMITER ;

INSERT INTO Evenement (nom, description, date) VALUES
('Soocer feminin', 'Match de soccer', '2024-11-06 13:00:00');


CREATE OR REPLACE TABLE Reservation (
    id INT NOT NULL AUTO_INCREMENT,
    user_id INT,
    siege_id INT,
    evenement_id INT,
    PRIMARY KEY (id),
    CONSTRAINT fk_user_id FOREIGN KEY (user_id) REFERENCES Utilisateur(id),
    CONSTRAINT fk_siege_id FOREIGN KEY (siege_id) REFERENCES Siege(numero),
    CONSTRAINT fk_evenement_id FOREIGN KEY (evenement_id) REFERENCES Evenement(id)
);


CREATE OR REPLACE TABLE Reservation_log (
    id INT,
    user_id INT,
    siege_id INT,
    evenement_id INT
);

DELIMITER $$
CREATE TRIGGER reservation_data AFTER INSERT ON Reservation
FOR EACH ROW
BEGIN
  INSERT INTO Reservation_log (id, user_id, siege_id, evenement_id)
  VALUES('insert', NOW(), NEW.id, NEW.user_id, NEW.siege_id, NEW.evenement_id);
END$$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER reservation_dataupdate AFTER UPDATE ON Reservation
FOR EACH ROW
BEGIN
  INSERT INTO Reservation_log (id, user_id, siege_id, evenement_id)
  VALUES('update', NOW(), NEW.id, NEW.user_id, NEW.siege_id, NEW.evenement_id);
END$$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER reservation_datadelete AFTER DELETE ON Reservation
FOR EACH ROW
BEGIN
  INSERT INTO Reservation_log (id, user_id, siege_id, evenement_id)
  VALUES('delete', NOW(), OLD.id, OLD.user_id, OLD.siege_id, OLD.evenement_id);
END$$
DELIMITER ;

INSERT INTO Reservation (user_id, siege_id, evenement_id) VALUE (2, 1, 1);
INSERT INTO Reservation (user_id, siege_id, evenement_id) VALUE (2, 2, 1);
INSERT INTO Reservation (user_id, siege_id, evenement_id) VALUE (2, 3, 1);
INSERT INTO Reservation (user_id, siege_id, evenement_id) VALUE (2, 4, 1);
INSERT INTO Reservation (user_id, siege_id, evenement_id) VALUE (2, 5, 1);
INSERT INTO Reservation (user_id, siege_id, evenement_id) VALUE (2, 6, 1);
INSERT INTO Reservation (user_id, siege_id, evenement_id) VALUE (2, 7, 1);
INSERT INTO Reservation (user_id, siege_id, evenement_id) VALUE (2, 8, 1);
INSERT INTO Reservation (user_id, siege_id, evenement_id) VALUE (2, 9, 1);
INSERT INTO Reservation (user_id, siege_id, evenement_id) VALUE (2, 10, 1);
INSERT INTO Reservation (user_id, siege_id, evenement_id) VALUE (2, 11, 1);
INSERT INTO Reservation (user_id, siege_id, evenement_id) VALUE (2, 12, 1);
INSERT INTO Reservation (user_id, siege_id, evenement_id) VALUE (2, 13, 1);
INSERT INTO Reservation (user_id, siege_id, evenement_id) VALUE (2, 14, 1);
INSERT INTO Reservation (user_id, siege_id, evenement_id) VALUE (2, 15, 1);
INSERT INTO Reservation (user_id, siege_id, evenement_id) VALUE (2, 16, 1);
INSERT INTO Reservation (user_id, siege_id, evenement_id) VALUE (2, 17, 1);
INSERT INTO Reservation (user_id, siege_id, evenement_id) VALUE (2, 18, 1);
INSERT INTO Reservation (user_id, siege_id, evenement_id) VALUE (2, 19, 1);
INSERT INTO Reservation (user_id, siege_id, evenement_id) VALUE (2, 20, 1);
INSERT INTO Reservation (user_id, siege_id, evenement_id) VALUE (2, 21, 1);