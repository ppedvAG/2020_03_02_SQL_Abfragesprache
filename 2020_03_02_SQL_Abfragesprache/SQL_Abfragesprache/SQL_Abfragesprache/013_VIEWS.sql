-- VIEWS (Sichten)

/*
	CREATE VIEW vName
	AS
	SELECT Spalten
	FROM Tabellen
	WHERE

*/



-- Bsp.:

CREATE VIEW v_Test005
AS
SELECT CustomerID, CompanyName
FROM Customers



SELECT CompanyName
FROM v_Test005
WHERE CustomerID LIKE '%ALF%'



CREATE VIEW v_Customer_Contacts
AS
SELECT	  CustomerID
		, CompanyName
		, ContactName
		, Phone
		, Address
		, Country
FROM Customers

SELECT CompanyName, Phone
FROM v_Customer_Contacts


CREATE VIEW v_Customers_Products_03
AS
SELECT	  c.CustomerID
		, c.CompanyName
		, o.OrderID
		, o.Freight
		, od.Quantity
		, p.ProductID
		, p.ProductName
	--	, ...
FROM Customers c INNER JOIN Orders o ON c.CustomerID = o.CustomerID
				 INNER JOIN [Order Details] od ON o.OrderID = od.OrderID
				 INNER JOIN Products p ON od.ProductID = p.ProductID



SELECT *
FROM v_Customers_Products_03
