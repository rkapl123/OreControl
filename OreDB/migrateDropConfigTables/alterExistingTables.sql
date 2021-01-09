use ORE;

-- replacement for CurveConfig Tables being referenced in Portfolio Tables

CREATE TABLE TypesEquityCurves (
	value varchar(20) NOT NULL,
CONSTRAINT PK_TypesEquityCurves PRIMARY KEY CLUSTERED (
	value ASC
));
insert into TypesEquityCurves select CurveId from CurveConfigurationEquityCurves;

CREATE TABLE TypesSecurityCurves (
	value varchar(20) NOT NULL,
CONSTRAINT PK_TypesSecurityCurves PRIMARY KEY CLUSTERED (
	value ASC
));
insert into TypesSecurityCurves select CurveId from CurveConfigurationSecurities;

-- replace CurveConfig Tables in Portfolio Tables
ALTER TABLE PortfolioEquityOptionData DROP CONSTRAINT FK_PortfolioEquityOptionData_Name;

ALTER TABLE PortfolioEquityOptionData ADD CONSTRAINT FK_PortfolioEquityOptionData_Name FOREIGN KEY(Name)
REFERENCES TypesEquityCurves (value);

ALTER TABLE PortfolioEquityForwardData DROP CONSTRAINT FK_PortfolioEquityForwardData_Name;

ALTER TABLE PortfolioEquityForwardData ADD CONSTRAINT FK_PortfolioEquityForwardData_Name FOREIGN KEY(Name)
REFERENCES TypesEquityCurves (value);

ALTER TABLE PortfolioBondData DROP CONSTRAINT FK_PortfolioBondData_SecurityId;

ALTER TABLE PortfolioBondData ADD CONSTRAINT FK_PortfolioBondData_SecurityId FOREIGN KEY(SecurityId)
REFERENCES TypesSecurityCurves (value);

-- is not in the table defs..
ALTER TABLE PortfolioCreditDefaultSwapData ALTER COLUMN CreditCurveId varchar(30);
ALTER TABLE PortfolioCreditDefaultSwapData ADD CONSTRAINT FK_PortfolioCreditDefaultSwapData_CreditCurveId FOREIGN KEY(CreditCurveId)
REFERENCES TypesParties (value);

ALTER TABLE PortfolioIndexCreditDefaultSwapData ALTER COLUMN CreditCurveId varchar(30);
ALTER TABLE PortfolioIndexCreditDefaultSwapData ADD CONSTRAINT FK_PortfolioIndexCreditDefaultSwapData_CreditCurveId FOREIGN KEY(CreditCurveId)
REFERENCES TypesParties (value);

-- new configuration table:
CREATE TABLE TypesConfigurationTypes (
	value varchar(20) NOT NULL,
CONSTRAINT PK_TypesConfigurationTypes PRIMARY KEY CLUSTERED (
	value ASC
));

CREATE TABLE OreConfigurations (
	ConfigurationId varchar(30) NOT NULL,
	ConfigurationType varchar(20) NOT NULL,
	ConfigurationData varchar(MAX) NOT NULL
CONSTRAINT PK_OreConfigurations PRIMARY KEY CLUSTERED (
	ConfigurationId ASC
));
ALTER TABLE OreConfigurations ADD CONSTRAINT FK_OreConfigurations_ConfigurationType FOREIGN KEY(ConfigurationType)
REFERENCES TypesConfigurationTypes (value);
ALTER TABLE [dbo].ResultsFlows ADD AccrualStartDate datetime NULL;
ALTER TABLE [dbo].ResultsFlows ADD AccrualEndDate datetime NULL;
ALTER TABLE [dbo].ResultsFlows ADD AccruedAmount [decimal](18, 4) NULL;
ALTER TABLE [dbo].ResultsNPV ADD NotionalCurrency varchar(3) NULL;