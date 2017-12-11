use ORE

-- SimulationMarket also represents the simulation itself (Id being referred to in other Tables and SimulationDescription)
CREATE TABLE SimulationMarket (
	Id varchar(10) NOT NULL,
	SimulationDescription varchar(120),
	BaseCurrency varchar(7),
	YieldCurvesConfigurationTenors varchar(120),
	YieldCurvesConfigurationInterpolation varchar(10),
	YieldCurvesConfigurationExtrapolation varchar(5) COLLATE Latin1_General_CS_AS,
	DefaultCurvesTenors varchar(120),
	EquitiesTenors varchar(120),
	SwaptionVolatilitiesSimulate varchar(5) COLLATE Latin1_General_CS_AS,
	SwaptionVolatilitiesReactionToTimeDecay varchar(20),
	SwaptionVolatilitiesExpiries varchar(120),
	SwaptionVolatilitiesTerms varchar(120),
	SwaptionVolatilitiesStrikes varchar(120),
	CapFloorVolatilitiesSimulate varchar(5) COLLATE Latin1_General_CS_AS,
	CapFloorVolatilitiesReactionToTimeDecay varchar(20),
	CapFloorVolatilitiesExpiries varchar(120),
	CapFloorVolatilitiesStrikes varchar(120),
	FxVolatilitiesSimulate varchar(5) COLLATE Latin1_General_CS_AS,
	FxVolatilitiesReactionToTimeDecay varchar(20),
	FxVolatilitiesExpiries varchar(120),
	FxVolatilitiesStrikes varchar(120),
	EquityVolatilitiesSimulate varchar(5) COLLATE Latin1_General_CS_AS,
	EquityVolatilitiesReactionToTimeDecay varchar(20),
	EquityVolatilitiesExpiries varchar(120),
	EquityVolatilitiesStrikes varchar(120)
CONSTRAINT PK_SimulationMarket PRIMARY KEY CLUSTERED (
	Id ASC
))
ALTER TABLE SimulationMarket WITH CHECK ADD CONSTRAINT FK_SimulationMarket_BaseCurrency FOREIGN KEY(BaseCurrency)
REFERENCES TypesCurrencyCode (value)
ALTER TABLE SimulationMarket WITH CHECK ADD CONSTRAINT FK_SimulationMarket_YieldCurvesConfigurationInterpolation FOREIGN KEY(YieldCurvesConfigurationInterpolation)
REFERENCES TypesYcInterpolation (value)
ALTER TABLE SimulationMarket WITH CHECK ADD CONSTRAINT FK_SimulationMarket_YieldCurvesConfigurationExtrapolation FOREIGN KEY(YieldCurvesConfigurationExtrapolation)
REFERENCES TypesBool (value)
ALTER TABLE SimulationMarket WITH CHECK ADD CONSTRAINT FK_SimulationMarket_SwaptionVolatilitiesSimulate FOREIGN KEY(SwaptionVolatilitiesSimulate)
REFERENCES TypesBool (value)
ALTER TABLE SimulationMarket WITH CHECK ADD CONSTRAINT FK_SimulationMarket_SwaptionVolatilitiesReactionToTimeDecay FOREIGN KEY(SwaptionVolatilitiesReactionToTimeDecay)
REFERENCES TypesTimeDecayType (value)
ALTER TABLE SimulationMarket WITH CHECK ADD CONSTRAINT FK_SimulationMarket_CapFloorVolatilitiesSimulate FOREIGN KEY(CapFloorVolatilitiesSimulate)
REFERENCES TypesBool (value)
ALTER TABLE SimulationMarket WITH CHECK ADD CONSTRAINT FK_SimulationMarket_CapFloorVolatilitiesReactionToTimeDecay FOREIGN KEY(CapFloorVolatilitiesReactionToTimeDecay)
REFERENCES TypesTimeDecayType (value)
ALTER TABLE SimulationMarket WITH CHECK ADD CONSTRAINT FK_SimulationMarket_FxVolatilitiesSimulate FOREIGN KEY(FxVolatilitiesSimulate)
REFERENCES TypesBool (value)
ALTER TABLE SimulationMarket WITH CHECK ADD CONSTRAINT FK_SimulationMarket_FxVolatilitiesReactionToTimeDecay FOREIGN KEY(FxVolatilitiesReactionToTimeDecay)
REFERENCES TypesTimeDecayType (value)
ALTER TABLE SimulationMarket WITH CHECK ADD CONSTRAINT FK_SimulationMarket_EquityVolatilitiesSimulate FOREIGN KEY(EquityVolatilitiesSimulate)
REFERENCES TypesBool (value)
ALTER TABLE SimulationMarket WITH CHECK ADD CONSTRAINT FK_SimulationMarket_EquityVolatilitiesReactionToTimeDecay FOREIGN KEY(EquityVolatilitiesReactionToTimeDecay)
REFERENCES TypesTimeDecayType (value)

