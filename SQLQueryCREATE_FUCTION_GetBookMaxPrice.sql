CREATE FUNCTION GetBookMaxPrice
()
RETURNS NVARCHAR(50)
AS
BEGIN
	RETURN 
		(SELECT title 
			FROM LibraryDb.dbo.book
			WHERE price = (SELECT MAX(price) 
							FROM LibraryDb.dbo.book))
		
END