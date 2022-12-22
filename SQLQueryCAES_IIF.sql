USE ShopDb

/*
SELECT p.title, p.count,
	CASE
		WHEN p.count < 30 THEN 'Товара мало'
		WHEN p.count BETWEEN 30 AND 50 THEN 'Товара немного'
		WHEN p.count BETWEEN 51 AND 70 THEN 'Товара хватает'
		WHEN p.count BETWEEN 71 AND 100 THEN 'Товара много'
		ELSE 'Товара очень много'
	END AS 'Count Description',
	IIF(p.price IS NULL, 'Цена неопределена', IIF(p.price < 50000, 'Товар доступен', 'Товар дорогой'))
	ISNULL(STR(p.price), 'Цена неопределена') AS 'Price',
	IIF(p.price < 50000, 'Товар доступен', ISNULL(STR(p.price), 'Цена неопределена')) AS 'Price Description'
	FROM Products AS p

GO

*/

SELECT * FROM Customers

SELECT 
	c.name,
	COALESCE(c.phone, c.email, 'контакта нет')
	FROM Customers AS c
	