CREATE TABLE SimulationMarketFxRatesCurrencyPairs (
	SimulationId varchar(10) NOT NULL,
	CurrencyPair varchar(7) NOT NULL
CONSTRAINT PK_SimulationMarketFxRatesCurrencyPairs PRIMARY KEY CLUSTERED (
	SimulationId ASC,
	CurrencyPair ASC
))
ALTER TABLE SimulationMarketFxRatesCurrencyPairs WITH CHECK ADD CONSTRAINT FK_SimulationMarketFxRatesCurrencyPairs_SimulationId FOREIGN KEY(SimulationId)
REFERENCES SimulationMarket (Id)
ALTER TABLE SimulationMarketFxRatesCurrencyPairs WITH CHECK ADD CONSTRAINT FK_SimulationMarketFxRatesCurrencyPairs_CurrencyPair FOREIGN KEY(CurrencyPair)
REFERENCES TypesCurrencyPair (value)

CREATE TABLE SimulationMarketIndices (
	SimulationId varchar(10) NOT NULL,
	IndexName varchar(20) NOT NULL
CONSTRAINT PK_SimulationMarketIndices PRIMARY KEY CLUSTERED (
	SimulationId ASC,
	IndexName ASC
))
ALTER TABLE SimulationMarketIndices WITH CHECK ADD CONSTRAINT FK_SimulationMarketIndices_SimulationId FOREIGN KEY(SimulationId)
REFERENCES SimulationMarket (Id)
ALTER TABLE SimulationMarketIndices WITH CHECK ADD CONSTRAINT FK_SimulationMarketIndices_IndexName FOREIGN KEY(IndexName)
REFERENCES TypesIndexName (value)

CREATE TABLE SimulationMarketSwapIndices (
	SimulationId varchar(10) NOT NULL,
	Name varchar(20) NOT NULL,
	ForwardingIndex varchar(20),
	DiscountingIndex varchar(20)
CONSTRAINT PK_SimulationMarketSwapIndices PRIMARY KEY CLUSTERED (
	SimulationId ASC,
	Name ASC
))
ALTER TABLE SimulationMarketSwapIndices WITH CHECK ADD CONSTRAINT FK_SimulationMarketSwapIndices_SimulationId FOREIGN KEY(SimulationId)
REFERENCES SimulationMarket (Id)
ALTER TABLE SimulationMarketSwapIndices WITH CHECK ADD CONSTRAINT FK_SimulationMarketSwapIndices_Name FOREIGN KEY(Name)
REFERENCES TypesIndexName (value)
ALTER TABLE SimulationMarketSwapIndices WITH CHECK ADD CONSTRAINT FK_SimulationMarketSwapIndices_ForwardingIndex FOREIGN KEY(ForwardingIndex)
REFERENCES TypesIndexName (value)
ALTER TABLE SimulationMarketSwapIndices WITH CHECK ADD CONSTRAINT FK_SimulationMarketSwapIndices_DiscountingIndex FOREIGN KEY(DiscountingIndex)
REFERENCES TypesIndexName (value)

