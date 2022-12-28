USE MyTemp

CREATE TABLE ExampTable
(
	id INT IDENTITY(1, 1) NOT NULL,
	dateChange DATETIME NOT NULL,
	nameUser NVARCHAR(50) NOT NULL,
	sqlCommand NVARCHAR(100) NOT NULL,
	productIdOld INT NULL,
	productIdNew INT NULL,
	categoryIdOld INT NULL,
	categoryIdNew INT NULL,
	productTitleOld INT NULL,
	productTitleNew INT NULL,
	priceOld MONEY NULL,
	priceNew MONEY NULL,
	CONSTRAINT PK_ExampTable PRIMARY KEY (id)
)