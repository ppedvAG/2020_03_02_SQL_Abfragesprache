-- WILDCARDS
-- nur beim LIKE (außer * beim SELECT - alle Spalten)

-- % steht für beliebig viele unbekannte Zeichen (0 - ?)


SELECT *
FROM Customers
WHERE CustomerID LIKE 'ALF%'


/*
Treffer wären z.B.:

		ALF
		ALFX
		ALFXXXXXXXXX
		ALF

*/


SELECT *
FROM Customers
WHERE CustomerID LIKE '%MI'



SELECT *
FROM Customers
WHERE CompanyName LIKE '%kiste%'


-- alle Kunden, deren Firmenname mit D beginnt?
SELECT *
FROM Customers
WHERE CompanyName LIKE 'D%'

-- alle, die mit E enden
SELECT *
FROM Customers
WHERE CompanyName LIKE '%E'

-- alle Produkte, die mit coffee enden
SELECT *
FROM Products
WHERE ProductName LIKE '%coffee'

-- alle Produkte, wo im Namen ost vorkommt
SELECT *
FROM Products
WHERE ProductName LIKE '%ost%'

-- Gib alle Produkte aus, die vom Anbieter (SupplierID) 5, 10 oder 15 stammen, von denen mehr als 10 Stück vorrätig sind und deren Stückpreis unter 100 liegt.

SELECT *
FROM Products
WHERE SupplierID IN(5, 10, 15) 
		AND UnitsInStock > 10 
		AND UnitPrice < 100
ORDER BY UnitPrice DESC


-- Anordnen von unseren Ausgaben:

SELECT	  CustomerID
		, CompanyName
		, Country
FROM Customers
ORDER BY Country -- ASC ... ascending = aufsteigend (vom kleinsten zum größten Wert bzw. von A - Z)

SELECT	  CustomerID
		, CompanyName
		, Country
FROM Customers
ORDER BY Country DESC -- descending = absteigend (vom größten zum kleinsten Wert)


-- nach mehreren Kriterien ordnen
SELECT	  CustomerID
		, CompanyName
		, Country
		, City
FROM Customers
ORDER BY Country, City

-- unterschiedlich anordnen
SELECT	  CustomerID
		, CompanyName
		, Country
		, City
FROM Customers
ORDER BY Country ASC, City DESC



-- alle Kunden, die ein d im Namen haben und mit e enden
SELECT *
FROM Customers
WHERE ContactName LIKE ('%d%') AND ContactName LIKE ('%e')

-- oder:
SELECT *
FROM Customers
WHERE ContactName LIKE ('%d%e')


-- Bestellungen: alle von Angestellten 1, 3, 5, von Kunden, die mit r beginnen und deren Frachtkosten größer als 100 sind

SELECT *
FROM Orders
WHERE EmployeeID IN(1, 3, 5) AND CustomerID LIKE ('r%') AND Freight > 100


-- eckige Klammern
-- bis jetzt bei [Order Details], also wenn Leerzeichen im Namen sind

-- wir können auch zum Suchen von bestimmten Zeichen oder Wertebereichen verwenden
-- [] suche nach dem Zeichen in der eckigen Klammer
-- oder nach einem der Zeichen aus dem Wertebereich in der eckigen Klammer
-- funktioniert auch für Sonderzeichen

SELECT *
FROM Customers
WHERE CompanyName LIKE '%[%]%' -- im Namen müsste auch ein %-Zeichen vorkommen


-- nach Hochkomma suchen?

SELECT *
FROM Customers
WHERE CompanyName LIKE '%''%' -- Sonderfall!


SELECT *
FROM Customers
WHERE CompanyName LIKE 'a%' OR CompanyName LIKE 'c%'

-- oder:

SELECT *
FROM Customers
WHERE CompanyName LIKE '[ac]%' -- beginnt mit A ODER mit C



SELECT *
FROM Customers
WHERE CompanyName LIKE '[a-c]%' -- beginnt mit A, B ODER C


-- alle Companies, die mit a, b, c, e, f, oder g enden
SELECT *
FROM Customers
WHERE CompanyName LIKE '%[a-c]' OR CompanyName LIKE '%[e-g]'

-- oder:
SELECT *
FROM Customers
WHERE CompanyName LIKE '%[a-c | e-g]'



-- alle CompanyNames, die mit a oder c beginnen und mit einem m oder e enden
SELECT *
FROM Customers
WHERE (CompanyName LIKE 'a%' OR CompanyName LIKE 'c%') AND (CompanyName LIKE '%m' OR CompanyName LIKE '%e')

-- oder:
SELECT *
FROM Customers
WHERE CompanyName LIKE '[am]%[me]'


-- Gib alle Produkte aus, deren Name mit D-L beginnt und mit a, b, c, d oder m, n, o endet

SELECT *
FROM Products
WHERE ProductName LIKE '[d-l]%' AND (ProductName LIKE '%[a-d]' OR ProductName LIKE '%[m-o]')

-- oder:
SELECT *
FROM Products
WHERE ProductName LIKE '[d-l]%[a-d|m-o]'


-- NOT - irgendetwas darf NICHT zutreffen:
SELECT *
FROM Customers
WHERE CompanyName LIKE '[^a-c]%' -- alle CompanyNames, die NICHT mit a-c beginnen


-- _ (Unterstrich) steht für genau 1 unbekanntes Zeichen
SELECT *
FROM Customers
WHERE Phone LIKE '(5) 555-47[0-9]9' -- vorletzte Ziffer unbekannt


SELECT *
FROM Customers
WHERE Phone LIKE '(5) 555-4_9' -- vorletztes Zeichen ist unbekannt



-- alle Kunden, die mit d-f beginnen, der letzte Buchstabe ist ein l und der drittletzte ein d
SELECT *
FROM Customers
WHERE CompanyName LIKE '[d-f]%' AND CompanyName LIKE 'd_l'

SELECT *
FROM Customers
WHERE CompanyName LIKE '[d-f]%d_l'

-- Ergebnis:
/*
	 Ernst Handel
	 exxxxxxxxxxxxdxl
	 exxxxxxdxl
	 edxl
	 ddxl
	 edel

*/


