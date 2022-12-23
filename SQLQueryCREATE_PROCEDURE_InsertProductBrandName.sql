ALTER PROCEDURE InsertProductBrandName
(
	@BrandNameLike NVARCHAR(50),
	@ProductName NVARCHAR(50),
	@Count INT,
	@Price MONEY = NULL
)
AS
BEGIN
	SET @BrandNameLike = CONCAT('%', @BrandNameLike, '%');
	IF NOT EXISTS(SELECT * FROM Brands WHERE title LIKE @BrandNameLike)
		RETURN
	INSERT INTO Products (title, brand_id, count, price)
		VALUES
		(@ProductName,
		(SELECT id FROM Brands WHERE title LIKE @BrandNameLike),
		@Count,
		@Price)


	SELECT * FROM Products
END

GO