-- Datumsfunktionen

-- ********************** Datum abfragen ********************************
-- auf ca. 3-4 Millisekunden genau; Datentyp datetime, 8 byte
SELECT GETDATE()

-- auf mehrere Nanosekunden genau; Datentyp datetime2, 6-8 byte
SELECT SYSDATETIME()


-- Datumsberechnungen

-- ohne Zeitangabe gehen wir von 0:00 Uhr aus
SELECT DATEADD(hh, 10, '2020-03-02')

-- mit Zeitangabe
SELECT DATEADD(hh, 10, '2020-03-02 09:53')


-- Information aus Datenbank holen
SELECT	  DATEADD(hh, 10, HireDate) AS HireDate2
		, HireDate
FROM Employees


-- mit aktuellem Datum rechnen
SELECT DATEADD (hh, 10, ?)
SELECT SYSDATETIME()
SELECT DATEADD(hh, 10, SYSDATETIME())


-- auch negative Vorzeichen sind erlaubt:
SELECT DATEADD(hh, -10, '2020-03-02')


-- aufpassen mit dem Format:

SELECT DATEADD(hh, 10, '02.03.2020') -- was ist Monat, was ist Tag?? Vorsicht!!


-- Datumsdifferenz mit DATEDIFF
-- Differenz zwischen zwei Daten berechnen:
SELECT DATEDIFF(dd, '2020-04-10', '2020-03-03') -- -38 
SELECT DATEDIFF(dd, '2020-03-03', '2020-04-10') -- 38

-- mit aktuellem Datum:
SELECT DATEDIFF(dd, SYSDATETIME(), '2020-04-10') -- 38

-- Information aus der Datenbank einfügen:
SELECT DATEDIFF(yyyy, HireDate, SYSDATETIME())
FROM Employees

SELECT DATEADD(dd, 38, SYSDATETIME())


-- Vor wie vielen Jahren kam der erste Star Wars Film in die Kinos? (25. Mai 1977 )

SELECT DATEDIFF(yy, '1977-05-25', GETDATE())


SELECT DATEDIFF(yy, '1977', GETDATE())


SELECT DATEDIFF(yy, '1977', '2020')


-- Datumsteile ausgeben
SELECT DATEPART(dd, '2020-03-02')

SELECT DATEPART(MM, SYSDATETIME())

SELECT DATEPART(yyyy, Hiredate)
FROM Employees


-- in welchem Quartal liegt der nächste Feiertag?
SELECT DATEPART(qq, '2020-04-10')


-- Name ausgeben lassen: DATENAME
SELECT DATENAME(dd, SYSDATETIME()) -- bringt nix, ist wieder die Zahl

SELECT DATENAME(dw, SYSDATETIME()) -- dw = day of week (Wochentag)

SELECT DATENAME(month, SYSDATETIME())



-- an welchem Wochentag war Euer Geburtstag?
SELECT DATENAME(dw, '1981-04-22')


-- Gib Tag, Monat und Jahr deines Geburtstages in einer jeweils eigenen Spalte aus:
-- Tag	 Monat	 Jahr
--  22	  04	 1981

SELECT	  DATEPART(dd, '2020-03-02') AS Tag
		, DATEPART(MM, '2020-03-02') AS Monat
		, DATEPART(yyyy, '2020-03-02') AS Jahr



-- gleiches Ergebnis, andere Schreibweise: 
SELECT	  DAY('2020-03-02') AS Tag
		, MONTH('2020-03-02') AS Monat
		, YEAR('2020-03-02') AS Jahr


-- Einstellungsjahr von allen Angestellten:

SELECT YEAR(HireDate) AS Einstellungsjahr
FROM Employees

SELECT HireDate
FROM Employees













-- Intervalle:
/*
	year, yyyy, yy ........ Jahr
	quarter, qq, q ........ Quartal
	month, MM, M .......... Monat
	week, ww, wk .......... Woche
	day, dd, d   .......... Tag
	hour, hh   ............ Stunde
	minute, mi, n ......... Minute
	second, ss, s ......... Sekunde
	millisecond, ms ....... Millisekunde
	nanosecond, ns ........ Nanosekunde

	weekday, dw, w ........ Weekday, day of week (Wochentag)
	dayofyear, dy, y ...... day of the year (Jahrestag)

*/