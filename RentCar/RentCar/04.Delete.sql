--Delete all orders which don’t have a Return Date.

DELETE FROM Orders
WHERE ReturnDate IS NULL