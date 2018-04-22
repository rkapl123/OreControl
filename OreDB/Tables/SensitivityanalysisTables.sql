use ORE

CREATE TABLE Sensitivityanalysis (
	Id varchar(40) not null
CONSTRAINT PK_Sensitivityanalysis PRIMARY KEY CLUSTERED 
(
	Id ASC
))

CREATE TABLE SensitivityanalysisDiscountCurve (
	AnalysisId varchar(40) not null,
	ccy varchar(7) not null,
	ShiftType varchar(8),
	ShiftSize decimal(18,5),
	ShiftTenors varchar(100)
CONSTRAINT PK_SensitivityanalysisDiscountCurve PRIMARY KEY CLUSTERED 
(
	AnalysisId ASC,
	ccy ASC
))
ALTER TABLE SensitivityanalysisDiscountCurve WITH CHECK ADD CONSTRAINT FK_SensitivityanalysisDiscountCurve_AnalysisId FOREIGN KEY(AnalysisId)
REFERENCES Sensitivityanalysis (Id)
ALTER TABLE SensitivityanalysisDiscountCurve WITH CHECK ADD CONSTRAINT FK_SensitivityanalysisDiscountCurve_ccy FOREIGN KEY(ccy)
REFERENCES TypesCurrencyCode (value)
ALTER TABLE SensitivityanalysisDiscountCurve WITH CHECK ADD CONSTRAINT FK_SensitivityanalysisDiscountCurve_ShiftType FOREIGN KEY(ShiftType)
REFERENCES TypesShiftType (value)

CREATE TABLE SensitivityanalysisIndexCurve (
	AnalysisId varchar(40) not null,
	IndexName varchar(30) not null,
	ShiftType varchar(8),
	ShiftSize decimal(18,5),
	ShiftTenors varchar(100)
CONSTRAINT PK_SensitivityanalysisIndexCurve PRIMARY KEY CLUSTERED 
(
	AnalysisId ASC,
	IndexName ASC
))
ALTER TABLE SensitivityanalysisIndexCurve WITH CHECK ADD CONSTRAINT FK_SensitivityanalysisIndexCurve_AnalysisId FOREIGN KEY(AnalysisId)
REFERENCES Sensitivityanalysis (Id)
ALTER TABLE SensitivityanalysisIndexCurve WITH CHECK ADD CONSTRAINT FK_SensitivityanalysisIndexCurve_IndexName FOREIGN KEY(IndexName)
REFERENCES TypesIndexName (value)
ALTER TABLE SensitivityanalysisIndexCurve WITH CHECK ADD CONSTRAINT FK_SensitivityanalysisIndexCurve_ShiftType FOREIGN KEY(ShiftType)
REFERENCES TypesShiftType (value)

CREATE TABLE SensitivityanalysisYieldCurve (
	AnalysisId varchar(40) not null,
	Name varchar(20) not null,
	CurveType varchar(20),
	ShiftType varchar(8),
	ShiftSize decimal(18,5),
	ShiftTenors varchar(100)
CONSTRAINT PK_SensitivityanalysisYieldCurve PRIMARY KEY CLUSTERED 
(
	AnalysisId ASC,
	Name ASC
))
ALTER TABLE SensitivityanalysisYieldCurve WITH CHECK ADD CONSTRAINT FK_SensitivityanalysisYieldCurve_AnalysisId FOREIGN KEY(AnalysisId)
REFERENCES Sensitivityanalysis (Id)
--ALTER TABLE SensitivityanalysisYieldCurve WITH CHECK ADD CONSTRAINT FK_SensitivityanalysisYieldCurve_Name FOREIGN KEY(Name)
--REFERENCES CurveConfigurationYieldCurves (CurveId)
ALTER TABLE SensitivityanalysisYieldCurve WITH CHECK ADD CONSTRAINT FK_SensitivityanalysisYieldCurve_ShiftType FOREIGN KEY(ShiftType)
REFERENCES TypesShiftType (value)
ALTER TABLE SensitivityanalysisYieldCurve WITH CHECK ADD CONSTRAINT FK_SensitivityanalysisYieldCurve_CurveType FOREIGN KEY(CurveType)
REFERENCES TypesCurveType (value)

CREATE TABLE SensitivityanalysisFxSpot (
	AnalysisId varchar(40) not null,
	ccypair varchar(7) not null,
	ShiftType varchar(8),
	ShiftSize decimal(18,5)
CONSTRAINT PK_SensitivityanalysisFxSpot PRIMARY KEY CLUSTERED 
(
	AnalysisId ASC,
	ccypair ASC
))
ALTER TABLE SensitivityanalysisFxSpot WITH CHECK ADD CONSTRAINT FK_SensitivityanalysisFxSpot_AnalysisId FOREIGN KEY(AnalysisId)
REFERENCES Sensitivityanalysis (Id)
ALTER TABLE SensitivityanalysisFxSpot WITH CHECK ADD CONSTRAINT FK_SensitivityanalysisFxSpot_ccypair FOREIGN KEY(ccypair)
REFERENCES TypesCurrencyPair (value)
ALTER TABLE SensitivityanalysisFxSpot WITH CHECK ADD CONSTRAINT FK_SensitivityanalysisFxSpot_ShiftType FOREIGN KEY(ShiftType)
REFERENCES TypesShiftType (value)

