SELECT	  p.FirstName AS [First Name], 
		  p.LastName AS [Last Name], 
		  COUNT(f.Id) AS [Total Trips] 
    FROM  Passengers AS p
LEFT JOIN Tickets AS t ON p.Id = t.PassengerId
LEFT JOIN Flights AS f ON t.FlightId = f.Id
GROUP BY  p.Id, p.FirstName, p.LastName
ORDER BY  [Total Trips] DESC, [First Name], [Last Name]