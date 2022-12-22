USE ShopDb

/*
SELECT p.title, p.count,
	CASE
		WHEN p.count < 30 THEN '������ ����'
		WHEN p.count BETWEEN 30 AND 50 THEN '������ �������'
		WHEN p.count BETWEEN 51 AND 70 THEN '������ �������'
		WHEN p.count BETWEEN 71 AND 100 THEN '������ �����'
		ELSE '������ ����� �����'
	END AS 'Count Description',
	IIF(p.price IS NULL, '���� ������������', IIF(p.price < 50000, '����� ��������', '����� �������'))
	ISNULL(STR(p.price), '���� ������������') AS 'Price',
	IIF(p.price < 50000, '����� ��������', ISNULL(STR(p.price), '���� ������������')) AS 'Price Description'
	FROM Products AS p

GO

*/

SELECT * FROM Customers

SELECT 
	c.name,
	COALESCE(c.phone, c.email, '�������� ���')
	FROM Customers AS c
	

