SELECT C.FirstName, C.Age, C.PhoneNumber FROM Customers AS C
WHERE C.Age >= 21 AND C.FirstName LIKE '%an%' 
OR C.PhoneNumber LIKE '%38' AND C.Id IN (
	SELECT Id FROM Countries
	WHERE [Name] NOT LIKE 'Greece'
)
ORDER BY C.FirstName ASC, C.Age DESC


