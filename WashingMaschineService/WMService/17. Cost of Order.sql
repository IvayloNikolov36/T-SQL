CREATE FUNCTION udf_GetCost(@jobId INT)
RETURNS DECIMAL(6, 2)
AS
BEGIN
	DECLARE @result DECIMAL(6,2) = 
	 (SELECT
		SUM(ISNULL(op.Quantity * p.Price, 0)) AS PriceForJobParts
		FROM Orders AS o 
		JOIN OrderParts AS op ON op.OrderId = o.OrderId
		JOIN Parts AS p ON p.PartId = op.PartId
		JOIN Jobs AS j ON j.JobId = o.JobId
		WHERE j.JobId = @jobId
		GROUP BY j.JobId);
		RETURN @result;
END;

