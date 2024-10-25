# Ceci est un test de migration SQL
# Les migrations sont exécutées en ordre alphabétique sur les fichiers du répertoire db/migrations

CREATE OR REPLACE TABLE items (
    name VARCHAR(255) PRIMARY KEY,
    description TEXT,
    price FLOAT
);

INSERT INTO items VALUES ('Item 1', 'This is item 1', 1);
INSERT INTO items VALUES ('Item 2', 'This is item 2', 2);
INSERT INTO items VALUES ('Item 3', 'This is item 3', 3);
INSERT INTO items VALUES ( 'Item 5 (where the fuck is 4)', 'This is WHAT', 100);