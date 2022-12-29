USE LibraryDb;

/*
WITH TempCTE (id, title, author_last, price)
	AS
	(
		SELECT b.id, b.title, a.name_last, b.price
			FROM book AS b
			INNER JOIN author AS a 
				ON b.author_id = a.id
	)

SELECT * FROM TempCTE


SELECT b.title, a.name_first, a.name_last, 
		b.year_publ, b.price, l.title AS [lang]
	INTO TempTable
	FROM book AS b
	INNER JOIN author AS a ON b.author_id = a.id
	INNER JOIN langs AS l ON b.lang_id = l.id


DROP TABLE TempTable

*/