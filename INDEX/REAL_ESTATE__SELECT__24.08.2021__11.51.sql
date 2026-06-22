

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


SELECT 
	AreaM2, RealEstateBroker.RealEstateBrokerInfo,
	Street.StreetName, PropertyType.PropertyTypeInfo
FROM
	Advertising
JOIN
	RealEstateBroker
ON
	(RealEstateBroker.RealEstateBrokerID = Advertising.RealEstateBrokerID)
JOIN
	Street
ON
	(Street.StreetID = Advertising.StreetID)
JOIN
	PropertyType
ON
	(PropertyType.PropertyTypeID = Advertising.PropertyTypeID)
GO