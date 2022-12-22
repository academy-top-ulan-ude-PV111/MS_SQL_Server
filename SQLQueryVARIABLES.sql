/*

DECLARE @myVar INT
SET @myVar = 100

DECLARE @otherVar INT = 200
SELECT @myVar + @otherVar

DECLARE @str NVARCHAR(50)
SET @str = (SELECT name FROM Customers WHERE id = 2)
SELECT @str AS 'Custoner Name'

DECLARE @myTableVar TABLE
(
	id INT IDENTITY(1, 1) NOT NULL,
	brand_id INT NOT NULL,
	title NVARCHAR(50) NOT NULL
);

INSERT INTO @myTableVar
	SELECT p.brand_id, p.title 
		FROM Products AS p
		WHERE p.count > 50

SELECT t.title AS ProductTitle, b.title AS BrandTitle
	FROM @myTableVar AS t
	JOIN Brands AS b ON t.brand_id = b.id

*/

SELECT @@SERVERNAME AS [Server name],
	   @@VERSION AS [SQL version]
