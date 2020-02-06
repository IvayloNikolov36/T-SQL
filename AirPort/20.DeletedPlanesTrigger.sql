CREATE OR ALTER TRIGGER tr_DeletePlanesInsertInfo ON Planes AFTER DELETE
AS
BEGIN
	INSERT INTO DeletedPlanes(Id, [Name], Seats, [Range])
		SELECT d.Id, d.[Name], d.Seats, d.[Range]
		FROM deleted AS d 
END



