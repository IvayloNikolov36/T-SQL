--Show all available vehicles. (A vehicle is not available if it is reserved for an order and is not turned back yet)

SELECT m.Model, m.Seats, v.Mileage
FROM Vehicles AS v
INNER JOIN Models AS m ON m.Id = v.ModelId
WHERE v.Id NOT IN (
		SELECT VehicleId FROM Orders WHERE ReturnDate IS NULL
) 
ORDER BY v.Mileage, m.Seats DESC, v.ModelId