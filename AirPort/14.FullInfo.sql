SELECT CONCAT(p.FirstName, ' ', p.LastName) AS [Full Name],
pl.[Name] AS [Plane Name],
CONCAT(f.Origin, ' - ', f.Destination) AS [Trip],
lt.[Type] AS [Luggage Type] 
FROM Passengers AS p
JOIN Tickets AS t ON p.Id = t.PassengerId
JOIN Flights AS f ON t.FlightId = f.Id
JOIN Planes AS pl ON f.PlaneId = pl.Id
JOIN Luggages AS l ON t.LuggageId = l.Id
JOIN LuggageTypes AS lt ON l.LuggageTypeId = lt.Id
ORDER BY [Full Name], [Plane Name], f.Origin, f.Destination, [Luggage Type]


SELECT *
FROM Passengers AS p
JOIN Tickets AS t ON p.Id = t.PassengerId
JOIN Flights AS f ON t.FlightId = f.Id
JOIN Planes AS pl ON f.PlaneId = pl.Id
WHERE p.FirstName LIKE 'Olympie'