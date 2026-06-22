/*
SELECT * FROM Street
GO

SELECT * FROM RealEstateAgency
GO

SELECT * FROM RealEstateBroker
GO

SELECT * FROM PropertyTypeName
GO

SELECT * FROM PropertyType
GO

SELECT * FROM PaymentTerms
GO

SELECT * FROM ContractType
GO

SELECT * FROM Conditions
GO
*/
---------------------------


SELECT * FROM Advertising
GO


SELECT * FROM PriceHistory
GO


BULK INSERT Advertising
FROM 'C:\INDEX\Advertising3.csv'
WITH (fieldterminator = ';', rowterminator = '\n')
GO


BULK INSERT PriceHistory
FROM 'C:\INDEX\PriceHistory3.csv'
WITH (fieldterminator = ';', rowterminator = '\n')
GO