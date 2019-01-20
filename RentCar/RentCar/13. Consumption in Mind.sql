SELECT Manufacturer, AverageConsumption
FROM (SELECT TOP(7)
	  Manufacturer, VehicleModel, Consumption AS AverageConsumption, MAX([Rank]) AS TimesOrdered
	  FROM (SELECT 
				m.Manufacturer AS Manufacturer,
				m.Model AS VehicleModel,
				CONVERT(DECIMAL(8,6), m.Consumption) AS Consumption, 
				DENSE_RANK() OVER(PARTITION BY m.Model ORDER BY o.Id) AS [Rank]
				FROM Orders AS o
					JOIN Vehicles AS v 
	  			ON v.Id = o.VehicleId
					JOIN Models AS m 
	  			ON m.Id = v.ModelId) AS AllModelsOrdered
	  GROUP BY [Manufacturer], [VehicleModel], [Consumption]
	  ORDER BY MAX([Rank]) DESC) AS Top7Ordered
WHERE AverageConsumption BETWEEN 5 AND 15
ORDER BY Manufacturer, AverageConsumption