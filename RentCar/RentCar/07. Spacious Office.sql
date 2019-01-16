--Select all offices which have a parking lot with more than 25 places. Order them by their Town’s name (ascending) 
--and then by Office Id (ascending).

SELECT t.[Name] AS [TownName], o.[Name] AS [OfficeName], o.ParkingPlaces
FROM Offices AS o 
JOIN Towns AS t ON t.Id = o.TownId
WHERE ParkingPlaces > 25
ORDER BY t.[Name], o.Id