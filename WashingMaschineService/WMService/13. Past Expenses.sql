SELECT j.JobId, ISNULL(SUM(op.Quantity * p.Price), 0)
FROM Jobs AS j
LEFT OUTER JOIN Orders AS o ON o.JobId = j.JobId
LEFT OUTER JOIN OrderParts AS op ON op.OrderId = o.OrderId
LEFT OUTER JOIN Parts AS p ON p.PartId = op.PartId
WHERE j.[Status] LIKE 'Finished'
GROUP BY j.JobId
ORDER BY ISNULL(SUM(op.Quantity * p.Price), 0) DESC, j.JobId ASC
