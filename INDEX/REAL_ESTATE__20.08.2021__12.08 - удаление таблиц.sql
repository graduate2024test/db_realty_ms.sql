SELECT * FROM Street
GO


BULK INSERT Street
FROM 'C:\INDEX\Street.csv'
WITH (fieldterminator = ';', rowterminator = '\n')
GO


DELETE Street
GO


DROP TABLE PriceHistory
GO


DROP TABLE Advertising
GO



DROP TABLE Street
GO


DROP TABLE Conditions
GO


DROP TABLE ContractType
GO


DROP TABLE PaymentTerms
GO


DROP TABLE PropertyType
GO


DROP TABLE PropertyTypeName
GO


DROP TABLE RealEstateBroker
GO


DROP TABLE RealEstateAgency
GO