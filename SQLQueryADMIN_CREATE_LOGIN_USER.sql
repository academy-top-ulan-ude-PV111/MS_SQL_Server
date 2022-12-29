CREATE LOGIN [TestLogin] 
	WITH PASSWORD = 'asd123dsa',
	DEFAULT_DATABASE [MyTemp]

GO

EXEC sp_addsrvrolemember @loginame = 'TestLogin', @rolename = 'public'

GO

CREATE USER [TestUser] FOR LOGIN [TestLogin]

GO

EXEC sp_addrolemember 'db_owner', 'TestUser'

GO
