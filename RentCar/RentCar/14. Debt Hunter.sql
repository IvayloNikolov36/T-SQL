--Select the clients who have placed an order with invalid credit card. Show only the first two clients per town with the biggest Bill. 
--An order is invalid when the card’s validity date is before the collection date.

SELECT
Client, Email, MAX(Bill) AS Bill, Town
FROM (SELECT 
		t.[Name] AS Town,
		c.Email AS Email,
		ISNULL(o.Bill, 0) AS Bill,
		c.Id AS ClientId,
		CONCAT(c.FirstName, ' ', c.LastName) AS Client,
		DENSE_RANK() OVER(PARTITION BY t.[Name] ORDER BY o.Bill DESC) AS [Rank]
		FROM Orders AS o
		JOIN Clients AS c
			ON c.Id = o.ClientId
		JOIN Towns AS t
			ON t.Id = o.TownId
		WHERE c.CardValidity < o.CollectionDate) AS RankedOrders
WHERE [Rank] IN (1, 2) AND BILL > 0
GROUP BY Client, Email, Town, ClientId
ORDER BY Town, Bill, ClientId DESC