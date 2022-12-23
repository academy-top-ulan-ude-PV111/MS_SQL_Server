CREATE FUNCTION GetProductsAtBrand
(
	@BrandId INT
)
RETURNS TABLE
AS
RETURN
	SELECT title AS [Product]
		FROM Products
		WHERE Products.brand_id = @BrandId

GO
