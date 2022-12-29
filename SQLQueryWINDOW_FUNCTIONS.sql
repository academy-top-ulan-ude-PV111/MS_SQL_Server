-- Агрегатные оконные функции
/*
SELECT DISTINCT Brands.title,
	SUM(price) OVER (PARTITION BY brand_id) AS [Summa],
	COUNT(*) OVER (PARTITION BY brand_id) AS [Count],
	AVG(price) OVER (PARTITION BY brand_id) AS [Avg price],
	MIN(price) OVER (PARTITION BY brand_id) AS [Min price],
	MAX(price) OVER (PARTITION BY brand_id) AS [Max price]
FROM Products, Brands
WHERE Products.brand_id = Brands.id
*/
/*
-- Ранжирующие оконные функции
SELECT *,
	ROW_NUMBER() OVER (ORDER BY id) AS [Row number],
	ROW_NUMBER() OVER (PARTITION BY brand_id ORDER BY id) AS [Row in brand number],
	RANK() OVER (ORDER BY brand_id) AS [Rank in brand number],
	DENSE_RANK() OVER (ORDER BY brand_id) AS [Dense rank in brand number],
	NTILE(2) OVER (PARTITION BY brand_id ORDER BY brand_id) AS [Part at 3]
	FROM Products
*/
/*
-- Функции смещения
SELECT *,
	LEAD(title, 2, 'no title') OVER (ORDER BY brand_id) AS [Lead],
	LAG(title, 1, 'no title') OVER (PARTITION BY brand_id ORDER BY brand_id) AS [Lag],
	FIRST_VALUE(title) OVER (PARTITION BY brand_id
							ORDER BY brand_id
							ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW)
							AS [First value],
	LAST_VALUE(title) OVER (PARTITION BY brand_id
							ORDER BY brand_id
							ROWS BETWEEN CURRENT ROW AND UNBOUNDED FOLLOWING)
							AS [Last value]
	FROM Products
	ORDER BY brand_id, price
*/
-- Аналитические оконные функции
SELECT *,
	CUME_DIST() OVER (PARTITION BY brand_id ORDER BY price) AS [Cume dist],
	PERCENT_RANK() OVER (PARTITION BY brand_id ORDER BY price) AS [Percent rank]
	FROM Products