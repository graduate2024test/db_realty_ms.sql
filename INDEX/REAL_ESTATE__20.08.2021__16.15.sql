SELECT * FROM Street
GO


BULK INSERT Street
FROM 'C:\INDEX\Street.csv'
WITH (fieldterminator = ';', rowterminator = '\n')
GO


SELECT * FROM RealEstateAgency
GO


BULK INSERT RealEstateAgency
FROM 'C:\INDEX\RealEstateAgency.csv'
WITH (fieldterminator = ';', rowterminator = '\n')
GO


SELECT * FROM RealEstateBroker
GO


BULK INSERT RealEstateBroker
FROM 'C:\INDEX\RealEstateBroker.csv'
WITH (fieldterminator = ';', rowterminator = '\n')
GO


SELECT * FROM PropertyTypeName
GO


BULK INSERT PropertyTypeName
FROM 'C:\INDEX\PropertyTypeName.csv'
WITH (fieldterminator = ';', rowterminator = '\n')
GO


SELECT * FROM PropertyType
GO


BULK INSERT PropertyType
FROM 'C:\INDEX\PropertyType.csv'
WITH (fieldterminator = ';', rowterminator = '\n')
GO


SELECT * FROM PaymentTerms
GO


BULK INSERT PaymentTerms
FROM 'C:\INDEX\PaymentTerms.csv'
WITH (fieldterminator = ';', rowterminator = '\n')
GO


SELECT * FROM ContractType
GO


BULK INSERT ContractType
FROM 'C:\INDEX\ContractType.csv'
WITH (fieldterminator = ';', rowterminator = '\n')
GO


SELECT * FROM Conditions
GO


BULK INSERT Conditions
FROM 'C:\INDEX\Conditions.csv'
WITH (fieldterminator = ';', rowterminator = '\n')
GO