CREATE TABLE SimulationMarketDefaultCurvesNames (
	SimulationId varchar(10) NOT NULL,
	Name varchar(30) NOT NULL
CONSTRAINT PK_SimulationMarketDefaultCurvesNames PRIMARY KEY CLUSTERED (
	SimulationId ASC,
	Name ASC
))
ALTER TABLE SimulationMarketDefaultCurvesNames WITH CHECK ADD CONSTRAINT FK_SimulationMarketDefaultCurvesNames_SimulationId FOREIGN KEY(SimulationId)
REFERENCES SimulationMarket (Id)
ALTER TABLE SimulationMarketDefaultCurvesNames WITH CHECK ADD CONSTRAINT FK_SimulationMarketDefaultCurvesNames_Name FOREIGN KEY(Name)
REFERENCES TypesParties (value)

CREATE TABLE SimulationMarketEquitiesNames (
	SimulationId varchar(10) NOT NULL,
	Name varchar(20) NOT NULL
CONSTRAINT PK_SimulationMarketEquitiesNames PRIMARY KEY CLUSTERED (
	SimulationId ASC,
	Name ASC
))
ALTER TABLE SimulationMarketEquitiesNames WITH CHECK ADD CONSTRAINT FK_SimulationMarketEquitiesNames_SimulationId FOREIGN KEY(SimulationId)
REFERENCES SimulationMarket (Id)
ALTER TABLE SimulationMarketEquitiesNames WITH CHECK ADD CONSTRAINT FK_SimulationMarketEquitiesNames_Name FOREIGN KEY(Name)
REFERENCES CurveConfigurationEquityCurves (CurveId)

CREATE TABLE SimulationMarketSwaptionVolatilitiesCurrencies (
	SimulationId varchar(10) NOT NULL,
	Currency varchar(7) NOT NULL
CONSTRAINT PK_SimulationMarketSwaptionVolatilitiesCurrencies PRIMARY KEY CLUSTERED (
	SimulationId ASC,
	Currency ASC
))
ALTER TABLE SimulationMarketSwaptionVolatilitiesCurrencies WITH CHECK ADD CONSTRAINT FK_SimulationMarketSwaptionVolatilitiesCurrencies_SimulationId FOREIGN KEY(SimulationId)
REFERENCES SimulationMarket (Id)
ALTER TABLE SimulationMarketSwaptionVolatilitiesCurrencies WITH CHECK ADD CONSTRAINT FK_SimulationMarketSwaptionVolatilitiesCurrencies_Currency FOREIGN KEY(Currency)
REFERENCES TypesCurrencyCode (value)

CREATE TABLE SimulationMarketCapFloorVolatilitiesCurrencies (
	SimulationId varchar(10) NOT NULL,
	Currency varchar(7) NOT NULL
CONSTRAINT PK_SimulationMarketCapFloorVolatilitiesCurrencies PRIMARY KEY CLUSTERED (
	SimulationId ASC,
	Currency ASC
))
ALTER TABLE SimulationMarketCapFloorVolatilitiesCurrencies WITH CHECK ADD CONSTRAINT FK_SimulationMarketCapFloorVolatilitiesCurrencies_SimulationId FOREIGN KEY(SimulationId)
REFERENCES SimulationMarket (Id)
ALTER TABLE SimulationMarketCapFloorVolatilitiesCurrencies WITH CHECK ADD CONSTRAINT FK_SimulationMarketCapFloorVolatilitiesCurrencies_Currency FOREIGN KEY(Currency)
REFERENCES TypesCurrencyCode (value)

