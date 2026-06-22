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