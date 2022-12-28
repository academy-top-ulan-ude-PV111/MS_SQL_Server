DECLARE @productId INT,
		@productTitle NVARCHAR(50),
		@price MONEY

DECLARE MyCursor CURSOR 
	FOR
		SELECT p.id, p.title, p.price
			FROM MyProducts AS p
			WHERE p.category_id = 1

OPEN MyCursor

FETCH NEXT FROM MyCursor
	INTO @productId, @productTitle, @price

WHILE @@FETCH_STATUS = 0
BEGIN
	IF @price <= 50000
		UPDATE MyProducts SET price = price * 1.05
		WHERE id = @productId;

	FETCH NEXT FROM MyCursor
	INTO @productId, @productTitle, @price
END

CLOSE MyCursor

DEALLOCATE MyCursor