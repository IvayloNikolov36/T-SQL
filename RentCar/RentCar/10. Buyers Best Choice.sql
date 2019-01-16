--Select all vehicle models and show how many times each of them have been ordered.

SELECT 
m.Manufacturer, m.Model, ISNULL(COUNT(o.VehicleId), 0) AS [TimesOrdered]
FROM Models AS m
JOIN Vehicles AS v ON m.Id = v.ModelId
FULL JOIN Orders AS o ON o.VehicleId = v.Id
GROUP BY m.Manufacturer, m.Model
ORDER BY TimesOrdered DESC, m.Manufacturer DESC, m.Model
