-- CREATE
ALTER PROCEDURE InsertBrand
(
	@BrandName NVARCHAR(50)
)
AS
BEGIN
	IF(LEN(LTRIM(RTRIM(@BrandName))) > 3)
		INSERT INTO Brands (title) VALUES (LTRIM(RTRIM(@BrandName)));

	SELECT * FROM Brands
END

GO