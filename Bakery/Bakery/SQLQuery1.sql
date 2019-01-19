

(SELECT ProductId	
FROM
	(SELECT
	p.Id AS ProductId,
	p.Name AS ProductName,
	AVG(f.Rate) AS AverageRate, 
	d.Name AS DistributorName, 
	cn.Name AS DistributorCountry,
	DENSE_RANK() OVER (PARTITION BY p.[Name] ORDER BY d.[Name]) AS [Rank]
	FROM Products AS p
	JOIN Feedbacks AS f ON f.ProductId = p.Id
	JOIN ProductsIngredients AS pin ON pin.ProductId = p.Id
	JOIN Ingredients AS i ON i.Id = pin.IngredientId
	JOIN Distributors AS d ON d.Id = i.DistributorId
	JOIN Countries AS cn ON cn.Id = d.CountryId
	GROUP BY p.Id, p.[Name], d.[Name], cn.[Name]) AS RankedProducts
WHERE [Rank] > 1) AS ProductIDsWithMoreThanOneDistributor


SELECT
	p.[Name] AS ProductName,
	AVG(f.Rate) AS AverageRate, 
	d.[Name] AS DistributorName, 
	cn.[Name] AS DistributorCountry
	FROM Products AS p
	JOIN Feedbacks AS f ON f.ProductId = p.Id
	JOIN ProductsIngredients AS pin ON pin.ProductId = p.Id
	JOIN Ingredients AS i ON i.Id = pin.IngredientId
	JOIN Distributors AS d ON d.Id = i.DistributorId
	JOIN Countries AS cn ON cn.Id = d.CountryId
GROUP BY p.[Name], d.[Name], cn.[Name]