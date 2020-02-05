CREATE PROC usp_CancelFlights AS
BEGIN

UPDATE Flights
SET ArrivalTime = Null, DepartureTime = NULL
WHERE Id IN (SELECT f.Id 
             FROM Flights AS f 
             WHERE DATEDIFF(SECOND, f.DepartureTime, f.ArrivalTime) > 0)
END