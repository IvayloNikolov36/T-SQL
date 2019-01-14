SELECT TOP(15) I.[Name], I.[Description], C.[Name] AS [CountryName] FROM Ingredients AS I
INNER JOIN Countries AS C ON I.OriginCountryId = C.Id
WHERE C.Id IN (
	SELECT [Id] FROM Countries 
	WHERE [Name] IN ('Bulgaria', 'Greece'))
ORDER BY I.[Name] ASC, C.[Name] ASC 