-- TOP-Abfragen
-- ORDER BY notwendig!!


SELECT *
FROM Customers


-- wie bekomme ich nur die erste Zeile?
SELECT TOP 1 *
FROM Customers

-- was ist jetzt die erste Zeile??
SELECT TOP 1 *
FROM Customers
ORDER BY CustomerID



-- Top x% abfragen:
SELECT TOP 10 PERCENT *
FROM Customers
ORDER BY CustomerID



-- nur bestimmte Spalten auswählen:

SELECT TOP 10 PERCENT
		  CustomerID
		, CompanyName
		, ContactName
		, Phone
	--	, ...
FROM Customers
ORDER BY CustomerID


-- TOP 10% mit den geringsten Frachtkosten?
SELECT TOP 10 PERCENT
	  Freight
	, CustomerID
FROM Orders
ORDER BY Freight -- DESC für die höchsten Frachtkosten


-- die letzten drei 
SELECT TOP 3 *
FROM Customers
ORDER BY CustomerID DESC


-- Gib das teuerste Produkt aus (263,50): 
SELECT TOP 1 *
FROM Products
ORDER BY UnitPrice DESC 

-- Suche die Top 10% der Produkte mit den größten Verkaufsmengen (ProductName, Quantity).
SELECT TOP 10 PERCENT ProductName
					, Quantity
FROM Products p INNER JOIN [Order Details] od ON p.ProductID = od.ProductID
ORDER BY Quantity DESC


-- WITH TIES 
SELECT TOP 1 PERCENT WITH TIES *
FROM Products
ORDER BY UnitPrice DESC


-- erste 13 Kunden mit den geringsten Frachtkosten?
SELECT TOP 13 *
FROM Orders
ORDER BY Freight

-- wenn der 14. den gleichen Wert hat?
SELECT TOP 13 WITH TIES 
		  c.CustomerId
		, CompanyName
		, Freight
FROM Orders AS o INNER JOIN Customers AS c ON o.CustomerID = c.CustomerID
ORDER BY Freight


--Gib die drei Mitarbeiter, die als erste eingestellt wurden, aus (die schon am längsten beim Unternehmen sind).
SELECT TOP 3	EmployeeID
			  , LastName
			  , HireDate
FROM Employees
ORDER BY HireDate


/*

SELECT - Spalte(n)
FROM - Tabelle(n)
WHERE - Bedingungen
ORDER BY - Spalte(n)



SELECT TOP Zahl|PERCENT [WITH TIES] Spalten
FROM - Tabelle(n)
WHERE - Bedingungen
ORDER BY - Spalte(n)


*/