CREATE TABLE SensitivityanalysisFxVolatility (
	AnalysisId varchar(40) not null,
	ccypair varchar(7) not null,
	ShiftType varchar(8),
	ShiftSize decimal(18,5),
	ShiftExpiries varchar(100),
	ShiftStrikes varchar(200)
CONSTRAINT PK_SensitivityanalysisFxVolatility PRIMARY KEY CLUSTERED 
(
	AnalysisId ASC,
	ccypair ASC
))
ALTER TABLE SensitivityanalysisFxVolatility WITH CHECK ADD CONSTRAINT FK_SensitivityanalysisFxVolatility_AnalysisId FOREIGN KEY(AnalysisId)
REFERENCES Sensitivityanalysis (Id)
ALTER TABLE SensitivityanalysisFxVolatility WITH CHECK ADD CONSTRAINT FK_SensitivityanalysisFxVolatility_ccypair FOREIGN KEY(ccypair)
REFERENCES TypesCurrencyPair (value)
ALTER TABLE SensitivityanalysisFxVolatility WITH CHECK ADD CONSTRAINT FK_SensitivityanalysisFxVolatility_ShiftType FOREIGN KEY(ShiftType)
REFERENCES TypesShiftType (value)

CREATE TABLE SensitivityanalysisSwaptionVolatility (
	AnalysisId varchar(40) not null,
	ccy varchar(7) not null,
	ShiftType varchar(8),
	ShiftSize decimal(18,5),
	ShiftExpiries varchar(100),
	ShiftTerms varchar(100),
	ShiftStrikes varchar(200)
CONSTRAINT PK_SensitivityanalysisSwaptionVolatility PRIMARY KEY CLUSTERED 
(
	AnalysisId ASC,
	ccy ASC
))
ALTER TABLE SensitivityanalysisSwaptionVolatility WITH CHECK ADD CONSTRAINT FK_SensitivityanalysisSwaptionVolatility_AnalysisId FOREIGN KEY(AnalysisId)
REFERENCES Sensitivityanalysis (Id)
ALTER TABLE SensitivityanalysisSwaptionVolatility WITH CHECK ADD CONSTRAINT FK_SensitivityanalysisSwaptionVolatility_ccy FOREIGN KEY(ccy)
REFERENCES TypesCurrencyCode (value)
ALTER TABLE SensitivityanalysisSwaptionVolatility WITH CHECK ADD CONSTRAINT FK_SensitivityanalysisSwaptionVolatility_ShiftType FOREIGN KEY(ShiftType)
REFERENCES TypesShiftType (value)

CREATE TABLE SensitivityanalysisCapFloorVolatility (
	AnalysisId varchar(40) not null,
	ccy varchar(7) not null,
	IndexName varchar(30) not null,
	ShiftType varchar(8),
	ShiftSize decimal(18,5),
	ShiftExpiries varchar(100),
	ShiftStrikes varchar(200)
CONSTRAINT PK_SensitivityanalysisCapFloorVolatility PRIMARY KEY CLUSTERED 
(
	AnalysisId ASC,
	ccy ASC
))
ALTER TABLE SensitivityanalysisCapFloorVolatility WITH CHECK ADD CONSTRAINT FK_SensitivityanalysisCapFloorVolatility_AnalysisId FOREIGN KEY(AnalysisId)
REFERENCES Sensitivityanalysis (Id)
ALTER TABLE SensitivityanalysisCapFloorVolatility WITH CHECK ADD CONSTRAINT FK_SensitivityanalysisCapFloorVolatility_ccy FOREIGN KEY(ccy)
REFERENCES TypesCurrencyCode (value)
ALTER TABLE SensitivityanalysisCapFloorVolatility WITH CHECK ADD CONSTRAINT FK_SensitivityanalysisCapFloorVolatility_IndexName FOREIGN KEY(IndexName)
REFERENCES TypesIndexName (value)
ALTER TABLE SensitivityanalysisCapFloorVolatility WITH CHECK ADD CONSTRAINT FK_SensitivityanalysisCapFloorVolatility_ShiftType FOREIGN KEY(ShiftType)
REFERENCES TypesShiftType (value)

