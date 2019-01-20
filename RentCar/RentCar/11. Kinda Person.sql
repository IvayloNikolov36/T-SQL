
SELECT 
CONCAT(cl.FirstName, ' ', cl.LastName) AS [Names], m.Class
FROM Orders AS o
JOIN Clients AS cl ON cL.Id = o.Id
JOIN Vehicles AS v ON v.Id = o.VehicleId
JOIN Models AS m ON m.Id = v.ModelId
