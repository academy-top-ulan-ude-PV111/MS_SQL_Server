SELECT LEN('Hello world')
SELECT LTRIM('        Hello world')
SELECT RTRIM('Hello world        ')
SELECT CHARINDEX('lo', 'Hello world, hello poeple')
SELECT PATINDEX('%l_o%', 'Hello world, hello poeple')
SELECT LEFT('Hello world', 5)
SELECT RIGHT('Hello world', 5)
SELECT SUBSTRING('Hello world', 4, 6)
SELECT REPLACE('Hello world', 'world', 'people')
SELECT REVERSE('Hello world')
SELECT CONCAT('Hello', ' ', 'world')
SELECT LOWER('Hello World')
SELECT UPPER('Hello World')
SELECT SPACE(10)

USE ShopDb

SELECT o.date, 
		CONCAT(p.title, ' - ', UPPER(b.title)) AS product, 
		c.name, o.count,
		o.count * p.price AS total
	FROM Orders AS o
	INNER JOIN Products AS p
		ON o.product_id = p.id
	INNER JOIN Customers AS c
		ON o.customer_id = c.id
	INNER JOIN Brands AS b
		ON p.brand_id = b.id
	ORDER BY b.title