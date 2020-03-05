-- WHERE clause, WHERE-Klausel, WHERE Bedingung
-- wenn man nur bestimmte Daten abfragen möchte


/*
SELECT	  Spaltenname
		, Spaltenname
		, ...
FROM Tabellenname
WHERE Bedingung



*/

/*
-- WHERE Operatoren:

		=, <, >, <=, >=
		!=, <>           ............. darf NICHT einem bestimmten Wert entsprechen


		AND, OR

		bei NULL keine mathematischen Operatoren verwenden:
		IS NULL
		IS NOT NULL 


*/


SELECT	  CustomerID
		, CompanyName
		, Country
FROM Customers


-- NUR die Kunden aus Deutschland

SELECT	  CustomerID
		, CompanyName
		, Country
FROM Customers
WHERE Country = 'Germany'


-- alle Kunden, die in Salzburg ansässig sind?
SELECT	  CustomerID
		, CompanyName
		, Country
		, City
FROM Customers
WHERE City = 'Salzburg'


-- Was ist das Produkt mit der ProductID 7?
SELECT	  ProductID
		, ProductName
		, UnitPrice
FROM Products
WHERE ProductID = 7



-- Bestellungen von Angestellter NR 3

SELECT    OrderID
		, OrderDate
		, EmployeeID
FROM Orders
WHERE EmployeeID = 3


-- mehrere Bedingungen mit AND und OR

-- alle, die in Deutschland in Berlin wohnen
SELECT *
FROM Customers
WHERE Country = 'Germany' AND City = 'Berlin'


SELECT *
FROM Customers
WHERE Country = 'Germany' OR Country = 'Austria'

-- mehr als 100 Produkte vorhanden:
SELECT *
FROM Products
WHERE UnitsInStock > 100


-- Frachtkostenwert ist kleiner als 76
SELECT *
FROM Orders
WHERE Freight < 76


-- alle Bestellungen, wo Frachtkosten höher als 100, aber kleiner als 200 sind

SELECT *
FROM Orders
WHERE Freight > 100 AND Freight < 200

-- mit 100 und 200 inklusive:
SELECT *
FROM Orders
WHERE Freight >= 100 AND Freight <= 200

-- andere Schreibweise:
SELECT *
FROM Orders
WHERE Freight BETWEEN 100 AND 200 -- (hier ist 100 und 200 inkludiert)


-- alle Bestellungen, die vom Employee 3, 4 und 7 bearbeitet worden sind
SELECT *
FROM Orders
WHERE EmployeeID = 3 OR EmployeeID = 4 OR EmployeeID = 7

-- bisschen kürzere Schreibweise:
SELECT *
FROM Orders
WHERE EmployeeID IN(3, 4, 7)

SELECT *
FROM Customers
WHERE Country IN('Germany', 'Austria')

-- alle Spalten:

SELECT	  CustomerID
		, CompanyName
		, ContactName
	--	, ...
FROM Customers
WHERE Country IN('Germany', 'Austria')

