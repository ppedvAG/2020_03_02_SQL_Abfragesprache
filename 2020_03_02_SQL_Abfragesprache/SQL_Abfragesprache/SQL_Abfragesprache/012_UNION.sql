-- UNION

SELECT *
FROM Customers c INNER JOIN Orders o ON c.CustomerID = o.CustomerID


-- wenn wir beide SELECTs ausführen, bekommen wir zwei Tabellen raus
SELECT 'Testtext1'

SELECT 'Testtext2'


-- wenn wir es nebeneinander (in ein SELECT) bekommen wir zwei Spalten raus
SELECT 'Testtext1', 'Testtext2'


-- mit UNION können wir das in einer Liste ausgeben
SELECT 'Testtext1'
UNION
SELECT 'Testtext2'


-- Liste von allen Kontaktpersonen
-- NICHT mit Joins
SELECT	  c.ContactName
		, c.Phone
		, s.ContactName
		, s.Phone
FROM Customers c INNER JOIN Orders o ON c.CustomerID = o.CustomerID
				 INNER JOIN [Order Details] od ON o.OrderID = od.OrderID
				 INNER JOIN Products p ON od.ProductID = p.ProductID
				 INNER JOIN Suppliers s ON p.SupplierID = s.SupplierID



SELECT	  ContactName
		, Phone
FROM Customers
UNION
SELECT	  ContactName
		, Phone
FROM Suppliers



-- wie halte ich Suppliers und Customers auseinander?
SELECT	  ContactName
		, Phone
		, 'C' AS Category
FROM Customers
UNION
SELECT	  ContactName
		, Phone
		, 'S'
FROM Suppliers


-- wir müssen bei UNION die gleiche Spaltenanzahl in beiden Abfragen haben

SELECT	  'Test!'
	--	, 123  -- funktioniert nicht - wir brauchen gleiche Spaltenanzahl
		, Phone
FROM Customers
UNION
SELECT	  'Test2'
		, 12345
		, Phone
FROM Suppliers


-- gleiche Datentypen in selber Spalte verwenden!!
SELECT	  'Test!'
	    , 'noch ein Test' -- funktioniert nicht!
		, Phone
FROM Customers
UNION
SELECT	  'Test2'
		, 12345
		, Phone
FROM Suppliers


-- funktioniert NICHT, weil CustomerID und EmployeeID unterschiedliche Datentypen sind
SELECT CustomerID, Phone
FROM Customers
UNION
SELECT EmployeeID, HomePhone
FROM Employees

-- wir KÖNNTEN EmployeeID in einen anderen Datentyp umwandeln, damit es funktioniert
SELECT CustomerID, Phone
FROM Customers
UNION
SELECT CAST(EmployeeID AS nvarchar), HomePhone
FROM Employees



-- funktioniert, aber SINN??
SELECT    OrderID
		, ShipCountry
		, ShipName
FROM Orders
UNION
SELECT    EmployeeID
		, Country
		, 'blabla'
FROM Employees



-- funktioniert, aber SINN?
SELECT    OrderID
		, ShipCountry
		, ShipName
FROM Orders
UNION
SELECT    EmployeeID
		, Country
		, NULL
FROM Employees



-- UNION macht auch ein DISTINCT
SELECT 'Test'
UNION
SELECT 'Test'


-- wenn man das nicht möchte, dann UNION ALL
SELECT 'Test'
UNION ALL
SELECT 'Test'



-- höchster und niedrigster Frachtkostenwert in einer Liste

-- so gehts nicht:
SELECT TOP 1 OrderId, Freight, 'niedrigster Wert'
FROM Orders
ORDER BY Freight -- dieses ORDER BY geht nicht!
UNION
SELECT TOP 1 OrderId, Freight, 'höchster Wert'
FROM Orders
ORDER BY Freight DESC -- gilt für den gesamten Ausdruck! (auch für das erste SELECT)


-- wäre mit Subselect möglich:
SELECT *
FROM (SELECT TOP 1 OrderId, Freight, 'niedrigster Wert' AS Wert FROM Orders ORDER BY Freight) AS n
UNION
SELECT *
FROM (SELECT TOP 1 OrderId, Freight, 'höchster Wert' AS Wert FROM Orders ORDER BY Freight DESC) AS h
