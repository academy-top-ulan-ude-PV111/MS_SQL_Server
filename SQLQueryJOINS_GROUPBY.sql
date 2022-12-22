USE ShopDb

SELECT c.name, COUNT(o.id) AS 'count orders'
	FROM Customers as c
	LEFT JOIN Orders AS o
		ON o.customer_id = c.id
	GROUP BY c.id, c.name

SELECT p.title, b.title, SUM(o.count * p.price) AS 'total'
	FROM Products AS p
	INNER JOIN Brands AS b
		ON b.id = p.brand_id
	LEFT JOIN Orders AS o
		ON o.product_id = p.id
	GROUP BY p.id, p.title, b.title