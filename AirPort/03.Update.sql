UPDATE Tickets
SET Price += 0.13 * Price
WHERE FlightId IN (SELECT Id FROM Flights
				   WHERE Origin LIKE 'Carlsbad' OR Destination LIKE 'Carlsbad')