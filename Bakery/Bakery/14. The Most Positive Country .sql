SELECT TOP(1) WITH TIES
	cn.[Name] AS CountryName,
	AVG(f.Rate) AS FeedbackRate 
FROM Feedbacks AS f
JOIN Customers AS cu ON cu.Id = f.CustomerId
JOIN Countries AS cn ON cn.Id = cu.CountryId
GROUP BY cn.Name
ORDER BY AVG(f.Rate) DESC