CREATE TABLE SimulationMarketFxVolatilitiesCurrencyPairs (
	SimulationId varchar(10) NOT NULL,
	CurrencyPair varchar(7) NOT NULL
CONSTRAINT PK_SimulationMarketFxVolatilitiesCurrencyPairs PRIMARY KEY CLUSTERED (
	SimulationId ASC,
	CurrencyPair ASC
))
ALTER TABLE SimulationMarketFxVolatilitiesCurrencyPairs WITH CHECK ADD CONSTRAINT FK_SimulationMarketFxVolatilitiesCurrencyPairs_SimulationId FOREIGN KEY(SimulationId)
REFERENCES SimulationMarket (Id)
ALTER TABLE SimulationMarketFxVolatilitiesCurrencyPairs WITH CHECK ADD CONSTRAINT FK_SimulationMarketFxVolatilitiesCurrencyPairs_CurrencyPair FOREIGN KEY(CurrencyPair)
REFERENCES TypesCurrencyPair (value)

CREATE TABLE SimulationMarketEquityVolatilitiesEquityNames (
	SimulationId varchar(10) NOT NULL,
	Name varchar(20) NOT NULL
CONSTRAINT PK_SimulationMarketEquityVolatilitiesEquityNames PRIMARY KEY CLUSTERED (
	SimulationId ASC,
	Name ASC
))
ALTER TABLE SimulationMarketEquityVolatilitiesEquityNames WITH CHECK ADD CONSTRAINT FK_SimulationMarketEquityVolatilitiesEquityNames_SimulationId FOREIGN KEY(SimulationId)
REFERENCES SimulationMarket (Id)
ALTER TABLE SimulationMarketEquityVolatilitiesEquityNames WITH CHECK ADD CONSTRAINT FK_SimulationMarketEquityVolatilitiesEquityNames_Name FOREIGN KEY(Name)
REFERENCES CurveConfigurationEquityCurves (CurveId)

CREATE TABLE SimulationMarketBenchmarkCurves (
	SimulationId varchar(10) NOT NULL,
	Currency varchar(7) NOT NULL,
	Name varchar(20) NOT NULL
CONSTRAINT PK_SimulationMarketBenchmarkCurves PRIMARY KEY CLUSTERED (
	SimulationId ASC,
	Currency ASC,
	Name ASC
))
ALTER TABLE SimulationMarketBenchmarkCurves WITH CHECK ADD CONSTRAINT FK_SimulationMarketBenchmarkCurves_SimulationId FOREIGN KEY(SimulationId)
REFERENCES SimulationMarket (Id)
ALTER TABLE SimulationMarketBenchmarkCurves WITH CHECK ADD CONSTRAINT FK_SimulationMarketBenchmarkCurves_Currency FOREIGN KEY(Currency)
REFERENCES TypesCurrencyCode (value)
ALTER TABLE SimulationMarketBenchmarkCurves WITH CHECK ADD CONSTRAINT FK_SimulationMarketBenchmarkCurves_Name FOREIGN KEY(Name)
REFERENCES CurveConfigurationYieldCurves (CurveId)

CREATE TABLE SimulationMarketSecurities (
	SimulationId varchar(10) NOT NULL,
	Security varchar(20) NOT NULL
CONSTRAINT PK_SimulationMarketSecurities PRIMARY KEY CLUSTERED (
	SimulationId ASC,
	Security ASC
))
ALTER TABLE SimulationMarketSecurities WITH CHECK ADD CONSTRAINT FK_SimulationMarketSecurities_SimulationId FOREIGN KEY(SimulationId)
REFERENCES SimulationMarket (Id)
ALTER TABLE SimulationMarketSecurities WITH CHECK ADD CONSTRAINT FK_SimulationMarketSecurities_Security FOREIGN KEY(Security)
REFERENCES CurveConfigurationSecuritySpreads (CurveId)

CREATE TABLE SimulationMarketAggregationScenarioDataCurrencies (
	SimulationId varchar(10) NOT NULL,
	Currency varchar(7) NOT NULL
CONSTRAINT PK_SimulationMarketAggregationScenarioDataCurrencies PRIMARY KEY CLUSTERED (
	SimulationId ASC,
	Currency ASC
))
ALTER TABLE SimulationMarketAggregationScenarioDataCurrencies WITH CHECK ADD CONSTRAINT FK_SimulationMarketAggregationScenarioDataCurrencies_SimulationId FOREIGN KEY(SimulationId)
REFERENCES SimulationMarket (Id)
ALTER TABLE SimulationMarketAggregationScenarioDataCurrencies WITH CHECK ADD CONSTRAINT FK_SimulationMarketAggregationScenarioDataCurrencies_Currency FOREIGN KEY(Currency)
REFERENCES TypesCurrencyCode (value)

