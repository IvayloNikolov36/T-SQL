SELECT CONCAT(m.FirstName, ' ', M.LastName) AS [Mechanic], 
AVG(DATEDIFF(DAY, j.IssueDate, j.FinishDate)) AS [Average Days]
FROM Mechanics AS m
JOIN Jobs AS j ON j.MechanicId = m.MechanicId
WHERE j.[Status] LIKE 'Finished'
GROUP BY CONCAT(m.FirstName, ' ', M.LastName), m.MechanicId
ORDER BY m.MechanicId 