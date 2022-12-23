CREATE VIEW ViewProductsBrands
AS
	SELECT p.title AS Product,
		   b.title AS Brand,
		   p.price AS Price
		FROM Products AS p
		INNER JOIN Brands AS b
			ON p.brand_id = b.id