CREATE TABLE SimulationMarketCurrencies (
	SimulationId varchar(10) NOT NULL,
	Currency varchar(7) NOT NULL
CONSTRAINT PK_SimulationMarketCurrencies PRIMARY KEY CLUSTERED (
	SimulationId ASC,
	Currency ASC
))
ALTER TABLE SimulationMarketCurrencies WITH CHECK ADD CONSTRAINT FK_SimulationMarketCurrencies_SimulationId FOREIGN KEY(SimulationId)
REFERENCES SimulationMarket (Id)
ALTER TABLE SimulationMarketCurrencies WITH CHECK ADD CONSTRAINT FK_SimulationMarketCurrencies_Currency FOREIGN KEY(Currency)
REFERENCES TypesCurrencyCode (value)

CREATE TABLE SimulationMarketAggregationScenarioDataIndices (
	SimulationId varchar(10) NOT NULL,
	IndexName varchar(20) NOT NULL
CONSTRAINT PK_SimulationMarketAggregationScenarioDataIndices PRIMARY KEY CLUSTERED (
	SimulationId ASC,
	IndexName ASC
))
ALTER TABLE SimulationMarketAggregationScenarioDataIndices WITH CHECK ADD CONSTRAINT FK_SimulationMarketAggregationScenarioDataIndices_SimulationId FOREIGN KEY(SimulationId)
REFERENCES SimulationMarket (Id)
ALTER TABLE SimulationMarketAggregationScenarioDataIndices WITH CHECK ADD CONSTRAINT FK_SimulationMarketAggregationScenarioDataIndices_IndexName FOREIGN KEY(IndexName)
REFERENCES TypesIndexName (value)
CREATE TABLE SimulationParameters (
	SimulationId varchar(10) NOT NULL,
	Discretization varchar(10),
	Grid varchar(120),
	Calendar varchar(20),
	Sequence varchar(30),
	Seed int,
	Samples int
CONSTRAINT PK_SimulationParameters PRIMARY KEY CLUSTERED (
	SimulationId ASC
))
ALTER TABLE SimulationParameters WITH CHECK ADD CONSTRAINT FK_SimulationParameters_SimulationId FOREIGN KEY(SimulationId)
REFERENCES SimulationMarket (Id)
ALTER TABLE SimulationParameters WITH CHECK ADD CONSTRAINT FK_SimulationParameters_Discretization FOREIGN KEY(Discretization)
REFERENCES TypesDiscretizationType (value)
ALTER TABLE SimulationParameters WITH CHECK ADD CONSTRAINT FK_SimulationParameters_Calendar FOREIGN KEY(Calendar)
REFERENCES TypesCalendar (value)
ALTER TABLE SimulationParameters WITH CHECK ADD CONSTRAINT FK_SimulationParameters_Sequence FOREIGN KEY(Sequence)
REFERENCES TypesSequenceType (value)

CREATE TABLE SimulationCrossAssetModel (
	SimulationId varchar(10) NOT NULL,
	DomesticCcy varchar(7),
	BootstrapTolerance decimal(18,14)
CONSTRAINT PK_SimulationCrossAssetModel PRIMARY KEY CLUSTERED (
	SimulationId ASC
))
ALTER TABLE SimulationCrossAssetModel WITH CHECK ADD CONSTRAINT FK_SimulationCrossAssetModel_SimulationId FOREIGN KEY(SimulationId)
REFERENCES SimulationMarket (Id)
ALTER TABLE SimulationCrossAssetModel WITH CHECK ADD CONSTRAINT FK_SimulationCrossAssetModel_DomesticCcy FOREIGN KEY(DomesticCcy)
REFERENCES TypesCurrencyCode (value)

