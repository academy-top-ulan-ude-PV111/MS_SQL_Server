CREATE PROCEDURE MinMaxPriceForBrand
(
	@BrandId INT,
	@PriceMin MONEY OUTPUT,
	@PriceMax MONEY OUTPUT
)
AS
BEGIN
	SELECT 
		@PriceMin = MIN(price),
		@PriceMax = MAX(price)
		FROM Products
		WHERE brand_id = @BrandId
END

GO