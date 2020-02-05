   SELECT x.FirstName, x.LastName, x.Destination, x.Price
     FROM (SELECT p.FirstName, p.LastName, f.Destination, t.Price,
   	              ROW_NUMBER() 
   	  				OVER(PARTITION BY p.FirstName, p.LastName ORDER BY t.Price DESC) AS [RowNum]
   	         FROM Passengers AS p
   	         JOIN Tickets AS t ON p.Id = t.PassengerId
   	         JOIN Flights AS f ON t.FlightId = f.Id) AS x
   WHERE x.RowNum = 1
ORDER BY x.Price DESC, x.FirstName, x.LastName, x.Destination
