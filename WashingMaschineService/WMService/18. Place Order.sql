CREATE PROC usp_PlaceOrder(@jobId INT, @partSerialNum VARCHAR(50), @quantity INT) AS
BEGIN

	IF @quantity <= 0
	BEGIN;
		THROW 50012, 'Part quantity must be more than zero!', 1;
	END;

	IF NOT EXISTS (SELECT JobId FROM Jobs WHERE JobId = @jobId) -- (SELECT JobId FROM Jobs WHERE JobId = @jobId) IS NULL
	BEGIN;
		THROW 50013, 'Job not found!', 1;
	END;

	DECLARE @jobStatus VARCHAR(15) = (SELECT Status From Jobs WHERE JobId = @jobId);	
	IF @jobStatus LIKE 'Finished'
	BEGIN; 
		THROW 50011, 'This job is not active!', 1;
	END;

	IF NOT EXISTS (SELECT PartId FROM Parts WHERE SerialNumber = @partSerialNum)
	BEGIN;
		THROW 50014, 'Part not found!', 1;
	END;

	-- Create Order if not exists
	IF NOT EXISTS (SELECT JobId FROM Orders WHERE JobId = @jobId AND IssueDate IS NULL)
    BEGIN
		INSERT INTO Orders(JobId, IssueDate, Delivered) VALUES
		(@jobId, NULL, 0);
    END;

	-- Add part to order if not exists
    DECLARE @orderId INT = (SELECT TOP 1 OrderId FROM Orders WHERE JobId = @jobId AND IssueDate IS NULL);
    DECLARE @partId INT = (SELECT PartId  FROM Parts WHERE SerialNumber = @partSerialNum);

    IF NOT EXISTS (SELECT PartId FROM OrderParts WHERE PartId = @partId AND OrderId = @orderId)
    BEGIN
		INSERT INTO OrderParts(OrderId, PartId, Quantity) VALUES
        (@orderId, @partId, @quantity);
    END;	    
    ELSE -- Part exists in the order - Add quantity
	BEGIN
		UPDATE OrderParts SET Quantity += @quantity
        WHERE PartId = @partId AND OrderId = @orderId;
    END;
END
