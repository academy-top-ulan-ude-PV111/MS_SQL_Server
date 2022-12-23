CREATE FUNCTION GetBrand
(
	@BrandId INT -- brand_id from Products
)
RETURNS NVARCHAR(50)
AS
BEGIN
	DECLARE @BrandTitle NVARCHAR(50);
	SELECT @BrandTitle = title
		FROM Brands
		WHERE id = @BrandId
	RETURN @BrandTitle
END

GO