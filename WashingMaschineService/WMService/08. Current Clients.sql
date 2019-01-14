SELECT CONCAT(cl.FirstName, ' ', cl.LastName) AS Client,
DATEDIFF(DAY, j.IssueDate, '2017-04-24') AS [Days Going],
j.[Status]
FROM Clients AS cl
JOIN Jobs AS j ON j.ClientId = cl.ClientId
WHERE j.[Status] != 'Finished'
ORDER BY [Days Going] DESC, cl.ClientId
