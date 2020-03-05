-- einfache Tabellenabfragen
-- SELECT auf Tabellen
-- immer �berpr�fen, ob wir in der richtigen Datenbank sind!


USE Northwind


-- Syntax: 
/*

SELECT	  Spaltenname1
		, Spaltenname2
		, Spaltenname3
		,...
FROM Tabellenname


*/

SELECT	  CustomerID
		, CompanyName
		, ContactName
		, Phone
FROM Customers


-- SELECT * -- alle Spalten
-- sollte NICHT gemacht werden! Auch wenn man alle Spalten will, alle extra hinschreiben! Kann aber hilfreich sein, um sich Vorschl�ge anzeigen zu lassen (* wegl�schen und Spaltennamen werden vorgeschlagen)

SELECT	  CustomerID
		, CompanyName
FROM Customers


-- �berschriften auch f�r Spalten�berschriften m�glich
-- ver�ndert NICHT die Spaltennamen in der Datenbank, sondern das betrifft NUR die Textausgabe!
SELECT	  CustomerID AS KundenID
		, CompanyName AS Firmenname
FROM Customers


SELECT	  ProductID AS ProduktID
		, ProductName AS Produktname
		, UnitPrice AS Preis
FROM Products


SELECT 100*3
 -- Kommazahlen mit . angeben (englische Schreibweise!)  0.3 statt 0,3
SELECT Freight AS Netto
		, Freight*1.19 AS Brutto
		, Freight*0.19 AS MwSt
FROM Orders


-- von Bestellungen: Bestellnummer, welcher Kunde (CustomerID), welcher Angestellte (EmployeeID) hat verkauft, in welches Land ist geliefert worden?


SELECT OrderID AS Bestellnummer
		, CustomerID AS Kundennummer
		, EmployeeID AS Verk�ufer
		, ShipCountry AS Land
FROM Orders


SELECT	  LastName
		, FirstName
		, HomePhone
FROM Employees

-- zusammenf�gen von Informationen aus mehreren Spalten
SELECT	  CONCAT(FirstName, ' ', LastName) AS [voller Name]
		, HomePhone AS Telefon
FROM Employees


SELECT CONCAT(FirstName, ' ', LastName)
FROM Employees

-- Verschachteln von Funktionen
-- Vor- und Nachname in einer Spalte ausgeben
-- unn�tige Leerzeichen von Vor- und Nachname wegschneiden

SELECT CONCAT(FirstName, ' ', LastName)
FROM Employees

SELECT TRIM(FirstName)
FROM Employees

SELECT TRIM(LastName)
FROM Employees


SELECT CONCAT(TRIM(FirstName), ' ', TRIM(LastName))
FROM Employees



-- mit Spalten�berschrift: 
SELECT CONCAT(TRIM(FirstName), ' ', TRIM(LastName)) AS [vollst�ndiger Name]
FROM Employees