CREATE TABLE SimulationCrossAssetModelEquities (
	SimulationId varchar(10) NOT NULL,
	Equity varchar(20) NOT NULL
CONSTRAINT PK_SimulationCrossAssetModelEquities PRIMARY KEY CLUSTERED (
	SimulationId ASC,
	Equity ASC
))
ALTER TABLE SimulationCrossAssetModelEquities WITH CHECK ADD CONSTRAINT FK_SimulationCrossAssetModelEquities_SimulationId FOREIGN KEY(SimulationId)
REFERENCES SimulationMarket (Id)
ALTER TABLE SimulationCrossAssetModelEquities WITH CHECK ADD CONSTRAINT FK_SimulationCrossAssetModelEquities_Equity FOREIGN KEY(Equity)
REFERENCES CurveConfigurationEquityCurves (CurveId)

CREATE TABLE SimulationCrossAssetModelCurrencies (
	SimulationId varchar(10) NOT NULL,
	Currency varchar(7) NOT NULL
CONSTRAINT PK_SimulationCrossAssetModelCurrencies PRIMARY KEY CLUSTERED (
	SimulationId ASC,
	Currency ASC
))
ALTER TABLE SimulationCrossAssetModelCurrencies WITH CHECK ADD CONSTRAINT FK_SimulationCrossAssetModelCurrencies_SimulationId FOREIGN KEY(SimulationId)
REFERENCES SimulationMarket (Id)
ALTER TABLE SimulationCrossAssetModelCurrencies WITH CHECK ADD CONSTRAINT FK_SimulationCrossAssetModelCurrencies_Currency FOREIGN KEY(Currency)
REFERENCES TypesCurrencyCode (value)

CREATE TABLE SimulationCrossAssetModelInterestRateModels (
	SimulationId varchar(10) NOT NULL,
	ccy varchar(7) NOT NULL,
	CalibrationType varchar(10),
	VolatilityCalibrate varchar(5) COLLATE Latin1_General_CS_AS,
	VolatilityVolatilityType varchar(10),
	VolatilityParamType varchar(10),
	VolatilityTimeGrid varchar(120),
	VolatilityInitialValue varchar(70),
	ReversionCalibrate varchar(5) COLLATE Latin1_General_CS_AS,
	ReversionReversionType varchar(10),
	ReversionParamType varchar(10),
	ReversionTimeGrid varchar(120),
	ReversionInitialValue decimal(18,12),
	CalibrationSwaptionsExpiries varchar(120),
	CalibrationSwaptionsTerms varchar(120),
	CalibrationSwaptionsStrikes varchar(120),
	ParameterTransformationShiftHorizon decimal(18,12),
	ParameterTransformationScaling decimal(18,12)
CONSTRAINT PK_SimulationCrossAssetModelInterestRateModels PRIMARY KEY CLUSTERED (
	SimulationId ASC,
	ccy ASC
))
ALTER TABLE SimulationCrossAssetModelInterestRateModels WITH CHECK ADD CONSTRAINT FK_SimulationCrossAssetModelInterestRateModels_SimulationId FOREIGN KEY(SimulationId)
REFERENCES SimulationMarket (Id)
ALTER TABLE SimulationCrossAssetModelInterestRateModels WITH CHECK ADD CONSTRAINT FK_SimulationCrossAssetModelInterestRateModels_ccy FOREIGN KEY(ccy)
REFERENCES TypesCurrencyCode (value)
ALTER TABLE SimulationCrossAssetModelInterestRateModels WITH CHECK ADD CONSTRAINT FK_SimulationCrossAssetModelInterestRateModels_CalibrationType FOREIGN KEY(CalibrationType)
REFERENCES TypesCalibrationTypeType (value)
ALTER TABLE SimulationCrossAssetModelInterestRateModels WITH CHECK ADD CONSTRAINT FK_SimulationCrossAssetModelInterestRateModels_VolatilityCalibrate FOREIGN KEY(VolatilityCalibrate)
REFERENCES TypesBool (value)
ALTER TABLE SimulationCrossAssetModelInterestRateModels WITH CHECK ADD CONSTRAINT FK_SimulationCrossAssetModelInterestRateModels_VolatilityVolatilityType FOREIGN KEY(VolatilityVolatilityType)
REFERENCES TypesVolatilityTypeType (value)
ALTER TABLE SimulationCrossAssetModelInterestRateModels WITH CHECK ADD CONSTRAINT FK_SimulationCrossAssetModelInterestRateModels_VolatilityParamType FOREIGN KEY(VolatilityParamType)
REFERENCES TypesParamTypeType (value)
ALTER TABLE SimulationCrossAssetModelInterestRateModels WITH CHECK ADD CONSTRAINT FK_SimulationCrossAssetModelInterestRateModels_ReversionCalibrate FOREIGN KEY(ReversionCalibrate)
REFERENCES TypesBool (value)
ALTER TABLE SimulationCrossAssetModelInterestRateModels WITH CHECK ADD CONSTRAINT FK_SimulationCrossAssetModelInterestRateModels_ReversionReversionType FOREIGN KEY(ReversionReversionType)
REFERENCES TypesVolatilityTypeType (value)
ALTER TABLE SimulationCrossAssetModelInterestRateModels WITH CHECK ADD CONSTRAINT FK_SimulationCrossAssetModelInterestRateModels_ReversionParamType FOREIGN KEY(ReversionParamType)
REFERENCES TypesParamTypeType (value)

