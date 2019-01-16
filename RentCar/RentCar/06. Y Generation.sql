--Find all clients who are born between 1977 and 1994. Order the clients by First Name 
--and then by Last Name in ascending order, and finally by Id (ascending).

SELECT FirstName, LastName 
FROM Clients
WHERE YEAR(BirthDate) BETWEEN 1977 AND 1994
ORDER BY FirstName, LastName, Id