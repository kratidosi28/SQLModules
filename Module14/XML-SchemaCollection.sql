USE TutorialDB;
GO

CREATE XML SCHEMA COLLECTION dbo.ProductDetailsSchema
AS 
'<xsd:schema targetNamespace="urn:schemas-microsoft-com:sql:SqlRowSet3" xmlns:schema="urn:schemas-microsoft-com:sql:SqlRowSet3" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:sqltypes="http://schemas.microsoft.com/sqlserver/2004/sqltypes" elementFormDefault="qualified">
  <xsd:import namespace="http://schemas.microsoft.com/sqlserver/2004/sqltypes" schemaLocation="http://schemas.microsoft.com/sqlserver/2004/sqltypes/sqltypes.xsd" />
  <xsd:element name="Production.Product">
    <xsd:complexType>
      <xsd:attribute name="ProductID" type="sqltypes:int" use="required" />
      <xsd:attribute name="Name" use="required">
        <xsd:simpleType sqltypes:sqlTypeAlias="[AdventureWorks2008R2].[dbo].[Name]">
          <xsd:restriction base="sqltypes:nvarchar" sqltypes:localeId="1033" sqltypes:sqlCompareOptions="IgnoreCase IgnoreKanaType IgnoreWidth">
            <xsd:maxLength value="50" />
          </xsd:restriction>
        </xsd:simpleType>
      </xsd:attribute>
      <xsd:attribute name="Color">
        <xsd:simpleType>
          <xsd:restriction base="sqltypes:nvarchar" sqltypes:localeId="1033" sqltypes:sqlCompareOptions="IgnoreCase IgnoreKanaType IgnoreWidth">
            <xsd:maxLength value="15" />
          </xsd:restriction>
        </xsd:simpleType>
      </xsd:attribute>
      <xsd:attribute name="Size">
        <xsd:simpleType>
          <xsd:restriction base="sqltypes:nvarchar" sqltypes:localeId="1033" sqltypes:sqlCompareOptions="IgnoreCase IgnoreKanaType IgnoreWidth">
            <xsd:maxLength value="5" />
          </xsd:restriction>
        </xsd:simpleType>
      </xsd:attribute>
      <xsd:attribute name="ListPrice" type="sqltypes:money" use="required" />
    </xsd:complexType>
  </xsd:element>
</xsd:schema>';
GO

CREATE TABLE dbo.Product
( ProductID int IDENTITY(1,1) PRIMARY KEY,
  ProductDetails xml (CONTENT dbo.ProductDetailsSchema)
);
GO

INSERT INTO dbo.Product 
  (ProductDetails)
  VALUES ('invalid xml');
GO

INSERT INTO dbo.Product
  (ProductDetails)
  VALUES ('<Production.Product xmlns="urn:schemas-microsoft-com:sql:SqlRowSet3" ProductID="1" Name="Shoes" ListPrice="2400" />');
GO

INSERT INTO dbo.Product 
  (ProductDetails)
  VALUES ('
<Production.Product xmlns="urn:schemas-microsoft-com:sql:SqlRowSet3" ProductID="2" Name="shampoo" ListPrice="6000" />
<Production.Product xmlns="urn:schemas-microsoft-com:sql:SqlRowSet3" ProductID="3" Name="soap" ListPrice="7000" />
');
GO

SELECT ProductDetails FROM dbo.Product;