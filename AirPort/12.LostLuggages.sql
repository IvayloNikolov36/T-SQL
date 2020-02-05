SELECT p.PassportId, p.[Address]
FROM Passengers AS p
LEFT JOIN Luggages AS l ON p.Id = l.PassengerId
WHERE l.Id IS NULL
ORDER BY PassportId, p.[Address]