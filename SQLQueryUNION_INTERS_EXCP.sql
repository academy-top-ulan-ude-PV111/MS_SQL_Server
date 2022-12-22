USE ShopDb

SELECT *
	FROM Products AS p
	WHERE p.brand_id IN (1, 2)

UNION 

SELECT *
	FROM Products AS p
	WHERE p.brand_id IN (2, 3)

GO

SELECT *
	FROM Products AS p
	WHERE p.brand_id IN (1, 2)

INTERSECT 

SELECT *
	FROM Products AS p
	WHERE p.brand_id IN (2, 3)

GO

SELECT *
	FROM Products AS p
	WHERE p.brand_id IN (1, 2)

EXCEPT

SELECT *
	FROM Products AS p
	WHERE p.brand_id IN (2, 3)

GO