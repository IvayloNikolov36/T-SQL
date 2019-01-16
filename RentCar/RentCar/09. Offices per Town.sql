--Select all towns and show the total number of offices per each town.

SELECT t.[Name] AS [TownName], COUNT(o.Id) AS [OfficesCount]
FROM Towns AS t
JOIN Offices AS o ON o.TownId = t.Id
GROUP BY t.[Name]
ORDER BY OfficesCount DESC, TownName ASC