CREATE OR ALTER FUNCTION ufn_CashInUsersGames(@game NVARCHAR(MAX))
RETURNS TABLE
AS	
RETURN  SELECT SUM(Cash) AS SumCash FROM(
			SELECT ug.Cash, ROW_NUMBER() OVER(ORDER BY Cash DESC) AS RowNum 
			FROM UsersGames AS ug
			JOIN Games AS g ON g.Id = ug.GameId
			WHERE g.[Name] = @game) AS CashList
		WHERE RowNum % 2 = 1;


SELECT * FROM dbo.ufn_CashInUsersGames('Lily Stargazer');