SELECT ISNULL(SUM(op.Quantity * p.Price), 0) AS [Parts Total]
FROM Orders AS o
JOIN OrderParts AS op ON op.OrderId = o.OrderId
JOIN Parts AS p ON p.PartId = op.PartId
WHERE DATEDIFF(WEEK, o.IssueDate, '2017-04-24') <= 3