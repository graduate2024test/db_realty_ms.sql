SELECT * FROM Advertising
GO


DECLARE @n INT = 1
DECLARE @var FLOAT = 0.001

WHILE (@n<90001)
BEGIN
	UPDATE Advertising SET AreaM2 = AreaM2 + (@var * @n)  WHERE AdvertisingID = @n; 
	SET @n = @n+1 
END
GO


DECLARE @n INT = 1
DECLARE @var FLOAT = 0.1

WHILE (@n<90001)
BEGIN
	UPDATE Advertising SET AreaM2 = AreaM2 + (@var * @n)  WHERE AdvertisingID = @n; 
	SET @n = @n+1 
END
GO


SELECT AreaM2
FROM Advertising
GROUP BY AreaM2
HAVING Count(AreaM2)>1
GO