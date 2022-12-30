/*
-- создание бэкапа - резервной копии бд
BACKUP DATABASE [ShopDb]
	TO DISK = 'D:\RPO\Maxim Efimov\~ULAN-UDE PV111\~DataBases\Shop_30-12.bak'
	WITH NAME = N'База данных',
	STATS = 5

-- информация о бэкапе
USE master
GO
*/
/*
RESTORE HEADERONLY   
FROM DISK = 'D:\RPO\Maxim Efimov\~ULAN-UDE PV111\~DataBases\30-12-22.bak'

-- удаляем бд
DROP DATABASE ShopDb
GO

-- восстановление бд из резервной копии
RESTORE DATABASE [ShopDb]
	FROM DISK = 'D:\RPO\Maxim Efimov\~ULAN-UDE PV111\~DataBases\Shop_30-12.bak'
	WITH FILE = 1,
	STATS = 10
*/

-- отсоеденение бд от сервера
/*
USE master
GO

EXEC sp_detach_db @dbname=[ShopDb]
*/

-- подсоединение бд к серверу

USE master
GO
CREATE DATABASE [ShopDb] ON
	(FILENAME = 'D:\RPO\Maxim Efimov\~ULAN-UDE PV111\~DataBases\ShopDb.mdf'),
	(FILENAME = 'D:\RPO\Maxim Efimov\~ULAN-UDE PV111\~DataBases\ShopDb_log.ldf')
	FOR ATTACH

GO