CREATE TABLE SensitivityanalysisCrossgammafilter (
	AnalysisId varchar(40) not null,
	Pair varchar(100) not null
CONSTRAINT PK_SensitivityanalysisCrossgammafilter PRIMARY KEY CLUSTERED 
(
	AnalysisId ASC,
	Pair ASC
))
ALTER TABLE SensitivityanalysisCrossgammafilter WITH CHECK ADD CONSTRAINT FK_SensitivityanalysisCrossgammafilter_AnalysisId FOREIGN KEY(AnalysisId)
REFERENCES Sensitivityanalysis (Id)

CREATE TABLE SensitivityanalysisCreditCurve (
	AnalysisId varchar(40) not null,
	Name varchar(30) not null,
	Currency varchar(7) not null,
	ShiftType varchar(8),
	ShiftSize decimal(18,5),
	ShiftTenors varchar(100)
CONSTRAINT PK_SensitivityanalysisCreditCurve PRIMARY KEY CLUSTERED 
(
	AnalysisId ASC,
	Name ASC
))
ALTER TABLE SensitivityanalysisCreditCurve WITH CHECK ADD CONSTRAINT FK_SensitivityanalysisCreditCurve_AnalysisId FOREIGN KEY(AnalysisId)
REFERENCES Sensitivityanalysis (Id)
ALTER TABLE SensitivityanalysisCreditCurve WITH CHECK ADD CONSTRAINT FK_SensitivityanalysisCreditCurve_Name FOREIGN KEY(Name)
REFERENCES TypesParties (value)
ALTER TABLE SensitivityanalysisCreditCurve WITH CHECK ADD CONSTRAINT FK_SensitivityanalysisCreditCurve_Currency FOREIGN KEY(Currency)
REFERENCES TypesCurrencyCode (value)
ALTER TABLE SensitivityanalysisCreditCurve WITH CHECK ADD CONSTRAINT FK_SensitivityanalysisCreditCurve_ShiftType FOREIGN KEY(ShiftType)
REFERENCES TypesShiftType (value)


CREATE TABLE SensitivityanalysisEquitySpot (
	AnalysisId varchar(40) not null,
	equity varchar(20) not null,
	ShiftType varchar(8),
	ShiftSize decimal(18,5),
	Shifts varchar(200)
CONSTRAINT PK_SensitivityanalysisEquitySpot PRIMARY KEY CLUSTERED 
(
	AnalysisId ASC,
	equity ASC
))
ALTER TABLE SensitivityanalysisEquitySpot WITH CHECK ADD CONSTRAINT FK_SensitivityanalysisEquitySpot_AnalysisId FOREIGN KEY(AnalysisId)
REFERENCES Sensitivityanalysis (Id)
ALTER TABLE SensitivityanalysisEquitySpot WITH CHECK ADD CONSTRAINT FK_SensitivityanalysisEquitySpot_ShiftType FOREIGN KEY(ShiftType)
REFERENCES TypesShiftType (value)
ALTER TABLE SensitivityanalysisEquitySpot WITH CHECK ADD CONSTRAINT FK_SensitivityanalysisEquitySpot_equity FOREIGN KEY(equity)
REFERENCES CurveConfigurationEquityCurves (CurveId)

CREATE TABLE SensitivityanalysisEquityVolatility (
	AnalysisId varchar(40) not null,
	equity varchar(20) not null,
	ShiftType varchar(8),
	ShiftSize decimal(18,5),
	Shifts varchar(200),
	ShiftExpiries varchar(100),
	ShiftStrikes varchar(100)
CONSTRAINT PK_SensitivityanalysisEquityVolatility PRIMARY KEY CLUSTERED 
(
	AnalysisId ASC,
	equity ASC
))
ALTER TABLE SensitivityanalysisEquityVolatility WITH CHECK ADD CONSTRAINT FK_SensitivityanalysisEquityVolatility_AnalysisId FOREIGN KEY(AnalysisId)
REFERENCES Sensitivityanalysis (Id)
ALTER TABLE SensitivityanalysisEquityVolatility WITH CHECK ADD CONSTRAINT FK_SensitivityanalysisEquityVolatility_ShiftType FOREIGN KEY(ShiftType)
REFERENCES TypesShiftType (value)
ALTER TABLE SensitivityanalysisEquityVolatility WITH CHECK ADD CONSTRAINT FK_SensitivityanalysisEquityVolatility_equity FOREIGN KEY(equity)
REFERENCES CurveConfigurationEquityCurves (CurveId)

