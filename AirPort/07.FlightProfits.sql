SELECT t.FlightId, SUM(t.Price) AS [Price]
FROM Flights AS f
JOIN Tickets AS t ON f.Id = t.FlightId
GROUP BY t.FlightId
ORDER BY [Price] DESC, t.FlightId 