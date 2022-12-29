USE MyTemp
/*
CREATE TABLE XmlTable
(
	id INT IDENTITY(1, 1) NOT NULL,
	nameColumn VARCHAR(50) NOT NULL,
	xmlData XML NULL
	CONSTRAINT PK_XmlTable PRIMARY KEY (id)
)


INSERT INTO XmlTable
	(nameColumn, xmlData)
	VALUES('Second', '<Users>
					<User>
					<Name>Jim</Name>
					<Age>33</Age>
					<Address>
						<City>Kazan</City>
						<Street>Lenina</Street>
					</Address>
				   </User>
				   <User>
					<Name>Sam</Name>
					<Age>28</Age>
					<Address>
						<City>Orel</City>
						<Street>Mira</Street>
					</Address>
				   </User>
				   </Users>')

GO


SELECT * FROM XmlTable


SELECT xmlData.query('Users/User/Address/City') AS [Address]
	FROM XmlTable

SELECT xmlData.value('Users[1]/User[2]/Address[1]/City[1]', 'VARCHAR(100)') AS [City]
	FROM XmlTable

SELECT * 
	FROM XmlTable
	WHERE xmlData.exist('/Users[1]/User/Phone') = 1



UPDATE XmlTable SET xmlData.modify('delete /Users/User/Phone')
GO
SELECT * FROM XmlTable

UPDATE XmlTable SET xmlData.modify('insert <Phone>+7 (999) 123-45-67</Phone> as last into (/Users/User)[1]')
GO
SELECT * FROM XmlTable



UPDATE XmlTable 
	SET xmlData.modify('replace value of(/Users/User[1]/Name[1]/text())[1] with "Leo"')

GO
SELECT * FROM XmlTable



DECLARE @xmlVar XML = '<Users>
						<User id="1" name="Bob"></User>
						<User id="2" name="Jim"></User>
						</Users>';

SELECT temp.col.value('@id', 'INT') AS id,
	   temp.col.value('@name', 'VARCHAR(50)') AS name
	   FROM @xmlVar.nodes('/Users/User') temp(col)

GO

*/

USE LibraryDb

SELECT b.title, a.name_first, a.name_last, b.year_publ, b.price, l.title 
	FROM book AS b
	INNER JOIN author AS a ON b.author_id = a.id
	INNER JOIN langs AS l ON b.lang_id = l.id

DECLARE @XmlDocument XML;
DECLARE @XmlHandler INT;

SET @XmlDocument = 
				(SELECT b.title, a.name_first, a.name_last, 
						b.year_publ, b.price, l.title AS [lang]
					FROM book AS b
					INNER JOIN author AS a ON b.author_id = a.id
					INNER JOIN langs AS l ON b.lang_id = l.id
					FOR XML PATH('Book'), ELEMENTS, ROOT ('Books'));

EXEC sp_xml_preparedocument @XmlHandler OUTPUT, @XmlDocument

SELECT *
	FROM OPENXML(@XmlHandler, '/Books/Book', 2)
	WITH(
			title NVARCHAR(50),
			name_first NVARCHAR(50),
			name_last NVARCHAR(50),
			year_publ DATE,
			price MONEY,
			lang NVARCHAR(50)
		);

EXEC sp_xml_removedocument @XmlHandler

