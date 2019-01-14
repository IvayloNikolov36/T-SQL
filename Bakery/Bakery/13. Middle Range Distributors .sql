SELECT D.[Name] AS DistributorName, 
	I.[Name] AS IngredientName, 
	P.[Name] AS ProductName, 
	AVG(F.Rate) AS AverageRate
FROM Distributors AS D
INNER JOIN Ingredients AS I ON I.DistributorId = D.Id
INNER JOIN ProductsIngredients AS PRIN ON PRIN.IngredientId = I.Id
INNER JOIN Products AS P ON P.Id = PRIN.ProductId
INNER JOIN Feedbacks AS F ON F.ProductId = P.Id
GROUP BY D.[Name], I.[Name], P.[Name]
HAVING AVG(F.Rate) BETWEEN 5 AND 8
ORDER BY D.[Name], I.[Name], P.[Name]
