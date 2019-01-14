SELECT TOP(10) P.[Name], P.[Description], AVG(F.[Rate]) AS [AverageRate], COUNT(F.[Id]) AS [FeedbacksAmount]
 FROM Products AS P
INNER JOIN Feedbacks AS F ON P.[Id] = F.[ProductId]
GROUP BY P.[Name], P.[Description]
ORDER BY AverageRate DESC, FeedbacksAmount DESC