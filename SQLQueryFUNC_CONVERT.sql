DECLARE @d INT
DECLARE @m INT
DECLARE @y INT

SET @d = 25
SET @m = 9
SET @y = 2021

SELECT DATEFROMPARTS(@y, @m, @d)

SELECT CAST('12345' AS INT)
SELECT CAST(12345.5653 AS NVARCHAR(50))
SELECT CONVERT(NVARCHAR, CAST('2022-10-15' AS DATETIME2), 104)

SELECT TRY_CONVERT(INT, 'ABC')

SELECT STR(2131)
SELECT CHAR(213)
SELECT ASCII('$')
SELECT NCHAR(2131)
SELECT UNICODE('$')


