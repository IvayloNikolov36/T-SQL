CREATE TRIGGER tr_OnDeliveryUpdatePartsStockQuantity ON Orders AFTER UPDATE AS
BEGIN
	DECLARE @originDelivered BIT = (SELECT Delivered FROM deleted);
	DECLARE @updatedDelivered BIT = (SELECT Delivered FROM inserted);

	IF (@originDelivered = 0 AND @updatedDelivered = 1)
	BEGIN
		UPDATE p 
			SET StockQty += op.Quantity
		FROM Parts AS p
		JOIN OrderParts AS op ON
			p.PartId = op.PartId
		JOIN Orders AS o ON
			op.OrderId = o.OrderId
		JOIN inserted AS i ON
			o.OrderId = i.OrderId
	END
END
