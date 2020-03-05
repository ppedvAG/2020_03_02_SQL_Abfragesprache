-- Subselect
-- Subquery
-- Unterabfragen

/*

SELECT (SELECT ....) - wie Spalte verwenden (hier darf nur ein Wert drinstehen)
FROM (SELECT ...) - wie  eine Tabelle, als Datenquelle verwenden
WHERE (SELECT ...) - zum Vergleichen

*/

SELECT	  CustomerID
		, CompanyName
		, 'Test' -- steht dann in allen Zeilen
FROM Customers

-- Subquery im SELECT
SELECT	  'Text'
		, Freight
		, (SELECT TOP 1 Freight FROM Orders) -- steht in allen Zeilen
FROM Orders


-- Subquery wie eine Tabelle verwenden
SELECT *
FROM -- aus welcher Tabelle kommt das?
		(SELECT OrderID, Freight FROM Orders WHERE EmployeeID = 3) AS t1
		-- wenn Subquery als Datenquelle dann MUSS man ein Alias vergeben ... AS Name)
WHERE t1.Freight > 100



-- Subquery im WHERE

SELECT *
FROM Orders
WHERE Freight > 100 

-- Mittelwert der Frachtkosten:
SELECT AVG(Freight)
FROM Orders


-- alle Bestellungen, wo die Frachtkosten größer sind als der Mittelwert der Frachtkosten
SELECT *
FROM Orders
WHERE Freight > (SELECT AVG(Freight) FROM Orders)
ORDER BY Freight