CREATE TABLE SensitivityanalysisZeroInflationIndexCurve (
	AnalysisId varchar(40) not null,
	IndexName varchar(30) not null,
	ShiftType varchar(8),
	ShiftSize decimal(18,5),
	ShiftTenors varchar(100)
CONSTRAINT PK_SensitivityanalysisZeroInflationIndexCurve PRIMARY KEY CLUSTERED 
(
	AnalysisId ASC,
	IndexName ASC
))
ALTER TABLE SensitivityanalysisZeroInflationIndexCurve WITH CHECK ADD CONSTRAINT FK_SensitivityanalysisZeroInflationIndexCurve_AnalysisId FOREIGN KEY(AnalysisId)
REFERENCES Sensitivityanalysis (Id)
ALTER TABLE SensitivityanalysisZeroInflationIndexCurve WITH CHECK ADD CONSTRAINT FK_SensitivityanalysisZeroInflationIndexCurve_Name FOREIGN KEY(IndexName)
REFERENCES TypesIndexName (value)
ALTER TABLE SensitivityanalysisZeroInflationIndexCurve WITH CHECK ADD CONSTRAINT FK_SensitivityanalysisZeroInflationIndexCurve_ShiftType FOREIGN KEY(ShiftType)
REFERENCES TypesShiftType (value)

CREATE TABLE SensitivityanalysisYYInflationIndexCurve (
	AnalysisId varchar(40) not null,
	IndexName varchar(30) not null,
	ShiftType varchar(8),
	ShiftSize decimal(18,5),
	ShiftTenors varchar(100)
CONSTRAINT PK_SensitivityanalysisYYInflationIndexCurve PRIMARY KEY CLUSTERED 
(
	AnalysisId ASC,
	IndexName ASC
))
ALTER TABLE SensitivityanalysisYYInflationIndexCurve WITH CHECK ADD CONSTRAINT FK_SensitivityanalysisYYInflationIndexCurve_AnalysisId FOREIGN KEY(AnalysisId)
REFERENCES Sensitivityanalysis (Id)
ALTER TABLE SensitivityanalysisYYInflationIndexCurve WITH CHECK ADD CONSTRAINT FK_SensitivityanalysisYYInflationIndexCurve_Name FOREIGN KEY(IndexName)
REFERENCES TypesIndexName (value)
ALTER TABLE SensitivityanalysisYYInflationIndexCurve WITH CHECK ADD CONSTRAINT FK_SensitivityanalysisYYInflationIndexCurve_ShiftType FOREIGN KEY(ShiftType)
REFERENCES TypesShiftType (value)

CREATE TABLE SensitivityanalysisDividendYieldCurve (
	AnalysisId varchar(40) not null,
	equity varchar(20) not null,
	ShiftType varchar(8),
	ShiftSize decimal(18,5),
	Shifts varchar(200)
CONSTRAINT PK_SensitivityanalysisDividendYieldCurve PRIMARY KEY CLUSTERED 
(
	AnalysisId ASC,
	equity ASC
))
ALTER TABLE SensitivityanalysisDividendYieldCurve WITH CHECK ADD CONSTRAINT FK_SensitivityanalysisDividendYieldCurve_AnalysisId FOREIGN KEY(AnalysisId)
REFERENCES Sensitivityanalysis (Id)
ALTER TABLE SensitivityanalysisDividendYieldCurve WITH CHECK ADD CONSTRAINT FK_SensitivityanalysisDividendYieldCurve_ShiftType FOREIGN KEY(ShiftType)
REFERENCES TypesShiftType (value)
ALTER TABLE SensitivityanalysisDividendYieldCurve WITH CHECK ADD CONSTRAINT FK_SensitivityanalysisDividendYieldCurve_equity FOREIGN KEY(equity)
REFERENCES CurveConfigurationEquityCurves (CurveId)

CREATE TABLE SensitivityanalysisBaseCorrelation (
	AnalysisId varchar(40) not null,
	equity varchar(20) not null,
	ShiftType varchar(8),
	ShiftSize decimal(18,5),
	Shifts varchar(200),
	ShiftLossLevels varchar(100),
	ShiftTerms varchar(100)
CONSTRAINT PK_SensitivityanalysisBaseCorrelation PRIMARY KEY CLUSTERED 
(
	AnalysisId ASC,
	equity ASC
))
ALTER TABLE SensitivityanalysisBaseCorrelation WITH CHECK ADD CONSTRAINT FK_SensitivityanalysisBaseCorrelation_AnalysisId FOREIGN KEY(AnalysisId)
REFERENCES Sensitivityanalysis (Id)
ALTER TABLE SensitivityanalysisBaseCorrelation WITH CHECK ADD CONSTRAINT FK_SensitivityanalysisBaseCorrelation_ShiftType FOREIGN KEY(ShiftType)
REFERENCES TypesShiftType (value)
ALTER TABLE SensitivityanalysisBaseCorrelation WITH CHECK ADD CONSTRAINT FK_SensitivityanalysisBaseCorrelation_equity FOREIGN KEY(equity)
REFERENCES CurveConfigurationEquityCurves (CurveId)
