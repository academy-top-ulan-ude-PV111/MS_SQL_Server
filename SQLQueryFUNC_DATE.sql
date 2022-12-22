SELECT GETDATE() /*datetime*/
SELECT GETUTCDATE()
SELECT SYSDATETIME() /* datetime2 */
SELECT SYSUTCDATETIME()

SELECT DAY(GETDATE())
SELECT MONTH(GETDATE())
SELECT YEAR(GETDATE())
SELECT DATENAME(month, GETDATE())
SELECT DATENAME(month, '2022-11-10')

SELECT DATEPART(month, GETDATE())

SELECT DATEADD(month, -3, GETDATE())

SELECT DATEDIFF(day, '2022-11-10', '2022-01-10')

SELECT TODATETIMEOFFSET (GETDATE(), '-03:00'); 

SELECT DAY(EOMONTH('2024-02-10'))

SELECT DATEFROMPARTS(2022, 06, 21)

SELECT ISDATE('vnvbn')

SELECT *, CONCAT(DATENAME(month, o.date),' - ', YEAR(o.date)) AS 'Date order'
	FROM Orders AS o
