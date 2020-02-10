SELECT TOP(1) WITH TIES
	m.[Name],
	COUNT(j.JobId) AS [Times Serviced],
	(SELECT ISNULL(SUM(op.Quantity * p.Price), 0)
		FROM Jobs AS j
		JOIN Orders AS o ON 
			o.JobId = j.JobId
		JOIN OrderParts AS op ON 
			op.OrderId = o.OrderId
		JOIN Parts AS p ON 
			p.PartId = op.PartId
		WHERE j.ModelId = m.ModelId) AS [Total Parts]
FROM Models AS m
JOIN Jobs AS j ON 
	m.ModelId = j.ModelId
GROUP BY m.ModelId, m.[Name]
ORDER BY [Times Serviced] DESC

