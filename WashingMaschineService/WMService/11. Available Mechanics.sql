SELECT
CONCAT(m.FirstName, ' ', m.LastName) AS Available
FROM Mechanics AS m
WHERE m.MechanicId NOT IN (
	SELECT DISTINCT MechanicId FROM Jobs AS j
	WHERE j.[Status] <> 'Finished' AND MechanicId IS NOT NULL
)
ORDER BY m.MechanicId
