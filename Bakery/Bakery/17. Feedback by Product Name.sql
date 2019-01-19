CREATE FUNCTION udf_GetRating (@productName VARCHAR(MAX))
RETURNS VARCHAR(9)
AS
BEGIN
	DECLARE @averageRate DECIMAL(4,2) = (SELECT AVG(f.Rate)
										   FROM Feedbacks AS f
							               JOIN Products AS p
							                 ON p.Id = f.ProductId
							              WHERE p.[Name] = @productName);
	DECLARE @result VARCHAR(9) =
		CASE
			WHEN @averageRate IS NULL THEN 'No Rating'
			WHEN @averageRate < 5 THEN 'Bad'
			WHEN @averageRate BETWEEN 5 AND 8 THEN 'Average'
			WHEN @averageRate > 8 THEN 'Good'
		END;
	RETURN @result;
END;

GO

SELECT TOP(5) Id, [Name], dbo.udf_GetRating([Name]) 
         FROM Products
     ORDER BY Id
