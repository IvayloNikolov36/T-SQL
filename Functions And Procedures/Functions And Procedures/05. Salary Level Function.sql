CREATE FUNCTION ufn_GetSalaryLevel(@salary DECIMAL(18,4))
RETURNS VARCHAR(7)
AS
BEGIN
	DECLARE @result VARCHAR(7);
	IF(@salary < 30000)
	BEGIN
		SET @result = 'Low';
	END
	ELSE IF(@salary BETWEEN 30000 AND 50000)
	BEGIN
		SET @result = 'Average';
	END
	ELSE
	BEGIN
		SET @result = 'High';
	END
	RETURN @result;
END