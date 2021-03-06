SELECT 
m.ModelId, m.[Name], 
CONCAT(AVG(DATEDIFF(DAY, j.IssueDate, j.FinishDate)), ' ', 'days') AS [Average Service Time]
FROM Models AS m
LEFT OUTER JOIN Jobs AS j ON j.ModelId = m.ModelId
WHERE j.FinishDate IS NOT NULL
GROUP BY m.ModelId, m.[Name]
ORDER BY [Average Service Time] 
