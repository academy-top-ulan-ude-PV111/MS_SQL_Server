-- создание login - им€ входа
CREATE LOGIN [TestLogin]
	WITH PASSWORD = 'asd123dsa',
	DEFAULT_DATABASE = [MyTemp]

GO

-- назначаем роль сервера
EXEC sp_addsrvrolemember @loginame = 'TestLogin', @rolename = 'public'

GO

-- создаем пользовател€ Ѕƒ с соответсвующим логином
CREATE USER [TestUser] FOR LOGIN [TestLogin]

GO

-- назначение права доступа
EXEC sp_addrolemember 'db_owner', 'TestUser'

GO
