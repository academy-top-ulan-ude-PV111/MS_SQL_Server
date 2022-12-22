USE ShopDb

SELECT *
	FROM Customers AS c
	LEFT JOIN Orders AS o
		ON c.id = o.customer_id

SELECT *
	FROM Orders AS o
	RIGHT JOIN Products AS p
		ON o.product_id = p.id
	

SELECT *
	FROM Customers AS c
	FULL JOIN Orders AS o
		ON c.id = o.customer_id
	FULL JOIN Products AS p
		ON o.product_id = p.id
