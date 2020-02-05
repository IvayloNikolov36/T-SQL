SELECT f.Destination, COUNT(t.Id) AS [TripsCount]
FROM Flights AS f
LEFT JOIN Tickets AS t ON f.Id = t.FlightId
GROUP BY f.Destination
ORDER BY TripsCount DESC, f.Destination