SELECT TOP (10) p.FirstName, p.LastName, t.Price
FROM Passengers AS p
JOIN Tickets AS t ON p.Id = t.PassengerId
ORDER BY [Price] DESC