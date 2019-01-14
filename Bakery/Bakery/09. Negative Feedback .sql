SELECT F.[ProductId], F.Rate, F.[Description], F.CustomerId, C.Age, C.Gender  
FROM Feedbacks AS F
INNER JOIN Customers AS C ON F.CustomerId = C.Id
WHERE F.Rate < 5
ORDER BY F.ProductId DESC, F.Rate ASC
