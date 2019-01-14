SELECT f.ProductId, CONCAT(c.FirstName, ' ', c.LastName) AS CustomerName, f.Description AS FeedbackDescription
FROM Feedbacks AS f
INNER JOIN Customers AS c ON c.Id = f.CustomerId
WHERE f.CustomerId IN (
	SELECT [CustomerId] FROM Feedbacks
	GROUP BY [CustomerId]
	HAVING COUNT([CustomerId]) >= 3
)
ORDER BY f.ProductId, CustomerName, f.Id



