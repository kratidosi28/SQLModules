
--Step 1 - Switch to the AdventureWorks database
USE AdventureWorks
GO

-- Step 2 - Create Table product_audits
CREATE TABLE production.product_audits(
    product_id INT NOT NULL,
    product_name VARCHAR(255) NOT NULL,
    brand_id INT NOT NULL,
    category_id INT NOT NULL,
    model_year SMALLINT NOT NULL,
	ModifyingUser nvarchar(100) NOT NULL,
    Original_list_price DEC(10,2) NOT NULL,
	New_List_Price DEC(10,2) NOT NULL,
   UpdateTime DATETIME NOT NULL,
 );
 
-- Step 3 - Create Trigger
CREATE TRIGGER Production.TR_ProductListPrice_Update
ON Production.Product
AFTER UPDATE
AS BEGIN
	SET NOCOUNT ON;
	INSERT Production.ProductAudit(product_id,product_name, brand_id ,category_id, model_year,ModifyingUser, Original_list_price,New_List_Price, UpdateTime)
	SELECT Inserted.product_id,Inserted.product_name,Inserted.brand_id,Inserted.category_id,Inserted.model_year,ORIGINAL_LOGIN(),deleted.ListPrice, inserted.ListPrice,SYSDATETIME()
	FROM deleted
	INNER JOIN inserted
	ON deleted.product_id  = inserted.product_id 
	WHERE deleted.ListPrice > 1000 OR inserted.ListPrice > 1000;
END;
GO