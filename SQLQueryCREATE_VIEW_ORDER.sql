SELECT o.date AS [Date Order],
		c.name AS [Customer Name],
		p.title AS [Product],
		b.title AS [Product Brand],
		p.price AS [Product Price],
		o.count AS [Count],
		p.price * o.count AS [Total Amount]
		FROM Orders AS o
		INNER JOIN Customers AS c
			ON o.customer_id = c.id
		INNER JOIN Products AS p
			ON o.product_id = p.id
		INNER JOIN Brands AS b
			ON p.brand_id = b.id