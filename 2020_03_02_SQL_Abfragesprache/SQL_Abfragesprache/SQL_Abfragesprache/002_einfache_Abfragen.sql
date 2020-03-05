-- Simple Select
-- einfache Abfragen


/*
  Text, Zahlen, Rechnungen
*/


-- Zahl ausgeben

SELECT 100;
GO


-- Text ausgeben

SELECT 'Testtext'


-- Berechnungen


SELECT 100*3


-- Achtung: keine Berechung... das wird als Text ausgegeben
SELECT '100*3'


SELECT 100, 'Testtext'


-- Spaltenüberschrift
-- SELECT Auswahl AS Spaltenüberschrift

SELECT 'Leo' AS Kunde


-- AS kann weggelassen werden, sollte aber sicherheitshalber dabeistehen!

SELECT 'Leo' Kunde



-- Anordnung

SELECT 100,
		'Testtext',
		'noch mehr Text',
	--	'Info'

-- Fehlermeldung bezieht sich auf das Komma oben! (nach 'noch mehr Text')
SELECT	  100
		, 'Testtext'
		, 'noch mehr Text'
		, 'Info'


SELECT 100, 'Testtext', 'Info...'


select 100


SELECT *
FROM Customers


SELECT	  100 AS Zahl
		, 'Testtext' AS Textausgabe
		, 100*3 AS Rechnung


-- häufige Serverfunktionen

SELECT 'Leo '

-- LTRIM, RTRIM, TRIM entfernen unerwünschte Leerzeichen

SELECT 'Leo   '


SELECT RTRIM('Leo   ')
SELECT LTRIM('    Leo')
SELECT TRIM('   Leo   ')


-- LEN ... length (wieviele Zeichen)

SELECT LEN('Leo   ')


-- DATALENGTH ... alle Zeichen
SELECT DATALENGTH('   Leo   ')


-- Funktionen miteinander verschachteln
-- herausfinden, wieviele Zeichen noch da sind nach dem Trim (hat Trim funktioniert?)

SELECT DATALENGTH(TRIM('   Leo   '))


-- mit Überschrift:

SELECT DATALENGTH(TRIM('   Leo   ')) AS [Anzahl Zeichen]


SELECT	  DATALENGTH('    Test    ') AS Vorher
		, DATALENGTH(TRIM('    Test    ')) AS Nachher

SELECT 100, 'Text'



-- CONCAT - Strings zusammenfügen
-- concat steht für concatenate

SELECT CONCAT('abc', 'def', 'ghi', 'jkl', 'mno', 'pqr', 'stu', 'vwx', 'yz') AS Alphabet

SELECT CONCAT('Ich weiß, ', 'dass ich', ' nichts weiß.') AS Zitat

SELECT CONCAT('James', ' ', 'Bond') AS [voller Name]


-- Text in umgekehrter Reihenfolge anzeigen

SELECT REVERSE('REITTIER')
SELECT REVERSE('Trug Tim eine so helle Hose nie mit Gurt?')


-- Text ausschneiden: LEFT, RIGHT, SUBSTRING
SELECT RIGHT('Testtext', 4)

SELECT LEFT('Testtext', 4)

SELECT SUBSTRING('Testtext', 4, 2) 
-- 3 Werte: 
-- 1. Wert ist die Zeichenfolge, von der wir etwas ausschneiden wollen
-- 2. Wert ist ab welcher Stelle wollen wir ausschneiden
-- 3. Wert ist wieviele Zeichen wollen wir ausschneiden


-- STUFF - Zeichen "reinstopfen"

SELECT STUFF('Testtext', 5, 0, '_Hallo_')
-- 4 Werte angeben: 
-- 1. In welche Zeichenfolge soll etwas eingefügt werden ('Testtext')
-- 2. beginnend bei welcher Stelle (5)
-- 3. wieviele Zeichen sollen weggelöscht werden (0)
-- 4. was soll eingefügt werden? ('_Hallo_')


-- Übung: letzte 3 Stellen mit x ersetzen

-- verschiedene Möglichkeiten
-- Variante 1:
SELECT REVERSE(STUFF(REVERSE(HomePhone), 1, 3, 'xxx')) AS Tel1
FROM Employees


-- Variante 2:
SELECT STUFF(Phone, 11, 3, 'xxx')  -- funktioniert nur bei fixer Anzahl an Zeichen
FROM Customers

-- Variante 3:
SELECT LEN(Phone)
FROM Customers


-- 123456789

SELECT STUFF(Phone, (LEN(Phone)-2), 3, 'xxx'), Phone
FROM Customers


-- REPLICATE - Zeichen mehrfach ausgeben

SELECT REPLICATE('?', 5) -- ?????
SELECT REPLICATE('abc', 3) -- abcabcabc

-- am Beispiel von vorhin:

SELECT STUFF(Phone, (LEN(Phone)-2), 3, REPLICATE('x', 3)), Phone
FROM Customers


-- Groß- und Kleinbuchstaben
-- alles in Großbuchstaben ausgeben
SELECT UPPER('abc')

-- aus einer Tabelle:

SELECT UPPER(CompanyName)
FROM Customers

-- alles in Kleinbuchstaben mit LOWER()

-- alle Nachnamen der Angestellten in Kleinbuchstaben:

SELECT LOWER(LastName)
FROM Employees


-- Zeichen ersetzen mit REPLACE
SELECT REPLACE('Hallo!', 'a', 'e') -- Hello!


-- an welcher Stelle befindet sich ein gesuchtes Zeichen? - CHARINDEX

SELECT CHARINDEX('a', 'Leo') -- 0 (wenn es das gesuchte Zeichen hier gar nicht gibt)

SELECT CHARINDEX('f', 'ALFKI') -- 3

SELECT CHARINDEX('F', 'alfki') -- 3 (Groß- / Kleinschreibung egal)


-- Leerzeichen suchen:

SELECT CHARINDEX(' ', 'James Bond') -- 6


-- Zeichenfolge suchen:

SELECT CHARINDEX('schnecke', 'Zuckerschnecke') -- 7 (Stelle, wo gesuchte Zeichenfolge beginnt)


-- nach Sonderzeichen suchen funktioniert auch:
SELECT CHARINDEX('$', '450$') -- 4
SELECT CHARINDEX('%', '50%') -- 3


-- CHARINDEX gibt mir die ERSTE Stelle an, an der das gesuchte Zeichen gefunden wird:

SELECT CHARINDEX(' ', 'Wolfgang Amadeus Mozart') -- 9

-- wie würden wir hier das letzte Leerzeichen finden?

-- langsam aufgeschlüsselt:

SELECT REVERSE('Wolfgang Amadeus Mozart') -- trazoM suedamA gnagfloW
SELECT CHARINDEX(' ', 'trazoM suedamA gnagfloW') -- 7
SELECT DATALENGTH('Wolfgang Amadeus Mozart') -- 23

SELECT 23-7 -- 16
SELECT 23-7+1

SELECT DATALENGTH('Wolfgang Amadeus Mozart') 
		- CHARINDEX(' ', 'trazoM suedamA gnagfloW')+1



SELECT DATALENGTH('Wolfgang Amadeus Mozart') 
		- CHARINDEX(' ', REVERSE('Wolfgang Amadeus Mozart'))+1



-- Test mit anderer Länge

SELECT DATALENGTH('Johann Sebastian Bach') 
		- CHARINDEX(' ', REVERSE('Johann Sebastian Bach'))+1 -- 17


SELECT DATALENGTH('Georg Friedrich Händel') 
		- CHARINDEX(' ', REVERSE('Georg Friedrich Händel'))+1 --16


-- mit Datenbank:
/*
SELECT DATALENGTH(Spaltenname) 
		- CHARINDEX(' ', REVERSE(Spaltenname))+1
FROM Tabellenname
*/


/*
Von der Telefonnummer aus der Customers-Tabelle sollen nur die letzten 3 Zeichen angezeigt werden; alle anderen sollen mit x ersetzt werden. (xxxxxxxxxxxxxxx789)
*/
-- Ulrikes Version:
SELECT CONCAT(REPLICATE('x', LEN(Phone)-LEN(REVERSE(LEFT(REVERSE(Phone),3)))),REVERSE(LEFT(REVERSE(Phone), 3))) 
FROM Customers


-- langsam:
SELECT RIGHT(Phone, 3)
FROM Customers

SELECT REPLICATE('x', ?)

SELECT LEN(Phone)
FROM Customers

-- wie bekomme ich das ?:
-- Anzahl der Zeichen in der Telefonnummer, -3 Zeichen (die angezeigt werden sollen)
SELECT LEN(Phone)-3
FROM Customers


SELECT CONCAT(REPLICATE('x', (LEN(Phone)-3)), RIGHT(Phone, 3))
FROM Customers


-- zum Überprüfen Telefonnummer danebenschreiben:

SELECT	  CONCAT(REPLICATE('x', (LEN(Phone)-3)), RIGHT(Phone, 3))
		, Phone
FROM Customers


-- 123456789
--       x
-- um ans x zu kommen, zählen wir von der Länge -2 weg

SELECT CONCAT(REPLICATE('x', (LEN(Phone)-3)), SUBSTRING(Phone, LEN(Phone)-2, 3))
FROM Customers


-- Wiederholung:
-- Telefonnummer aus der Datenbank holen:
SELECT Phone
FROM Customers

-- letzte drei Stellen der Telefonnummer:
SELECT RIGHT(Phone, 3)
FROM Customers

-- ersetzen mit x:
SELECT REPLICATE('x', ?)


-- Anzahl Zeichen in der Telefonnummer:
SELECT LEN(Phone)
FROM Customers

-- wie bekomme ich das ?
SELECT LEN(Phone)-3
FROM Customers



SELECT REPLICATE('x', LEN(Phone)-3), RIGHT(Phone, 3)
FROM Customers


SELECT CONCAT('a', 'b')
SELECT CONCAT(?, ?)


SELECT CONCAT(REPLICATE('x', LEN(Phone)-3), RIGHT(Phone, 3))
FROM Customers

