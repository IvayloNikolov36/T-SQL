SELECT 
	c.[Name] AS CountryName, 
	d.[Name] AS DistributorName
FROM Countries AS c
JOIN Distributors AS d ON c.Id = d.CountryId
JOIN Ingredients AS i ON i.DistributorId = d.Id
GROUP BY c.[Name], d.[Name]
ORDER BY COUNT(d.Id) DESC

--ALL DISTRIBUTORS WITH COUNT OF INGREDIENTS
FROM(
	SELECT 
		d.Id AS DistributorName, 
		COUNT(i.Id) AS CountIngredients
	FROM Ingredients AS i
	JOIN Distributors AS d ON d.Id = i.DistributorId
	JOIN Countries AS c ON c.Id = d.CountryId
	GROUP BY d.Id
) AS  DistrIngrCount


