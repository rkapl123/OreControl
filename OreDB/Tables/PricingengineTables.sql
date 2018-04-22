use ORE

CREATE TABLE PricingEngineProducts (
	type varchar(128) COLLATE Latin1_General_CS_AS NOT NULL,
	Model varchar(128) COLLATE Latin1_General_CS_AS NOT NULL,
	Engine varchar(128) COLLATE Latin1_General_CS_AS NOT NULL,
	GroupingID varchar(70)
CONSTRAINT PK_PricingEngines PRIMARY KEY CLUSTERED 
(
	type ASC
))

CREATE TABLE PricingEngineModelParameters (
	name varchar(128) COLLATE Latin1_General_CS_AS NOT NULL,
	type varchar(128) COLLATE Latin1_General_CS_AS NOT NULL,
	Parameter varchar(128) COLLATE Latin1_General_CS_AS NOT NULL,
CONSTRAINT PK_PricingEngineModelParameters PRIMARY KEY CLUSTERED 
(
	name ASC, type ASC
))

ALTER TABLE PricingEngineModelParameters WITH CHECK ADD CONSTRAINT FK_PricingEngineModelParameters_type FOREIGN KEY(type)
REFERENCES PricingEngineProducts (type)

CREATE TABLE PricingEngineEngineParameters (
	name varchar(128) COLLATE Latin1_General_CS_AS NOT NULL,
	type varchar(128) COLLATE Latin1_General_CS_AS NOT NULL,
	Parameter varchar(128) COLLATE Latin1_General_CS_AS NOT NULL,
CONSTRAINT PK_PricingEngineEngineParameters PRIMARY KEY CLUSTERED 
(
	name ASC, type ASC
))

ALTER TABLE PricingEngineEngineParameters WITH CHECK ADD CONSTRAINT FK_PricingEngineEngineParameters_type FOREIGN KEY(type)
REFERENCES PricingEngineProducts (type)