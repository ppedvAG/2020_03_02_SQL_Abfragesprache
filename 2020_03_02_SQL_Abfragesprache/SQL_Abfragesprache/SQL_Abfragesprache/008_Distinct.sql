-- Distinct

SELECT Country
FROM Customers

-- wie bekomme ich alle Länder, in denen wir Kunden haben?

SELECT DISTINCT Country
FROM Customers
-- 21 Zeilen Ergebnis - jedes Land kommt nur noch einmal vor


SELECT DISTINCT CustomerID, Country
FROM Customers
-- in diesem Fall bringt es nix, wir bekommen wieder ALLE Kunden raus, weil die CustomerID eindeutig ist (es gibt keine doppelten CustomerIDs, die wir wegkürzen könnten)


SELECT DISTINCT Country, City
FROM Customers
ORDER BY Country
-- so viele Treffer wie Cities (69)


-- alle Städte, in denen wir Kunden haben?
SELECT DISTINCT City
FROM Customers


-- Liste von allen Ländern, in denen Angestellte wohnen?
SELECT DISTINCT Country
FROM Employees


-- überprüfen:
SELECT *
FROM Employees
