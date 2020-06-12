use ORE;

CREATE TABLE TypesAmortizationType (
	value varchar(30) NOT NULL,
CONSTRAINT PK_TypesAmortizationType PRIMARY KEY CLUSTERED (
	value ASC
));

CREATE TABLE TypesBool (
	value varchar(5) NOT NULL,
CONSTRAINT PK_TypesBool PRIMARY KEY CLUSTERED (
	value ASC
));

CREATE TABLE TypesBusinessDayConvention (
	value varchar(20) NOT NULL,
CONSTRAINT PK_TypesBusinessDayConvention PRIMARY KEY CLUSTERED (
	value ASC
));

CREATE TABLE TypesCalendar (
	value varchar(20) NOT NULL,
CONSTRAINT PK_TypesCalendar PRIMARY KEY CLUSTERED (
	value ASC
));

CREATE TABLE TypesCapFloor (
	value varchar(5)  NOT NULL,
CONSTRAINT PK_TypesCapFloor PRIMARY KEY CLUSTERED (
	value ASC
));

CREATE TABLE TypesConfigurationTypes (
	value varchar(30) NOT NULL,
CONSTRAINT PK_TypesConfigurationTypes PRIMARY KEY CLUSTERED (
	value ASC
));
insert into TypesConfigurationTypes values('orestart');
insert into TypesConfigurationTypes values('todaysmarket');
insert into TypesConfigurationTypes values('curveconfig');
insert into TypesConfigurationTypes values('conventions');
insert into TypesConfigurationTypes values('simulation');
insert into TypesConfigurationTypes values('sensitivity');
insert into TypesConfigurationTypes values('pricingengine');
insert into TypesConfigurationTypes values('stresstest');

CREATE TABLE TypesCsaType (
	value varchar(10)  NOT NULL,
CONSTRAINT PK_TypesCsaType PRIMARY KEY CLUSTERED (
	value ASC
));

CREATE TABLE TypesCurrencyCode (
	value varchar(7) NOT NULL,
CONSTRAINT PK_TypesCurrencyCode PRIMARY KEY CLUSTERED (
	value ASC
));

CREATE TABLE TypesCurrencyPair (
	value varchar(7) NOT NULL,
CONSTRAINT PK_TypesCurrencyPair PRIMARY KEY CLUSTERED (
	value ASC
));

CREATE TABLE TypesDateRule (
	value varchar(20) NOT NULL,
CONSTRAINT PK_TypesDateRule PRIMARY KEY CLUSTERED (
	value ASC
));

CREATE TABLE TypesDayCounter (
	value varchar(30) NOT NULL,
CONSTRAINT PK_TypesDayCounter PRIMARY KEY CLUSTERED (
	value ASC
));

CREATE TABLE TypesEquityCurves (
	value varchar(20) NOT NULL,
CONSTRAINT PK_TypesEquityCurves PRIMARY KEY CLUSTERED (
	value ASC
));

CREATE TABLE TypesIndependentAmountType (
	value varchar(10) NOT NULL,
CONSTRAINT PK_TypesIndependentAmountType PRIMARY KEY CLUSTERED (
	value ASC
));

CREATE TABLE TypesIndexName (
	value varchar(30) NOT NULL,
CONSTRAINT PK_TypesIndexName PRIMARY KEY CLUSTERED (
	value ASC
));

CREATE TABLE TypesLegType (
	value varchar(20) NOT NULL,
CONSTRAINT PK_TypesLegType PRIMARY KEY CLUSTERED (
	value ASC
));

CREATE TABLE TypesLongShort (
	value varchar(5) NOT NULL,
CONSTRAINT PK_TypesLongShort PRIMARY KEY CLUSTERED (
	value ASC
));

CREATE TABLE TypesOptionSettlement (
	value varchar(10) NOT NULL,
CONSTRAINT PK_TypesOptionSettlement PRIMARY KEY CLUSTERED (
	value ASC
));

CREATE TABLE TypesOptionStyle (
	value varchar(10) NOT NULL,
CONSTRAINT PK_TypesOptionStyle PRIMARY KEY CLUSTERED (
	value ASC
));

CREATE TABLE TypesOptionType (
	value varchar(10) NOT NULL,
CONSTRAINT PK_TypesOptionType PRIMARY KEY CLUSTERED (
	value ASC
));

CREATE TABLE TypesOreTradeType (
	value varchar(30) NOT NULL,
CONSTRAINT PK_TypesOreTradeType PRIMARY KEY CLUSTERED (
	value ASC
));

CREATE TABLE TypesParties (
	value varchar(30) NOT NULL,
CONSTRAINT PK_TypesParties PRIMARY KEY CLUSTERED (
	value ASC
));

CREATE TABLE TypesSecurityCurves (
	value varchar(20) NOT NULL,
CONSTRAINT PK_TypesSecurityCurves PRIMARY KEY CLUSTERED (
	value ASC
));

CREATE TABLE TypesTradeActionOwner (
	value varchar(20) NOT NULL,
CONSTRAINT PK_TypesTradeActionOwner PRIMARY KEY CLUSTERED (
	value ASC
));

CREATE TABLE TypesTradeActionType (
	value varchar(20) NOT NULL,
CONSTRAINT PK_TypesTradeActionType PRIMARY KEY CLUSTERED (
	value ASC
));
