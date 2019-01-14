SELECT TOP(3)
CONCAT(m.FirstName, ' ', m.LastName) AS [Mechanic], COUNT(m.MechanicId) AS [Jobs]
FROM Mechanics AS m
JOIN Jobs AS j ON j.MechanicId = m.MechanicId
WHERE j.[Status] != 'Finished'
GROUP BY CONCAT(m.FirstName, ' ', m.LastName), m.MechanicId
HAVING COUNT(m.MechanicId) > 1
ORDER BY COUNT(m.MechanicId) DESC, m.MechanicId ASC