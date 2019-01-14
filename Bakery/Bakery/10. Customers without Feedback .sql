SELECT CONCAT(c.FirstName, ' ', c.LastName) AS CustomerName, c.PhoneNumber, c.Gender
FROM Customers AS c
WHERE Id NOT IN (SELECT CustomerId FROM Feedbacks)
ORDER BY c.Id


SELECT CONCAT(C.FirstName,' ', C.LastName) AS [CustomerName],
C.PhoneNumber, C.Gender
FROM Customers AS C
LEFT OUTER JOIN Feedbacks AS F ON F.CustomerId = C.Id
WHERE F.CustomerId IS NULL
ORDER BY C.Id ASC

