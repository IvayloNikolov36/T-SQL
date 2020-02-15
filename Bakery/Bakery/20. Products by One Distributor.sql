SELECT p.[Name] AS [ProductName], 
	   AVG(f.Rate) AS [ProductAverageRate], 
	   d.[Name] AS [DistributorName], 
	   c.[Name] AS [DistributorCountry]
FROM Products AS p
JOIN ProductsIngredients AS pri ON p.Id = pri.ProductId
JOIN Ingredients AS i ON pri.IngredientId = i.Id
JOIN Distributors AS d ON i.DistributorId = d.Id
JOIN Countries AS c ON d.CountryId = c.Id
LEFT JOIN Feedbacks AS f ON p.Id = f.ProductId
WHERE p.Id IN (SELECT p.Id
			   FROM Products AS p
			   JOIN ProductsIngredients AS pri ON p.Id = pri.ProductId
			   JOIN Ingredients AS i ON pri.IngredientId = i.Id
			   JOIN Distributors AS d ON i.DistributorId = d.Id
			   GROUP BY p.Id
			   HAVING COUNT(DISTINCT d.Id) = 1)
GROUP BY p.Id, p.[Name], d.[Name], c.[Name]
ORDER BY p.Id
