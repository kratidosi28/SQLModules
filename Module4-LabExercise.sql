create table DirectMarketing(
DirectMarketingId int,
DirectMarketingInFo varchar(50),
DirectMarketingType varchar(50));


ALTER TABLE DirectMarketing add CompanyName varchar(50);
ALTER TABLE DirectMarketing add ClientId int NOT NULL;


ALTER TABLE DirectMarketing
ADD CONSTRAINT PK_DirectMarketing PRIMARY KEY (DirectMarketingId );

ALTER TABLE DirectMarketing
ADD CONSTRAINT FK_DirectMarketing FOREIGN KEY (ClientId) REFERENCES Clients(ClientId);


ALTER TABLE DirectMarketing
ADD CONSTRAINT df_DirectMarketingType
DEFAULT 'Direct Selling' FOR DirectMarketingType;



