USE ShopDb

DECLARE @var1 INT = 101
DECLARE @str NVARCHAR(10)

GOTO Lbl

IF @var1 % 2 = 0
	BEGIN
		SELECT '������ �����'
		SET @str = 'even'
	END
ELSE
	BEGIN
		SELECT '�������� �����'
		SET @str = 'odd'
	END

SELECT @str

Lbl:

IF EXISTS (SELECT * FROM Orders)
	SELECT '������ ����'

SET @var1 = 3
SET @str = CASE @var1
				WHEN 1 THEN '����'
				WHEN 2 THEN '���'
				WHEN 3 THEN '���'
				WHEN 4 THEN '������'
				WHEN 5 THEN '����'
				ELSE '������ �����'
			END

SELECT @str


-- � � n �������
DECLARE @power FLOAT = 1
DECLARE @n INT = 5
DECLARE @x FLOAT = 10.8

DECLARE @i INT = 0
WHILE @i < @n
BEGIN
	SET @power = @power * @x
	SET @i = @i + 1
END

PRINT STR(@power)

BEGIN TRY
	SELECT * FROM Orders
END TRY
BEGIN CATCH
	SELECT ERROR_MESSAGE() AS [Message error]
END CATCH

