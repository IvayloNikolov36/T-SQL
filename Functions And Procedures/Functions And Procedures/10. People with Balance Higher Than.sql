CREATE PROC usp_GetHoldersWithBalanceHigherThan @amount DECIMAL(18, 2)
AS
BEGIN
	SELECT ah.[FirstName], ah.[LastName], SUM(a.Balance) AS [TotalBalance]
	FROM AccountHolders AS ah
	JOIN Accounts AS a ON a.AccountHolderId = ah.Id
	GROUP BY ah.[FirstName], ah.[LastName]
	HAVING SUM(a.Balance) > @amount
END

EXEC dbo.usp_GetHoldersWithBalanceHigherThan 999550.50

