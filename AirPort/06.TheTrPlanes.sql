  SELECT Id, [Name], Seats, [Range]
    FROM Planes
   WHERE CHARINDEX('tr', [Name]) > 0
ORDER BY Id, [Name], Seats, [Range]