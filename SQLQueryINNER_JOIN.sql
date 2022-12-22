USE ShopDb

SELECT o.date, p.title, b.title, c.name, o.count, o.price,
		o.count * o.price AS total
	FROM Orders AS o,
		Products AS p,
		Brands AS b,
		Customers AS c
	WHERE o.product_id = p.id 
		AND o.customer_id = c.id
		AND p.brand_id = b.id

SELECT o.date, p.title, b.title, c.name, o.count, o.price,
		o.count * o.price AS total
	FROM Orders AS o
	INNER JOIN Products AS p
		ON o.product_id = p.id
	INNER JOIN Customers AS c
		ON o.customer_id = c.id
	INNER JOIN Brands AS b
		ON p.brand_id = b.id
	ORDER BY b.title
