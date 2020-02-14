SELECT x.CountryName, x.DistributorName
FROM (SELECT c.[Name] AS [CountryName], 
       d.[Name] AS [DistributorName], 
	   COUNT(i.Id) AS [IngredientsCount],
	   DENSE_RANK() OVER(PARTITION BY c.[Name] ORDER BY COUNT(i.Id) DESC) AS Rank
	   FROM Distributors AS d
       LEFT JOIN Ingredients AS i ON d.Id = i.DistributorId
       JOIN Countries AS c ON d.CountryId = c.Id
       GROUP BY c.[Name], d.[Name]) AS x
	   WHERE Rank = 1
ORDER BY CountryName, DistributorName

