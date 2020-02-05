SELECT FirstName, [Address], Phone
FROM Students
WHERE Phone LIKE '42%'
AND MiddleName IS NOT NULL
ORDER BY FirstName ASC