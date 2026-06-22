CREATE PROCEDURE Count_Ads AS
SELECT COUNT(AdvertisingID) FROM Advertising
GO


EXEC Count_Ads
GO
--------------------------------------------------------------------
--------------------------------------------------------------------


CREATE PROCEDURE Count_Ads_Areas @Count_Areas AS INT
AS
SELECT COUNT(AdvertisingID) FROM Advertising WHERE AreaM2>=@Count_Areas
GO

EXEC Count_Ads_Areas 150
GO
--------------------------------------------------------------------
--------------------------------------------------------------------


SELECT * FROM AGREGATE_ADV_VIEW
GO


CREATE PROCEDURE Count_Areas_Broker @Count_Areas AS INT, @Broker AS
CHAR(10)
AS
SELECT COUNT(AreaM2) FROM AGREGATE_ADV_VIEW WHERE AreaM2>=@Count_Areas
AND RealEstateBrokerInfo LIKE @Broker
GO


EXEC Count_Areas_Broker 150, 'Broker 003'
GO
--------------------------------------------------------------------
--------------------------------------------------------------------


IF OBJECT_ID('Count_Areas_Broker_Itogo', 'P') IS NOT NULL  
    DROP PROCEDURE Count_Areas_Broker_Itogo  
GO 


CREATE PROCEDURE Count_Areas_Broker_Itogo @Count_Areas AS INT, @Broker AS
CHAR(10), @Itogo INT OUTPUT
AS
SELECT @Itogo = COUNT(AreaM2) FROM AGREGATE_ADV_VIEW WHERE AreaM2>=@Count_Areas
AND RealEstateBrokerInfo LIKE @Broker
RETURN
GO


DECLARE		@ItogoAd INT
EXEC Count_Areas_Broker_Itogo 150, 'Broker 003', @Itogo = @ItogoAd OUTPUT
PRINT 'Count_Areas_Broker_Itogo is ' +   
		CONVERT(VARCHAR(10), @ItogoAd) 
GO  
--------------------------------------------------------------------
-------------------------------------------------------------------- 


SELECT * FROM AGREGATE_ADV_VIEW
GO


IF OBJECT_ID('Check_Broker', 'P') IS NOT NULL  
    DROP PROCEDURE Check_Broker  
GO 


CREATE PROCEDURE Check_Broker @param VARCHAR(12)
AS
IF (SELECT RealEstateBrokerInfo FROM AGREGATE_ADV_VIEW
		WHERE StreetName = @param AND AreaM2 BETWEEN 10 AND 90) = 'Broker 001'
	RETURN 1
ELSE
	RETURN 2
GO


DECLARE @YesNo INT
EXEC @YesNo = Check_Broker 'street 00001'
IF @YesNo = 1
	PRINT 'Yes'
ELSE
	PRINT 'No'
GO
--------------------------------------------------------------------
--------------------------------------------------------------------


SELECT * FROM PriceHistory
GO


IF OBJECT_ID('Up_PriceHistoryValue', 'P') IS NOT NULL  
    DROP PROCEDURE Up_PriceHistoryValue  
GO 


CREATE PROCEDURE Up_PriceHistoryValue
AS
WHILE (SELECT SUM(PriceHistoryValue) FROM PriceHistory WHERE PriceHistoryID BETWEEN 1 AND 7) < 1000
BEGIN
	UPDATE PriceHistory SET PriceHistoryValue = PriceHistoryValue * 1.1
	
	IF (SELECT MAX(PriceHistoryValue) FROM PriceHistory) > 200
		BREAK
	ELSE CONTINUE
END
GO


EXEC Up_PriceHistoryValue
GO


SELECT * FROM PriceHistory
GO
--------------------------------------------------------------------
--------------------------------------------------------------------
IF OBJECT_ID ( 'dbo.uspCurrencyCursor', 'P' ) IS NOT NULL
    DROP PROCEDURE dbo.uspCurrencyCursor;
GO
CREATE PROCEDURE dbo.uspCurrencyCursor 
    @CurrencyCursor CURSOR VARYING OUTPUT
AS
    SET NOCOUNT ON;
    SET @CurrencyCursor = CURSOR
    FORWARD_ONLY STATIC FOR
      SELECT CurrencyCode, Name
      FROM Sales.Currency;
    OPEN @CurrencyCursor;
GO


DECLARE @MyCursor CURSOR;
EXEC dbo.uspCurrencyCursor @CurrencyCursor = @MyCursor OUTPUT;
WHILE (@@FETCH_STATUS = 0)
BEGIN;
     FETCH NEXT FROM @MyCursor;
END;
CLOSE @MyCursor;
DEALLOCATE @MyCursor;
GO