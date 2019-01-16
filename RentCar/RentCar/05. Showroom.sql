--Select all Manufacturers with their Models ordered by Manufacturer name (ascending) then by Model Id (descending). 

SELECT [Manufacturer], [Model] 
FROM Models
ORDER BY [Manufacturer] ASC, [Id] DESC