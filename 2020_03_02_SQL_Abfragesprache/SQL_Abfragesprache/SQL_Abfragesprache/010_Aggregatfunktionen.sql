-- Aggregatfunktionen
-- aggregate functions


/*
	COUNT() - zählen
	AVG() - Mittelwert berechnen
	MIN() - kleinster Wert
	MAX() - größter Wert
	SUM() - Summe bilden


*/

SELECT COUNT(*)
FROM Customers
-- gleiches Ergebnis mit:
SELECT COUNT(CustomerID)
FROM Customers
-- gleiches Ergebnis - jeder Customer hat auch ein Country!
SELECT COUNT(Country)
FROM Customers

-- wenn wir nur die Countries zählen wollen, in denen wir Kunden haben (keine doppelten)
SELECT COUNT(DISTINCT Country)
FROM Customers


-- wie zählen wir, wieviele Produkte wir haben?
SELECT COUNT(ProductID)
FROM Products


-- wieviele Bestellungen haben wir insgesamt?
SELECT COUNT(OrderID)
FROM Orders



-- Einschub - Übung
/*
Gib die Bestellnummer,
     den Wunschtermin,
      das Lieferdatum und
     die Lieferverzögerung aus.
Ergebnisse von Bestellungen, die noch nicht geliefert wurden, sollen nicht ausgegeben werden.
Ordne das Ergebnis absteigend von der größten zur kleinsten Lieferverzögerung.
*/

SELECT	  OrderID
		, RequiredDate
		, ShippedDate
		, DATEDIFF(dd, RequiredDate, ShippedDate) AS Lieferverzögerung
FROM Orders
WHERE DATEDIFF(dd, RequiredDate, ShippedDate) IS NOT NULL
ORDER BY Lieferverzögerung DESC

-- Einschub Ende


-- Mittelwert berechnen (average)

-- durchschnittlicher UnitPrice (28,8663)
SELECT AVG(UnitPrice)
FROM Products

-- niedrigsten Preis (2,50)
SELECT MIN(UnitPrice)
FROM Products

-- höchster Preis (263,50)
SELECT MAX(UnitPrice)
FROM Products


-- macht keinen Sinn, weil wir nur einen UnitPrice pro Produkt haben (wir bekommen wieder alle Produkte heraus)
SELECT MAX(UnitPrice), ProductName
FROM Products
GROUP BY ProductName



-- Summe bilden
-- Summe ALLER Frachtkosten von ALLEN Bestellungen
SELECT SUM(Freight)
FROM Orders


-- Summe Frachtkosten PRO KUNDE
SELECT SUM(Freight), CustomerID
FROM Orders
GROUP BY CustomerID
-- nur 89 Ergebnisse, weil 2 Kunden von den 91 noch nichts bestellt haben



SELECT		SUM(Freight) AS FreightSum
		  , CustomerID
		  , ShipCountry
FROM Orders
GROUP BY CustomerID, ShipCountry
ORDER BY CustomerID

-- wieviele Kunden gibts PRO Stadt im jeweiligen Land?
-- Country, City, Anzahl Kunden

SELECT Country, City, COUNT(CustomerID) AS CustomerCount
FROM Customers
GROUP BY Country, City -- pro... was? Pro Stadt und Land
ORDER BY Country, City


-- wie bekomme ich die Rechnungssumme?
SELECT	  OrderID
		, SUM(UnitPrice*Quantity) AS Rechnungsbetrag
FROM [Order Details]
GROUP BY OrderID

-- Rechnungsposten
SELECT	  OrderID
		, ProductID
		, Quantity
		, UnitPrice*Quantity AS Price
FROM [Order Details]

