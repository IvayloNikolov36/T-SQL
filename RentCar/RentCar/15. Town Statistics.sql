--Select all towns and show the distribution of the placed orders between male and female clients in percentages.

SELECT
TownName, 
NULLIF((TotalM * 100 / Total), 0) AS MalePercent, 
NULLIF((TotalF * 100 / Total), 0) AS FemalePercent
FROM (SELECT
		TownName, 
		TownId,
		SUM(CountM) AS TotalM, 
		SUM(CountF) AS TotalF, 
		SUM(CountM + CountF) AS Total
		FROM (SELECT
				t.Name AS TownName, 
				t.Id AS TownId, 
				c.Gender, 
				COUNT(CASE WHEN c.Gender = 'M' THEN 1 END ) AS CountM, 
				COUNT(CASE WHEN c.Gender = 'F' THEN 1 END) AS CountF
				FROM
				Towns AS t 
				JOIN Orders AS o ON o.TownId = t.Id
				JOIN Clients AS c ON c.Id = o.ClientId
				GROUP BY t.[Name], t.Id, c.Gender) AS CountMF
		GROUP BY TownName, TownId) AS TotalMF
GROUP BY TownName, TotalM, TotalF, Total, TownId
ORDER BY TownName, TownId
