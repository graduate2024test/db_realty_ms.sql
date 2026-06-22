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


BULK INSERT Conditions
FROM 'C:\INDEX\Conditions.csv'
WITH (fieldterminator = ';', rowterminator = '\n')
GO


SELECT * FROM Advertising
GO


SELECT * FROM PriceHistory
GO


BULK INSERT Advertising
FROM 'C:\INDEX\Advertising.csv'
WITH (fieldterminator = ';', rowterminator = '\n')
GO


BULK INSERT PriceHistory
FROM 'C:\INDEX\PriceHistory.csv'
WITH (fieldterminator = ';', rowterminator = '\n')
GO