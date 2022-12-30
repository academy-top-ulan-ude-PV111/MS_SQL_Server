/*
-- �������� ������ - ��������� ����� ��
BACKUP DATABASE [ShopDb]
	TO DISK = 'D:\RPO\Maxim Efimov\~ULAN-UDE PV111\~DataBases\Shop_30-12.bak'
	WITH NAME = N'���� ������',
	STATS = 5

-- ���������� � ������
USE master
GO
*/
/*
RESTORE HEADERONLY   
FROM DISK = 'D:\RPO\Maxim Efimov\~ULAN-UDE PV111\~DataBases\30-12-22.bak'

-- ������� ��
DROP DATABASE ShopDb
GO

-- �������������� �� �� ��������� �����
RESTORE DATABASE [ShopDb]
	FROM DISK = 'D:\RPO\Maxim Efimov\~ULAN-UDE PV111\~DataBases\Shop_30-12.bak'
	WITH FILE = 1,
	STATS = 10
*/

-- ������������ �� �� �������
/*
USE master
GO

EXEC sp_detach_db @dbname=[ShopDb]
*/

-- ������������� �� � �������

USE master
GO
CREATE DATABASE [ShopDb] ON
	(FILENAME = 'D:\RPO\Maxim Efimov\~ULAN-UDE PV111\~DataBases\ShopDb.mdf'),
	(FILENAME = 'D:\RPO\Maxim Efimov\~ULAN-UDE PV111\~DataBases\ShopDb_log.ldf')
	FOR ATTACH

GO