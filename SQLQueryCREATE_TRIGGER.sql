CREATE TRIGGER TRG_ExampTable ON MyProducts
	AFTER INSERT, UPDATE, DELETE
AS
BEGIN
	DECLARE @sqlCommand NVARCHAR(100);

	/*
		определяем команду
	*/
	IF EXISTS (SELECT * FROM inserted) 
			AND NOT EXISTS (SELECT * FROM deleted)
		SET @sqlCommand = 'INSERT';
	IF EXISTS (SELECT * FROM inserted) 
			AND EXISTS (SELECT * FROM deleted)
		SET @sqlCommand = 'UPDATE';
	IF NOT EXISTS (SELECT * FROM inserted) 
			AND EXISTS (SELECT * FROM deleted)
		SET @sqlCommand = 'DELETE';
	
	-- обработка команд
	IF @sqlCommand = 'INSERT' OR @sqlCommand = 'UPDATE'
	BEGIN
		INSERT INTO ExampTable
			(dateChange, nameUser, sqlCommand,
			productIdOld, productIdNew,
			categoryIdOld, categoryIdNew,
			productTitleOld, productTitleNew,
			priceOld, priceNew)
		SELECT GETDATE(), SUSER_NAME(), @sqlCommand,
			  d.id, i.id, 
			  d.category_id, i.category_id,
			  d.title, i.title,
			  d.price, i.price
			  FROM inserted AS i
			  LEFT JOIN deleted AS d
				ON i.id = d.id
	END

	IF @sqlCommand = 'DELETE'
	BEGIN
		INSERT INTO ExampTable
			(dateChange, nameUser, sqlCommand,
			productIdOld, productIdNew,
			categoryIdOld, categoryIdNew,
			productTitleOld, productTitleNew,
			priceOld, priceNew)
		SELECT GETDATE(), SUSER_NAME(), @sqlCommand,
			  d.id, NULL, 
			  d.category_id, NULL,
			  d.title, NULL,
			  d.price, NULL
			  FROM deleted AS d
			  
	END
END