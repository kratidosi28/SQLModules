--step-1 AddItemToCart

USE InternetSales
GO
CREATE PROCEDURE dbo.AddItemToCart
	@SessionID INT, 
@TimeAdded DATETIME, 
@CustomerKey INT, 
@ProductKey INT, 
@Quantity INT
	WITH NATIVE_COMPILATION, SCHEMABINDING, EXECUTE AS OWNER
AS
BEGIN 
	ATOMIC WITH (TRANSACTION ISOLATION LEVEL = SNAPSHOT, LANGUAGE = 'us_english')  
	INSERT INTO dbo.ShoppingCart 
	(
	SessionID, 
	TimeAdded, 
	CustomerKey, 
	ProductKey, 
	Quantity
	)
	VALUES 
	(
	@SessionID, 
	@TimeAdded, 
	@CustomerKey, 
	@ProductKey, 
	@Quantity
	)
END
GO

--step-2 DeleteItemFromCart

USE InternetSales
GO
CREATE PROCEDURE dbo.DeleteItemFromCart
	@SessionID INT, 
	@ProductKey INT
	WITH NATIVE_COMPILATION, SCHEMABINDING, EXECUTE AS OWNER
AS
BEGIN 
	ATOMIC WITH (TRANSACTION ISOLATION LEVEL = SNAPSHOT, LANGUAGE = 'us_english')  
	DELETE FROM dbo.ShoppingCart   
	WHERE SessionID = @SessionID  
	AND ProductKey = @ProductKey
END
GO

--step-3 EmptyCart
USE InternetSales
GO
CREATE PROCEDURE dbo.EmptyCart
	@SessionID INT
	WITH NATIVE_COMPILATION, SCHEMABINDING, EXECUTE AS OWNER
AS
BEGIN 
	ATOMIC WITH (TRANSACTION ISOLATION LEVEL = SNAPSHOT, LANGUAGE = 'us_english')  
	DELETE FROM dbo.ShoppingCart   WHERE SessionID = @SessionID
END
GO

--Step 4 - Add items to cart
USE InternetSales
GO
DECLARE @now DATETIME = GETDATE();
EXEC dbo.AddItemToCart
 @SessionID = 3,
 @TimeAdded = @now,
 @CustomerKey = 2,
 @ProductKey = 3,
 @Quantity = 1;
EXEC dbo.AddItemToCart
 @SessionID = 3,
 @TimeAdded = @now,
 @CustomerKey = 2,
 @ProductKey = 4,
 @Quantity = 1;
 
--Step 5 - Select items in cart
SELECT * FROM dbo.ShoppingCart;

--Step 6 - Delete item from cart
EXEC dbo.DeleteItemFromCart
 @SessionID = 3,
 @ProductKey = 4;
 
--Step 7 - Select items in cart
SELECT * FROM dbo.ShoppingCart;

--Step 8 - Empty cart
EXEC dbo.EmptyCart
 @SessionID = 3;
 
--Step 9 - Select items in cart
SELECT * FROM dbo.ShoppingCart; 