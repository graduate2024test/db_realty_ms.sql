SELECT * FROM Advertising_INDEX_TEST_NOCLAST
GO


DECLARE @n INT = 1
DECLARE @var FLOAT = 0.001

WHILE (@n<90001)
BEGIN
	UPDATE Advertising_INDEX_TEST_NOCLAST SET AreaM2 = AreaM2 + (@var * @n)  WHERE AdvertisingID = @n; 
	SET @n = @n+1 
END
GO


DECLARE @n INT = 1
DECLARE @var FLOAT = 0.1

WHILE (@n<90001)
BEGIN
	UPDATE Advertising_INDEX_TEST_NOCLAST SET AreaM2 = AreaM2 + (@var * @n)  WHERE AdvertisingID = @n; 
	SET @n = @n+1 
END
GO


SELECT AreaM2
FROM Advertising_INDEX_TEST_NOCLAST
GROUP BY AreaM2
HAVING Count(AreaM2)>1
GO


SELECT * INTO Advertising_INDEX_TEST FROM Advertising
GO


SELECT * FROM Advertising_INDEX_TEST
GO


SELECT * INTO Advertising_NO_INDEX_TEST FROM Advertising
GO


SELECT * FROM Advertising_NO_INDEX_TEST
GO


