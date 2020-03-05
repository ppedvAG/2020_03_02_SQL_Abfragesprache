-- Distinct

SELECT Country
FROM Customers

-- wie bekomme ich alle L�nder, in denen wir Kunden haben?

SELECT DISTINCT Country
FROM Customers
-- 21 Zeilen Ergebnis - jedes Land kommt nur noch einmal vor


SELECT DISTINCT CustomerID, Country
FROM Customers
-- in diesem Fall bringt es nix, wir bekommen wieder ALLE Kunden raus, weil die CustomerID eindeutig ist (es gibt keine doppelten CustomerIDs, die wir wegk�rzen k�nnten)


SELECT DISTINCT Country, City
FROM Customers
ORDER BY Country
-- so viele Treffer wie Cities (69)


-- alle St�dte, in denen wir Kunden haben?
SELECT DISTINCT City
FROM Customers


-- Liste von allen L�ndern, in denen Angestellte wohnen?
SELECT DISTINCT Country
FROM Employees


-- �berpr�fen:
SELECT *
FROM Employees
