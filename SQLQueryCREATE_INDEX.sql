USE ShopDb
/*
CREATE UNIQUE INDEX IX_Products_CountPrice
	ON Products
	(
		count ASC,
		price ASC
	)

CREATE INDEX IX_Orders_Date
	ON Orders
	(
		date DESC
	)
*/

/* реорганизация инцекса */
ALTER INDEX IX_Products_CountPrice 
	ON Products
	REORGANIZE

/* перестроение инцекса */
ALTER INDEX IX_Products_CountPrice 
	ON Products
	REBUILD
