-- INNER JOIN


SELECT *
FROM Orders INNER JOIN Customers ON Orders.CustomerID = Customers.CustomerID



-- wenn der Name eindeutig ist (wenn wir wissen, aus welcher Tabelle er kommt), dann KÖNNEN wir den Tabellennamen davorschreiben, müssen aber nicht
-- wenn (wie bei der CustomerID) der Name in mehreren Tabellen vorkommt, dann MÜSSEN wir dazuschreiben, aus welcher Tabelle wir den nehmen wollen

SELECT	  Orders.OrderID 
		, Orders.ShippedDate
		, Orders.CustomerID -- hier geht beides: Orders.CustomerID geht auch
		, Customers.CompanyName
		, Customers.Address
	--	, ...
FROM Orders INNER JOIN Customers ON Orders.CustomerID = Customers.CustomerID


-- kürzere Schreibweise:
SELECT	  o.OrderID
		, o.ShippedDate
		, o.CustomerID -- hier geht beides: Orders.CustomerID geht auch
		, c.CompanyName
		, c.Address
	--	, ...
FROM Orders AS o INNER JOIN Customers AS c ON o.CustomerID = c.CustomerID


-- AS darf weggelassen werden:
SELECT	  o.OrderID
		, o.ShippedDate
		, o.CustomerID
		, c.CompanyName
		, c.Address
	--	, ...
FROM Orders o INNER JOIN Customers c ON o.CustomerID = c.CustomerID



-- auch hier können wir mit WHERE einschränken:
SELECT	  o.OrderID
		, o.ShippedDate
		, o.CustomerID
		, c.CompanyName
		, c.Address
	--	, ...
FROM Orders o INNER JOIN Customers c ON o.CustomerID = c.CustomerID
WHERE Country = 'Germany'


-- auch hier können wir wieder ein ORDER BY dranhängen:
SELECT	  o.OrderID
		, o.ShippedDate
		, o.CustomerID
		, c.CompanyName
		, c.Address
	--	, ...
FROM Orders o INNER JOIN Customers c ON o.CustomerID = c.CustomerID
WHERE Country = 'Germany'
ORDER BY CompanyName


-- alle Bestellungen, die von Angestelltem Nr. 3 bearbeitet wurden (Angestellter Name!)
SELECT	  OrderID
		, e.EmployeeID
		, FirstName
		, LastName
FROM Orders AS o INNER JOIN Employees AS e ON o.EmployeeID = e.EmployeeID
WHERE e.EmployeeID = 3


-- vollständiger Name in einer Spalte ausgeben
SELECT	  OrderID
		, e.EmployeeID
		, CONCAT(FirstName, ' ', LastName) AS FullName
FROM Orders AS o INNER JOIN Employees AS e ON o.EmployeeID = e.EmployeeID
WHERE e.EmployeeID = 3


-- Gib den Namen des Anbieters (Supplier), der Chai Tee verkauft, aus. (CompanyName, ProductName; optional: Ansprechperson, Telefonnummer)
SELECT	  s.SupplierID
		, CompanyName
		, ProductName
		, ContactName
		, Phone
FROM Suppliers s INNER JOIN Products p ON s.SupplierID = p.SupplierID
WHERE ProductName LIKE '%chai%'


SELECT *
FROM Suppliers s INNER JOIN Products p ON s.SupplierID = p.SupplierID
ORDER BY ProductName


-- Gib alle Kunden aus den USA und deren Frachtkosten aus. (CompanyName, Country, Freight)

SELECT	  CompanyName
		, Country
		, Freight
FROM Customers as c INNER JOIN Orders AS o ON c.CustomerID = o.CustomerID
WHERE Country = 'USA'


-- mehrere Tabellen miteinander verknüpfen
SELECT	  OrderID
		, c.CustomerID
		, CompanyName
		, LastName
		, FirstName
FROM Customers AS c INNER JOIN Orders AS o ON c.CustomerID = o.CustomerID
					INNER JOIN Employees AS e ON o.EmployeeID = e.EmployeeID
WHERE e.EmployeeID = 3


-- Welche Kunden haben Chai Tee gekauft und wieviel? (OrderID, CompanyName, ProductName, Quantity)
SELECT	  o.OrderID
		, CompanyName
		, ProductName
		, Quantity
FROM Customers c INNER JOIN Orders o ON c.CustomerID = o.CustomerID
				 INNER JOIN [Order Details] od ON o.OrderID = od.OrderID
				 INNER JOIN Products p ON od.ProductID = p.ProductID
WHERE ProductName LIKE '%chai%'


-- Suche alle Bestellungen, bei denen Bier verkauft wurde. Welcher Kunde? Wieviel? Welches Bier? (Der 
--Produktname kann "Bier" oder "Lager" enthalten oder mit "Ale" enden.)  
--a. Optional: Nach Menge und Kundenname geordnet. 
--b. Optional: Menge absteigend (größte zuerst), Kundenname aufsteigend (A-Z)

SELECT	  CompanyName
		, Quantity
		, ProductName
		, c.ContactName
FROM Customers c INNER JOIN Orders o ON c.CustomerID = o.CustomerID
				 INNER JOIN [Order Details] od ON o.OrderID = od.OrderID
				 INNER JOIN Products p ON od.ProductID = p.ProductID
WHERE ProductName LIKE '%bier%'
		OR ProductName LIKE '%lager%'
		OR ProductName LIKE '%ale'


-- WH/Aufwärmübung:
-- Gib die Namen der Anbieter (Supplier), die Sauce verkaufen, aus. (CompanyName, ProductName, Ansprechperson, Telefonnummer).

SELECT	  s.supplierID
		, s.CompanyName
		, ProductName
		, Phone
FROM Suppliers s INNER JOIN Products as p on s.SupplierID = p.SupplierID
WHERE ProductName LIKE '%sauce%' OR ProductName LIKE '%soße%'



-- Gib alle Kunden aus, die in der gleichen Stadt wohnen, wie ein anderer Kunde (nicht sie selbst).

SELECT	  c.CompanyName
		, c.City
		, c1.CompanyName
		, c1.City
FROM Customers as c INNER JOIN Customers as c1 ON c.PostalCode = c1.PostalCode
WHERE c.CompanyName != c1.CompanyName
ORDER BY c.City


-- LEFT JOIN
SELECT *
FROM Customers c LEFT JOIN Orders o ON c.CustomerID = o.CustomerID
WHERE OrderID IS NULL