CREATE TABLE SimulationCrossAssetModelForeignExchangeModels (
	SimulationId varchar(10) NOT NULL,
	ForeignCcy varchar(7) NOT NULL,
	DomesticCcy varchar(7),
	CalibrationType varchar(10),
	SigmaCalibrate varchar(5) COLLATE Latin1_General_CS_AS,
	SigmaParamType varchar(10),
	SigmaTimeGrid varchar(120),
	SigmaInitialValue varchar(70),
	CalibrationOptionsExpiries varchar(120),
	CalibrationOptionsStrikes varchar(120)
CONSTRAINT PK_SimulationCrossAssetModelForeignExchangeModels PRIMARY KEY CLUSTERED (
	SimulationId ASC,
	ForeignCcy ASC
))
ALTER TABLE SimulationCrossAssetModelForeignExchangeModels WITH CHECK ADD CONSTRAINT FK_SimulationCrossAssetModelForeignExchangeModels_SimulationId FOREIGN KEY(SimulationId)
REFERENCES SimulationMarket (Id)
ALTER TABLE SimulationCrossAssetModelForeignExchangeModels WITH CHECK ADD CONSTRAINT FK_SimulationCrossAssetModelForeignExchangeModels_ForeignCcy FOREIGN KEY(ForeignCcy)
REFERENCES TypesCurrencyCode (value)
ALTER TABLE SimulationCrossAssetModelForeignExchangeModels WITH CHECK ADD CONSTRAINT FK_SimulationCrossAssetModelForeignExchangeModels_DomesticCcy FOREIGN KEY(DomesticCcy)
REFERENCES TypesCurrencyCode (value)
ALTER TABLE SimulationCrossAssetModelForeignExchangeModels WITH CHECK ADD CONSTRAINT FK_SimulationCrossAssetModelForeignExchangeModels_CalibrationType FOREIGN KEY(CalibrationType)
REFERENCES TypesCalibrationTypeType (value)
ALTER TABLE SimulationCrossAssetModelForeignExchangeModels WITH CHECK ADD CONSTRAINT FK_SimulationCrossAssetModelForeignExchangeModels_SigmaCalibrate FOREIGN KEY(SigmaCalibrate)
REFERENCES TypesBool (value)
ALTER TABLE SimulationCrossAssetModelForeignExchangeModels WITH CHECK ADD CONSTRAINT FK_SimulationCrossAssetModelForeignExchangeModels_SigmaParamType FOREIGN KEY(SigmaParamType)
REFERENCES TypesParamTypeType (value)

