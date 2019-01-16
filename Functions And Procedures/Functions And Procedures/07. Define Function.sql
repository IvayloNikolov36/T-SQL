CREATE FUNCTION ufn_IsWordComprised(@setOfLetters VARCHAR(50), @word VARCHAR(50))
RETURNS BIT
AS
BEGIN
	DECLARE @index INT = 1;
	DECLARE @length INT = LEN(@word);
	DECLARE @letter CHAR;

	WHILE(@index <= @length)
	BEGIN
		SET @letter = SUBSTRING(@word, @index, 1);
		IF(CHARINDEX(@letter, @setOfLetters) > 0)
			SET @index = @index + 1;
		ELSE
			RETURN 0;
	END

	RETURN 1;
END

