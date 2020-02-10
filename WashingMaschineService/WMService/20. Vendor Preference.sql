SELECT
  y.Mechanic,y.Vendor,y.Parts,
  CONCAT(CAST((100.00 / y.[TotalParts]) * y.Parts AS int), '%') AS [Preference]
FROM (SELECT
	    x.*, SUM(x.Parts) OVER (PARTITION BY x.Mechanic ORDER BY x.MechanicId) AS [TotalParts]
        FROM (SELECT
		        m.MechanicId, CONCAT(m.FirstName, ' ', m.LastName) AS [Mechanic],
		        v.[Name] AS [Vendor],SUM(op.Quantity) AS [Parts]
		        FROM Mechanics AS m
		        JOIN Jobs AS j ON m.MechanicId = j.MechanicId
		        JOIN Orders AS o ON j.JobId = o.JobId
		        JOIN OrderParts AS op ON o.OrderId = op.OrderId
		        JOIN Parts AS p ON op.PartId = p.PartId
		        JOIN Vendors AS v ON p.VendorId = v.VendorId
		        GROUP BY m.MechanicId, m.FirstName, m.LastName, v.VendorId, v.[Name]
	          ) AS x
     ) AS Y
ORDER BY y.Mechanic, y.Parts DESC, y.Vendor