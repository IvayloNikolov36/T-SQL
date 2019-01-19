CREATE OR ALTER PROC usp_SendFeedback @cutomerId INT, @productId INT, @rate DECIMAL(4,2), @description VARCHAR(MAX)
AS
BEGIN
	BEGIN TRANSACTION
		INSERT INTO Feedbacks ([CustomerId], [ProductId], [Rate], [Description]) VALUES
		(@cutomerId, @productId, @rate, @description)
		DECLARE @feedbackCount INT = (SELECT COUNT(*)
										FROM Feedbacks
									   WHERE CustomerId = @cutomerId AND ProductId = @productId);
		IF(@feedbackCount > 3)
		BEGIN
			ROLLBACK
			RAISERROR('You are limited to only 3 feedbacks per product!', 16, 1);
			RETURN
		END
	COMMIT
END;

EXEC dbo.usp_SendFeedback 22, 12, 5.98, 'SOME COMMENT'

SELECT COUNT(*)  
  FROM Feedbacks
 WHERE CustomerId = 22 AND ProductId = 12