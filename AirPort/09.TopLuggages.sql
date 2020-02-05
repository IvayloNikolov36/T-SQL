SELECT lt.[Type], Count(l.PassengerId) AS [MostUsedLuggage]
FROM LuggageTypes AS lt
JOIN Luggages AS l ON lt.Id = l.LuggageTypeId
GROUP BY lt.Id, lt.[Type]
ORDER BY [MostUsedluggage] DESC, lt.[Type] ASC