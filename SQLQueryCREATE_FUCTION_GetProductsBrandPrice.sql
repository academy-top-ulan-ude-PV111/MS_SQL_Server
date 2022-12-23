CREATE FUNCTION GetProductsBrandPrice
(
	@BrandId INT,
	@PriceMin MONEY
)
RETURNS @ResultTable 
	TABLE
	(
		ProductTitle NVARCHAR(50),
		BrandTitle NVARCHAR(50),
		Price MONEY
	)
AS
BEGIN
	IF(@PriceMin < 0)
		SET @PriceMin = 0;
	IF(@PriceMin > 100000)
		SET @PriceMin = 100000;

	INSERT INTO @ResultTable
		SELECT p.title,
			   b.title,
			   p.price
			FROM Products AS p
			INNER JOIN Brands AS b
				ON p.brand_id = b.id
			WHERE p.brand_id = @BrandId 
				  AND p.price !< @PriceMin
	RETURN
END

GO