CREATE TABLE SimulationCrossAssetModelEquityModels (
	SimulationId varchar(10) NOT NULL,
	name varchar(20) NOT NULL,
	Currency varchar(7),
	CalibrationType varchar(10),
	SigmaCalibrate varchar(5) COLLATE Latin1_General_CS_AS,
	SigmaParamType varchar(10),
	SigmaTimeGrid varchar(120),
	SigmaInitialValue varchar(70),
	CalibrationOptionsExpiries varchar(120),
	CalibrationOptionsStrikes varchar(120)
CONSTRAINT PK_SimulationCrossAssetModelEquityModels PRIMARY KEY CLUSTERED (
	SimulationId ASC,
	name ASC
))
ALTER TABLE SimulationCrossAssetModelEquityModels WITH CHECK ADD CONSTRAINT FK_SimulationCrossAssetModelEquityModels_SimulationId FOREIGN KEY(SimulationId)
REFERENCES SimulationMarket (Id)
ALTER TABLE SimulationCrossAssetModelEquityModels WITH CHECK ADD CONSTRAINT FK_SimulationCrossAssetModelEquityModels_Currency FOREIGN KEY(Currency)
REFERENCES TypesCurrencyCode (value)
ALTER TABLE SimulationCrossAssetModelEquityModels WITH CHECK ADD CONSTRAINT FK_SimulationCrossAssetModelEquityModels_CalibrationType FOREIGN KEY(CalibrationType)
REFERENCES TypesCalibrationTypeType (value)
ALTER TABLE SimulationCrossAssetModelEquityModels WITH CHECK ADD CONSTRAINT FK_SimulationCrossAssetModelEquityModels_SigmaCalibrate FOREIGN KEY(SigmaCalibrate)
REFERENCES TypesBool (value)
ALTER TABLE SimulationCrossAssetModelEquityModels WITH CHECK ADD CONSTRAINT FK_SimulationCrossAssetModelEquityModels_SigmaParamType FOREIGN KEY(SigmaParamType)
REFERENCES TypesParamTypeType (value)

CREATE TABLE SimulationCrossAssetModelInstantaneousCorrelations (
	SimulationId varchar(10) NOT NULL,
	factor1 varchar(20) NOT NULL,
	factor2 varchar(20) NOT NULL,
	Correlation decimal(9,8) NOT NULL
CONSTRAINT PK_SimulationCrossAssetModelInstantaneousCorrelations PRIMARY KEY CLUSTERED (
	SimulationId ASC,
	factor1 ASC,
	factor2 ASC
))
ALTER TABLE SimulationCrossAssetModelInstantaneousCorrelations WITH CHECK ADD CONSTRAINT FK_SimulationCrossAssetModelInstantaneousCorrelations_SimulationId FOREIGN KEY(SimulationId)
REFERENCES SimulationMarket (Id)
ALTER TABLE SimulationCrossAssetModelInstantaneousCorrelations WITH CHECK ADD CONSTRAINT FK_SimulationCrossAssetModelInstantaneousCorrelations_factor1 FOREIGN KEY(factor1)
REFERENCES TypesFactors (value)
ALTER TABLE SimulationCrossAssetModelInstantaneousCorrelations WITH CHECK ADD CONSTRAINT FK_SimulationCrossAssetModelInstantaneousCorrelations_factor2 FOREIGN KEY(factor2)
REFERENCES TypesFactors (value)
ALTER TABLE SimulationCrossAssetModelInstantaneousCorrelations WITH CHECK ADD CONSTRAINT CK_SimulationCrossAssetModelInstantaneousCorrelations_valueGreaterEqMinus1AndLessEqPlus1 CHECK (Correlation>=-1 AND Correlation<=1)

