CREATE OR ALTER TRIGGER tr_DeleteProducts ON Products INSTEAD OF DELETE AS
BEGIN
	DECLARE @productId INT = (SELECT Id FROM deleted);

	DELETE FROM ProductsIngredients 
	WHERE ProductId = @productId;

	DELETE FROM FeedBacks 
	WHERE ProductId = @productId;

	DELETE FROM PRoducts 
	WHERE Id = @productId;
END
