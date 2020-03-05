-- Datenbank erstellen Grundbegriffe

-- Bsp.:

-- CREATE DATABASE DBName

CREATE DATABASE MyFirstDatabase05


-- NEEEEEEEIIIIIIIIIIIIIIIIINNNNNNNNNNNNNNNNN!
-- ganze DB ist unwiederruflich weg
DROP DATABASE MyFirstDatabase05


-- Tabelle erstellen:

CREATE TABLE Produkte
	(
		ProduktID int identity,
		Bezeichnung nvarchar(255),
		Preis money
--		...
	)


-- DROP TABLE Produkte

SELECT *
FROM Produkte



INSERT INTO Produkte (Bezeichnung, Preis)
	VALUES('Spaghetti', 1.99)


INSERT INTO Produkte (Preis, Bezeichnung)
	VALUES (2.49, 'Profiterols')


-- mehrere Werte auf einmal einf�gen:

INSERT INTO Produkte (Bezeichnung, Preis)
	VALUES    ('Tiramisu', 4.99)
			, ('Tartufo', 4.89)
			, ('Penne', 1.59)
			, ('Tagliatelle', 2.39)



-- Werte ver�ndern:


-- bei UPDATE unbedingt mit WHERE eingrenzen, sonst bekommen ALLE Produkte den Preis
UPDATE Produkte
SET Preis = 4.99
WHERE ProduktID = 2


-- rausl�schen mit DELETE
-- auch hier unbedingt mit WHERE einschr�nken, sonst ist der gesamte Inhalt der Tabelle weg
DELETE FROM Produkte
WHERE ProduktID = 7



SELECT *
FROM Produkte


-- an der Tabelle etwas ver�ndern mit ALTER
ALTER TABLE Produkte
ALTER COLUMN Bezeichnung varchar(512)




-- leonardh@ppedv.de



