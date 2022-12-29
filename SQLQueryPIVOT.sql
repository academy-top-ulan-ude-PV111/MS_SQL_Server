SELECT b.title, SUM(price) AS [Total Sum]
	FROM Products AS p
	INNER JOIN Brands AS b ON p.brand_id = b.id
	GROUP BY b.title

SELECT 'Total SUM' AS [Total Sum],
		[AliExpress],
		[Citylink]
		FROM 
		(
		SELECT p.price, b.title
			FROM Products AS p
			INNER JOIN Brands AS b ON p.brand_id = b.id
		) AS SelectTable
		PIVOT
		(
			SUM(price) FOR title IN ([AliExpress], [Citylink])
		) AS ResultPivotTable
