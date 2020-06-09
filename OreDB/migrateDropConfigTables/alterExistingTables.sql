use ORE;

-- replacement for CurveConfig Tables being referenced in Prtfolio Tables
CREATE TABLE TypesDefaultCurves (
	value varchar(20) NOT NULL,
CONSTRAINT PK_TypesDefaultCurves PRIMARY KEY CLUSTERED (
	value ASC
));

insert into TypesDefaultCurves select CurveId from CurveConfigurationDefaultCurves;

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

-- might not be in the previous table defs..
ALTER TABLE PortfolioCreditDefaultSwapData ADD CONSTRAINT FK_PortfolioCreditDefaultSwapData_CreditCurveId FOREIGN KEY(CreditCurveId)
REFERENCES TypesDefaultCurves (value);

ALTER TABLE PortfolioIndexCreditDefaultSwapData ADD CONSTRAINT FK_PortfolioIndexCreditDefaultSwapData_CreditCurveId FOREIGN KEY(CreditCurveId)
REFERENCES TypesDefaultCurves (value);