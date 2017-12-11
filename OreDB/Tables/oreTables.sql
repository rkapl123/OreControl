use ORE

CREATE TABLE OreParametersConfigs (
	id varchar(10) COLLATE Latin1_General_CS_AS NOT NULL,
	Description varchar(120) COLLATE Latin1_General_CS_AS NOT NULL,
CONSTRAINT PK_OreParametersConfigs PRIMARY KEY CLUSTERED (
	id ASC
))

CREATE TABLE OreParametersSetup (
	OreConfigId varchar(10) COLLATE Latin1_General_CS_AS NOT NULL,
	name varchar(20) COLLATE Latin1_General_CS_AS NOT NULL,
	Parameter varchar(70) COLLATE Latin1_General_CS_AS NOT NULL
CONSTRAINT PK_OreParametersSetup PRIMARY KEY CLUSTERED (
	OreConfigId ASC,
	name ASC
))
ALTER TABLE OreParametersSetup WITH CHECK ADD CONSTRAINT FK_OreParametersSetup_OreConfigId FOREIGN KEY(OreConfigId)
REFERENCES OreParametersConfigs (id)

CREATE TABLE OreParametersMarkets (
	OreConfigId varchar(10) COLLATE Latin1_General_CS_AS NOT NULL,
	name varchar(20) COLLATE Latin1_General_CS_AS NOT NULL,
	Parameter varchar(20) COLLATE Latin1_General_CS_AS NOT NULL
CONSTRAINT PK_OreParametersMarkets PRIMARY KEY CLUSTERED (
	OreConfigId ASC,
	name ASC
))
ALTER TABLE OreParametersMarkets WITH CHECK ADD CONSTRAINT FK_OreParametersMarkets_OreConfigId FOREIGN KEY(OreConfigId)
REFERENCES OreParametersConfigs (id)

CREATE TABLE OreParametersAnalytics (
	OreConfigId varchar(10) COLLATE Latin1_General_CS_AS NOT NULL,
	type varchar(15) COLLATE Latin1_General_CS_AS NOT NULL,
	name varchar(40) COLLATE Latin1_General_CS_AS NOT NULL,
	Parameter varchar(70)
CONSTRAINT PK_OreParametersAnalytics PRIMARY KEY CLUSTERED (
	OreConfigId ASC,
	type ASC,
	name ASC
))
ALTER TABLE OreParametersAnalytics WITH CHECK ADD CONSTRAINT FK_OreParametersAnalytics_OreConfigId FOREIGN KEY(OreConfigId)
REFERENCES OreParametersConfigs (id)