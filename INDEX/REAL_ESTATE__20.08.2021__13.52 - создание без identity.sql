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