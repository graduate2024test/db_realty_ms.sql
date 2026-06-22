
SET STATISTICS IO ON
SET STATISTICS TIME ON

SELECT
	Advertising.AreaM2,
	AVG(PriceHistory.PriceHistoryValue) AS Average_per_M2
FROM
	Advertising
INNER JOIN
	PriceHistory
ON Advertising.AdvertisingID = PriceHistory.AdvertisingID

GROUP BY
	Advertising.AreaM2

ORDER BY
	Advertising.AreaM2
GO
-------------------------------------------------------------------
-------------------------------------------------------------------


SET STATISTICS IO ON
SET STATISTICS TIME ON

SELECT 
	Advertising.AreaM2, Conditions.ConditionsInfo,
	Street.StreetName, PropertyType.PropertyTypeInfo,
	ContractType.ContractTypeName, RealEstateBroker.RealEstateBrokerInfo
	
FROM
	Advertising
JOIN
	Conditions
ON
	(Conditions.ConditionsID = Advertising.ConditionsID)
JOIN
	Street
ON
	(Street.StreetID = Advertising.StreetID)
JOIN
	PropertyType
ON
	(PropertyType.PropertyTypeID = Advertising.PropertyTypeID)
JOIN
	ContractType
ON
	(ContractType.ContractTypeID = Advertising.ContractTypeID)
JOIN
	RealEstateBroker
ON
	(RealEstateBroker.RealEstateBrokerID = Advertising.RealEstateBrokerID)

GO
-------------------------------------------------------------------
-------------------------------------------------------------------

/*
SELECT * INTO Advertising_INDEX_TEST FROM Advertising
GO


SELECT * FROM Advertising_INDEX_TEST
GO
*/
-------------------------------------------------------------------
-------------------------------------------------------------------


SET STATISTICS IO ON
SET STATISTICS TIME ON

SELECT 
	Advertising_INDEX_TEST_CLAST.AreaM2, Conditions.ConditionsInfo,
	Street.StreetName, PropertyType.PropertyTypeInfo,
	ContractType.ContractTypeName, RealEstateBroker.RealEstateBrokerInfo
	
FROM
	Advertising_INDEX_TEST_CLAST
JOIN
	Conditions
ON
	(Conditions.ConditionsID = Advertising_INDEX_TEST_CLAST.ConditionsID)
JOIN
	Street
ON
	(Street.StreetID = Advertising_INDEX_TEST_CLAST.StreetID)
JOIN
	PropertyType
ON
	(PropertyType.PropertyTypeID = Advertising_INDEX_TEST_CLAST.PropertyTypeID)
JOIN
	ContractType
ON
	(ContractType.ContractTypeID = Advertising_INDEX_TEST_CLAST.ContractTypeID)
JOIN
	RealEstateBroker
ON
	(RealEstateBroker.RealEstateBrokerID = Advertising_INDEX_TEST_CLAST.RealEstateBrokerID)

GO
-------------------------------------------------------------------
-------------------------------------------------------------------


SET STATISTICS IO ON
SET STATISTICS TIME ON

SELECT 
	Advertising_INDEX_TEST_NOCLAST.AreaM2, Conditions.ConditionsInfo,
	Street.StreetName, PropertyType.PropertyTypeInfo,
	ContractType.ContractTypeName, RealEstateBroker.RealEstateBrokerInfo
	
FROM
	Advertising_INDEX_TEST_NOCLAST
JOIN
	Conditions
ON
	(Conditions.ConditionsID = Advertising_INDEX_TEST_NOCLAST.ConditionsID)
JOIN
	Street
ON
	(Street.StreetID = Advertising_INDEX_TEST_NOCLAST.StreetID)
JOIN
	PropertyType
ON
	(PropertyType.PropertyTypeID = Advertising_INDEX_TEST_NOCLAST.PropertyTypeID)
JOIN
	ContractType
ON
	(ContractType.ContractTypeID = Advertising_INDEX_TEST_NOCLAST.ContractTypeID)
JOIN
	RealEstateBroker
ON
	(RealEstateBroker.RealEstateBrokerID = Advertising_INDEX_TEST_NOCLAST.RealEstateBrokerID)
WHERE


GO
-------------------------------------------------------------------
-------------------------------------------------------------------


SET STATISTICS IO ON
SET STATISTICS TIME ON

SELECT 
	RealEstateAgency.RealEstateAgencyInfo,
	SUM(Advertising.AreaM2) AS Tradable_Property
FROM
	Advertising
JOIN
	RealEstateBroker
ON
	(RealEstateBroker.RealEstateBrokerID = Advertising.RealEstateBrokerID)
JOIN
	RealEstateAgency
ON
	(RealEstateBroker.RealEstateAgencyID = RealEstateAgency.RealEstateAgencyID)
GROUP BY
	RealEstateAgency.RealEstateAgencyInfo
GO
-------------------------------------------------------------------
-------------------------------------------------------------------


SET STATISTICS IO ON
SET STATISTICS TIME ON

SELECT 
	Advertising.AreaM2,
	AVG(PriceHistory.PriceHistoryValue * RealEstateAgency.RealEstateAgencyCommission)
	AS Average_Comission
FROM
	PriceHistory
JOIN
	Advertising
ON
	(PriceHistory.AdvertisingID = Advertising.AdvertisingID)
JOIN
	RealEstateBroker
ON
	(RealEstateBroker.RealEstateBrokerID = Advertising.RealEstateBrokerID)
JOIN
	RealEstateAgency
ON
	(RealEstateBroker.RealEstateAgencyID = RealEstateAgency.RealEstateAgencyID)
WHERE
	Advertising.AreaM2 BETWEEN 50 AND 150
GROUP BY
	Advertising.AreaM2
ORDER BY
	Advertising.AreaM2 DESC
GO