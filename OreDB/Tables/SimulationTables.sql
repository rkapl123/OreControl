use ORE

-- SimulationMarket also represents the simulation itself (Id being referred to in other Tables and SimulationDescription)
CREATE TABLE SimulationMarket (
	Id varchar(20) NOT NULL,
	SimulationDescription varchar(120),
	BaseCurrency varchar(7),
	YieldCurvesConfigurationTenors varchar(120),
	YieldCurvesConfigurationInterpolation varchar(10),
	YieldCurvesConfigurationExtrapolation varchar(5),
	DefaultCurvesTenors varchar(120),
	DefaultCurvesSimulateSurvivalProbabilities varchar(5),
	EquitiesDividendTenors varchar(120),
	EquitiesForecastTenors varchar(120),
	EquitiesSimulateEquityForecastCurve varchar(5),
	EquitiesSimulateDividendYield varchar(5),
	SwaptionVolatilitiesSimulate varchar(5),
	SwaptionVolatilitiesReactionToTimeDecay varchar(20),
	SwaptionVolatilitiesExpiries varchar(120),
	SwaptionVolatilitiesTerms varchar(120),
	SwaptionVolatilitiesCubeSimulateATMOnly varchar(5),
	SwaptionVolatilitiesCubeStrikeSpreads varchar(120),
	CapFloorVolatilitiesSimulate varchar(5),
	CapFloorVolatilitiesReactionToTimeDecay varchar(20),
	CapFloorVolatilitiesExpiries varchar(120),
	CapFloorVolatilitiesStrikes varchar(120),
	CDSVolatilitiesSimulate varchar(5),
	CDSVolatilitiesReactionToTimeDecay varchar(20),
	CDSVolatilitiesExpiries varchar(120),
	FxVolatilitiesSimulate varchar(5),
	FxVolatilitiesReactionToTimeDecay varchar(20),
	FxVolatilitiesExpiries varchar(120),
	FxVolatilitiesSurfaceMoneyness varchar(120),
	EquityVolatilitiesSimulate varchar(5),
	EquityVolatilitiesReactionToTimeDecay varchar(20),
	EquityVolatilitiesExpiries varchar(120),
	EquityVolatilitiesSurfaceSimulateATMOnly varchar(5),
	EquityVolatilitiesSurfaceMoneyness varchar(120),
	YYInflationIndexCurvesTenors varchar(120),
	CpiCapFloorVolatilitiesSimulate varchar(5),
	CpiCapFloorVolatilitiesReactionToTimeDecay varchar(20),
	CpiCapFloorVolatilitiesExpiries varchar(120),
	CpiCapFloorVolatilitiesStrikes varchar(120),
	YYCapFloorVolatilitiesSimulate varchar(5),
	YYCapFloorVolatilitiesReactionToTimeDecay varchar(20),
	YYCapFloorVolatilitiesExpiries varchar(120),
	YYCapFloorVolatilitiesStrikes varchar(120),
	BaseCorrelationsSimulate varchar(5),
	BaseCorrelationsTerms varchar(120),
	BaseCorrelationsDetachmentPoints varchar(120)
CONSTRAINT PK_SimulationMarket PRIMARY KEY CLUSTERED (
	Id ASC
))
ALTER TABLE SimulationMarket WITH CHECK ADD CONSTRAINT FK_SimulationMarket_BaseCurrency FOREIGN KEY(BaseCurrency)
REFERENCES TypesCurrencyCode (value)
ALTER TABLE SimulationMarket WITH CHECK ADD CONSTRAINT FK_SimulationMarket_YieldCurvesConfigurationInterpolation FOREIGN KEY(YieldCurvesConfigurationInterpolation)
REFERENCES TypesYcInterpolation (value)
ALTER TABLE SimulationMarket WITH CHECK ADD CONSTRAINT FK_SimulationMarket_YieldCurvesConfigurationExtrapolation FOREIGN KEY(YieldCurvesConfigurationExtrapolation)
REFERENCES TypesBool (value)
ALTER TABLE SimulationMarket WITH CHECK ADD CONSTRAINT FK_SimulationMarket_DefaultCurvesSimulateSurvivalProbabilities FOREIGN KEY(DefaultCurvesSimulateSurvivalProbabilities)
REFERENCES TypesBool (value)
ALTER TABLE SimulationMarket WITH CHECK ADD CONSTRAINT FK_SimulationMarket_EquitiesSimulateEquityForecastCurve FOREIGN KEY(EquitiesSimulateEquityForecastCurve)
REFERENCES TypesBool (value)
ALTER TABLE SimulationMarket WITH CHECK ADD CONSTRAINT FK_SimulationMarket_EquitiesSimulateDividendYield FOREIGN KEY(EquitiesSimulateDividendYield)
REFERENCES TypesBool (value)
ALTER TABLE SimulationMarket WITH CHECK ADD CONSTRAINT FK_SimulationMarket_SwaptionVolatilitiesSimulate FOREIGN KEY(SwaptionVolatilitiesSimulate)
REFERENCES TypesBool (value)
ALTER TABLE SimulationMarket WITH CHECK ADD CONSTRAINT FK_SimulationMarket_SwaptionVolatilitiesReactionToTimeDecay FOREIGN KEY(SwaptionVolatilitiesReactionToTimeDecay)
REFERENCES TypesTimeDecayType (value)
ALTER TABLE SimulationMarket WITH CHECK ADD CONSTRAINT FK_SimulationMarket_SwaptionVolatilitiesCubeSimulateATMOnly FOREIGN KEY(SwaptionVolatilitiesCubeSimulateATMOnly)
REFERENCES TypesBool (value)
ALTER TABLE SimulationMarket WITH CHECK ADD CONSTRAINT FK_SimulationMarket_CapFloorVolatilitiesSimulate FOREIGN KEY(CapFloorVolatilitiesSimulate)
REFERENCES TypesBool (value)
ALTER TABLE SimulationMarket WITH CHECK ADD CONSTRAINT FK_SimulationMarket_CapFloorVolatilitiesReactionToTimeDecay FOREIGN KEY(CapFloorVolatilitiesReactionToTimeDecay)
REFERENCES TypesTimeDecayType (value)
ALTER TABLE SimulationMarket WITH CHECK ADD CONSTRAINT FK_SimulationMarket_CDSVolatilitiesSimulate FOREIGN KEY(CDSVolatilitiesSimulate)
REFERENCES TypesBool (value)
ALTER TABLE SimulationMarket WITH CHECK ADD CONSTRAINT FK_SimulationMarket_CDSVolatilitiesReactionToTimeDecay FOREIGN KEY(CDSVolatilitiesReactionToTimeDecay)
REFERENCES TypesTimeDecayType (value)
ALTER TABLE SimulationMarket WITH CHECK ADD CONSTRAINT FK_SimulationMarket_FxVolatilitiesSimulate FOREIGN KEY(FxVolatilitiesSimulate)
REFERENCES TypesBool (value)
ALTER TABLE SimulationMarket WITH CHECK ADD CONSTRAINT FK_SimulationMarket_FxVolatilitiesReactionToTimeDecay FOREIGN KEY(FxVolatilitiesReactionToTimeDecay)
REFERENCES TypesTimeDecayType (value)
ALTER TABLE SimulationMarket WITH CHECK ADD CONSTRAINT FK_SimulationMarket_EquityVolatilitiesSimulate FOREIGN KEY(EquityVolatilitiesSimulate)
REFERENCES TypesBool (value)
ALTER TABLE SimulationMarket WITH CHECK ADD CONSTRAINT FK_SimulationMarket_EquityVolatilitiesReactionToTimeDecay FOREIGN KEY(EquityVolatilitiesReactionToTimeDecay)
REFERENCES TypesTimeDecayType (value)
ALTER TABLE SimulationMarket WITH CHECK ADD CONSTRAINT FK_SimulationMarket_EquityVolatilitiesSurfaceSimulateATMOnly FOREIGN KEY(EquityVolatilitiesSurfaceSimulateATMOnly)
REFERENCES TypesBool (value)
ALTER TABLE SimulationMarket WITH CHECK ADD CONSTRAINT FK_SimulationMarket_CpiCapFloorVolatilitiesReactionToTimeDecay FOREIGN KEY(CpiCapFloorVolatilitiesReactionToTimeDecay)
REFERENCES TypesTimeDecayType (value)
ALTER TABLE SimulationMarket WITH CHECK ADD CONSTRAINT FK_SimulationMarket_CpiCapFloorVolatilitiesSimulate FOREIGN KEY(CpiCapFloorVolatilitiesSimulate)
REFERENCES TypesBool (value)
ALTER TABLE SimulationMarket WITH CHECK ADD CONSTRAINT FK_SimulationMarket_YYCapFloorVolatilitiesReactionToTimeDecay FOREIGN KEY(YYCapFloorVolatilitiesReactionToTimeDecay)
REFERENCES TypesTimeDecayType (value)
ALTER TABLE SimulationMarket WITH CHECK ADD CONSTRAINT FK_SimulationMarket_YYCapFloorVolatilitiesSimulate FOREIGN KEY(YYCapFloorVolatilitiesSimulate)
REFERENCES TypesBool (value)
ALTER TABLE SimulationMarket WITH CHECK ADD CONSTRAINT FK_SimulationMarket_BaseCorrelationsSimulate FOREIGN KEY(BaseCorrelationsSimulate)
REFERENCES TypesBool (value)

CREATE TABLE SimulationMarketYieldCurveDayCounters (
	SimulationId varchar(20) NOT NULL,
	YieldCurve varchar(20) NOT NULL,
	DayCounter varchar(30),
CONSTRAINT PK_SimulationMarketYieldCurveDayCounters PRIMARY KEY CLUSTERED (
	SimulationId ASC,
	YieldCurve ASC
))
ALTER TABLE SimulationMarketYieldCurveDayCounters WITH CHECK ADD CONSTRAINT FK_SimulationMarketYieldCurveDayCounters_SimulationId FOREIGN KEY(SimulationId)
REFERENCES SimulationMarket (Id)
ALTER TABLE SimulationMarketYieldCurveDayCounters WITH CHECK ADD CONSTRAINT FK_SimulationMarketYieldCurveDayCounters_YieldCurve FOREIGN KEY(YieldCurve)
REFERENCES CurveConfigurationYieldCurves (CurveId)
ALTER TABLE SimulationMarketYieldCurveDayCounters WITH CHECK ADD CONSTRAINT FK_SimulationMarketYieldCurveDayCounters_DayCounter FOREIGN KEY(DayCounter)
REFERENCES TypesDayCounter (value)

CREATE TABLE SimulationMarketFxRatesCurrencyPairs (
	SimulationId varchar(20) NOT NULL,
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
	SimulationId varchar(20) NOT NULL,
	IndexName varchar(30) NOT NULL
CONSTRAINT PK_SimulationMarketIndices PRIMARY KEY CLUSTERED (
	SimulationId ASC,
	IndexName ASC
))
ALTER TABLE SimulationMarketIndices WITH CHECK ADD CONSTRAINT FK_SimulationMarketIndices_SimulationId FOREIGN KEY(SimulationId)
REFERENCES SimulationMarket (Id)
ALTER TABLE SimulationMarketIndices WITH CHECK ADD CONSTRAINT FK_SimulationMarketIndices_IndexName FOREIGN KEY(IndexName)
REFERENCES TypesIndexName (value)

CREATE TABLE SimulationMarketSwapIndices (
	SimulationId varchar(20) NOT NULL,
	Name varchar(30) NOT NULL,
	ForwardingIndex varchar(30),
	DiscountingIndex varchar(30)
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

CREATE TABLE SimulationMarketCPIIndices (
	SimulationId varchar(20) NOT NULL,
	IndexName varchar(30) NOT NULL
CONSTRAINT PK_SimulationMarketCPIIndices PRIMARY KEY CLUSTERED (
	SimulationId ASC,
	IndexName ASC
))
ALTER TABLE SimulationMarketCPIIndices WITH CHECK ADD CONSTRAINT FK_SimulationMarketCPIIndices_SimulationId FOREIGN KEY(SimulationId)
REFERENCES SimulationMarket (Id)
ALTER TABLE SimulationMarketCPIIndices WITH CHECK ADD CONSTRAINT FK_SimulationMarketCPIIndices_IndexName FOREIGN KEY(IndexName)
REFERENCES TypesIndexName (value)

CREATE TABLE SimulationMarketZeroInflationIndexCurves (
	SimulationId varchar(20) NOT NULL,
	Name varchar(20) NOT NULL,
	DayCounter varchar(30),
CONSTRAINT PK_SimulationMarketZeroInflationIndexCurves PRIMARY KEY CLUSTERED (
	SimulationId ASC,
	Name ASC
))
ALTER TABLE SimulationMarketZeroInflationIndexCurves WITH CHECK ADD CONSTRAINT FK_SimulationMarketZeroInflationIndexCurves_SimulationId FOREIGN KEY(SimulationId)
REFERENCES SimulationMarket (Id)
ALTER TABLE SimulationMarketZeroInflationIndexCurves WITH CHECK ADD CONSTRAINT FK_SimulationMarketZeroInflationIndexCurves_Name FOREIGN KEY(Name)
REFERENCES CurveConfigurationYieldCurves (CurveId)
ALTER TABLE SimulationMarketZeroInflationIndexCurves WITH CHECK ADD CONSTRAINT FK_SimulationMarketZeroInflationIndexCurves_DayCounter FOREIGN KEY(DayCounter)
REFERENCES TypesDayCounter (value)

CREATE TABLE SimulationMarketYYInflationIndexCurves (
	SimulationId varchar(20) NOT NULL,
	Name varchar(20) NOT NULL,
	DayCounter varchar(30),
CONSTRAINT PK_SimulationMarketYYInflationIndexCurves PRIMARY KEY CLUSTERED (
	SimulationId ASC,
	Name ASC
))
ALTER TABLE SimulationMarketYYInflationIndexCurves WITH CHECK ADD CONSTRAINT FK_SimulationMarketYYInflationIndexCurves_SimulationId FOREIGN KEY(SimulationId)
REFERENCES SimulationMarket (Id)
ALTER TABLE SimulationMarketYYInflationIndexCurves WITH CHECK ADD CONSTRAINT FK_SimulationMarketYYInflationIndexCurves_Name FOREIGN KEY(Name)
REFERENCES CurveConfigurationYieldCurves (CurveId)
ALTER TABLE SimulationMarketYYInflationIndexCurves WITH CHECK ADD CONSTRAINT FK_SimulationMarketYYInflationIndexCurves_DayCounter FOREIGN KEY(DayCounter)
REFERENCES TypesDayCounter (value)

CREATE TABLE SimulationMarketCpiCapFloorVolatilities (
	SimulationId varchar(20) NOT NULL,
	Name varchar(20) NOT NULL
CONSTRAINT PK_SimulationMarketCpiCapFloorVolatilities PRIMARY KEY CLUSTERED (
	SimulationId ASC,
	Name ASC
))
ALTER TABLE SimulationMarketCpiCapFloorVolatilities WITH CHECK ADD CONSTRAINT FK_SimulationMarketCpiCapFloorVolatilities_SimulationId FOREIGN KEY(SimulationId)
REFERENCES SimulationMarket (Id)
ALTER TABLE SimulationMarketCpiCapFloorVolatilities WITH CHECK ADD CONSTRAINT FK_SimulationMarketCpiCapFloorVolatilities_Name FOREIGN KEY(Name)
REFERENCES CurveConfigurationYieldCurves (CurveId)

CREATE TABLE SimulationMarketYYCapFloorVolatilities (
	SimulationId varchar(20) NOT NULL,
	Name varchar(20) NOT NULL
CONSTRAINT PK_SimulationMarketYYCapFloorVolatilities PRIMARY KEY CLUSTERED (
	SimulationId ASC,
	Name ASC
))
ALTER TABLE SimulationMarketYYCapFloorVolatilities WITH CHECK ADD CONSTRAINT FK_SimulationMarketYYCapFloorVolatilities_SimulationId FOREIGN KEY(SimulationId)
REFERENCES SimulationMarket (Id)
ALTER TABLE SimulationMarketYYCapFloorVolatilities WITH CHECK ADD CONSTRAINT FK_SimulationMarketYYCapFloorVolatilities_Name FOREIGN KEY(Name)
REFERENCES CurveConfigurationYieldCurves (CurveId)


CREATE TABLE SimulationMarketDefaultCurvesNames (
	SimulationId varchar(20) NOT NULL,
	Name varchar(30) NOT NULL,
	DayCounter varchar(30),
	Calendar varchar(20)
CONSTRAINT PK_SimulationMarketDefaultCurvesNames PRIMARY KEY CLUSTERED (
	SimulationId ASC,
	Name ASC
))
ALTER TABLE SimulationMarketDefaultCurvesNames WITH CHECK ADD CONSTRAINT FK_SimulationMarketDefaultCurvesNames_SimulationId FOREIGN KEY(SimulationId)
REFERENCES SimulationMarket (Id)
ALTER TABLE SimulationMarketDefaultCurvesNames WITH CHECK ADD CONSTRAINT FK_SimulationMarketDefaultCurvesNames_Name FOREIGN KEY(Name)
REFERENCES TypesParties (value)
ALTER TABLE SimulationMarketDefaultCurvesNames WITH CHECK ADD CONSTRAINT FK_SimulationMarketDefaultCurvesNames_DayCounter FOREIGN KEY(DayCounter)
REFERENCES TypesDayCounter (value)
ALTER TABLE SimulationMarketDefaultCurvesNames WITH CHECK ADD CONSTRAINT FK_SimulationMarketDefaultCurvesNames_Calendar FOREIGN KEY(Calendar)
REFERENCES TypesCalendar (value)

CREATE TABLE SimulationMarketBaseCorrelationsNames (
	SimulationId varchar(20) NOT NULL,
	IndexName varchar(30) NOT NULL,
	DayCounter varchar(30)
CONSTRAINT PK_SimulationMarketBaseCorrelationsNames PRIMARY KEY CLUSTERED (
	SimulationId ASC,
	IndexName ASC
))
ALTER TABLE SimulationMarketBaseCorrelationsNames WITH CHECK ADD CONSTRAINT FK_SimulationMarketBaseCorrelationsNames_SimulationId FOREIGN KEY(SimulationId)
REFERENCES SimulationMarket (Id)
ALTER TABLE SimulationMarketBaseCorrelationsNames WITH CHECK ADD CONSTRAINT FK_SimulationMarketBaseCorrelationsNames_IndexName FOREIGN KEY(IndexName)
REFERENCES TypesIndexName (value)
ALTER TABLE SimulationMarketBaseCorrelationsNames WITH CHECK ADD CONSTRAINT FK_SimulationMarketBaseCorrelationsNames_DayCounter FOREIGN KEY(DayCounter)
REFERENCES TypesDayCounter (value)

CREATE TABLE SimulationMarketEquitiesNames (
	SimulationId varchar(20) NOT NULL,
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
	SimulationId varchar(20) NOT NULL,
	Currency varchar(7) NOT NULL,
	DayCounter varchar(30),
CONSTRAINT PK_SimulationMarketSwaptionVolatilitiesCurrencies PRIMARY KEY CLUSTERED (
	SimulationId ASC,
	Currency ASC
))
ALTER TABLE SimulationMarketSwaptionVolatilitiesCurrencies WITH CHECK ADD CONSTRAINT FK_SimulationMarketSwaptionVolatilitiesCurrencies_SimulationId FOREIGN KEY(SimulationId)
REFERENCES SimulationMarket (Id)
ALTER TABLE SimulationMarketSwaptionVolatilitiesCurrencies WITH CHECK ADD CONSTRAINT FK_SimulationMarketSwaptionVolatilitiesCurrencies_Currency FOREIGN KEY(Currency)
REFERENCES TypesCurrencyCode (value)
ALTER TABLE SimulationMarketSwaptionVolatilitiesCurrencies WITH CHECK ADD CONSTRAINT FK_SimulationMarketSwaptionVolatilitiesCurrencies_DayCounter FOREIGN KEY(DayCounter)
REFERENCES TypesDayCounter (value)

CREATE TABLE SimulationMarketCapFloorVolatilitiesCurrencies (
	SimulationId varchar(20) NOT NULL,
	Currency varchar(7) NOT NULL,
	DayCounter varchar(30),
CONSTRAINT PK_SimulationMarketCapFloorVolatilitiesCurrencies PRIMARY KEY CLUSTERED (
	SimulationId ASC,
	Currency ASC
))
ALTER TABLE SimulationMarketCapFloorVolatilitiesCurrencies WITH CHECK ADD CONSTRAINT FK_SimulationMarketCapFloorVolatilitiesCurrencies_SimulationId FOREIGN KEY(SimulationId)
REFERENCES SimulationMarket (Id)
ALTER TABLE SimulationMarketCapFloorVolatilitiesCurrencies WITH CHECK ADD CONSTRAINT FK_SimulationMarketCapFloorVolatilitiesCurrencies_Currency FOREIGN KEY(Currency)
REFERENCES TypesCurrencyCode (value)
ALTER TABLE SimulationMarketCapFloorVolatilitiesCurrencies WITH CHECK ADD CONSTRAINT FK_SimulationMarketCapFloorVolatilitiesCurrencies_DayCounter FOREIGN KEY(DayCounter)
REFERENCES TypesDayCounter (value)

CREATE TABLE SimulationMarketFxVolatilitiesCurrencyPairs (
	SimulationId varchar(20) NOT NULL,
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
	SimulationId varchar(20) NOT NULL,
	Name varchar(20) NOT NULL
CONSTRAINT PK_SimulationMarketEquityVolatilitiesEquityNames PRIMARY KEY CLUSTERED (
	SimulationId ASC,
	Name ASC
))
ALTER TABLE SimulationMarketEquityVolatilitiesEquityNames WITH CHECK ADD CONSTRAINT FK_SimulationMarketEquityVolatilitiesEquityNames_SimulationId FOREIGN KEY(SimulationId)
REFERENCES SimulationMarket (Id)
ALTER TABLE SimulationMarketEquityVolatilitiesEquityNames WITH CHECK ADD CONSTRAINT FK_SimulationMarketEquityVolatilitiesEquityNames_Name FOREIGN KEY(Name)
REFERENCES CurveConfigurationEquityCurves (CurveId)

CREATE TABLE SimulationMarketCDSVolatilitiesNames (
	SimulationId varchar(20) NOT NULL,
	Name varchar(20) NOT NULL
CONSTRAINT PK_SimulationMarketCDSVolatilitiesNames PRIMARY KEY CLUSTERED (
	SimulationId ASC,
	Name ASC
))
ALTER TABLE SimulationMarketCDSVolatilitiesNames WITH CHECK ADD CONSTRAINT FK_SimulationMarketCDSVolatilitiesNames_SimulationId FOREIGN KEY(SimulationId)
REFERENCES SimulationMarket (Id)
ALTER TABLE SimulationMarketCDSVolatilitiesNames WITH CHECK ADD CONSTRAINT FK_SimulationMarketCDSVolatilitiesNames_Name FOREIGN KEY(Name)
REFERENCES CurveConfigurationCDSVolatilities (CurveId)

CREATE TABLE SimulationMarketBenchmarkCurves (
	SimulationId varchar(20) NOT NULL,
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
	SimulationId varchar(20) NOT NULL,
	Security varchar(20) NOT NULL
CONSTRAINT PK_SimulationMarketSecurities PRIMARY KEY CLUSTERED (
	SimulationId ASC,
	Security ASC
))
ALTER TABLE SimulationMarketSecurities WITH CHECK ADD CONSTRAINT FK_SimulationMarketSecurities_SimulationId FOREIGN KEY(SimulationId)
REFERENCES SimulationMarket (Id)
ALTER TABLE SimulationMarketSecurities WITH CHECK ADD CONSTRAINT FK_SimulationMarketSecurities_Security FOREIGN KEY(Security)
REFERENCES CurveConfigurationSecurities (CurveId)

CREATE TABLE SimulationMarketAggregationScenarioDataCurrencies (
	SimulationId varchar(20) NOT NULL,
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
	SimulationId varchar(20) NOT NULL,
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
	SimulationId varchar(20) NOT NULL,
	IndexName varchar(30) NOT NULL
CONSTRAINT PK_SimulationMarketAggregationScenarioDataIndices PRIMARY KEY CLUSTERED (
	SimulationId ASC,
	IndexName ASC
))
ALTER TABLE SimulationMarketAggregationScenarioDataIndices WITH CHECK ADD CONSTRAINT FK_SimulationMarketAggregationScenarioDataIndices_SimulationId FOREIGN KEY(SimulationId)
REFERENCES SimulationMarket (Id)
ALTER TABLE SimulationMarketAggregationScenarioDataIndices WITH CHECK ADD CONSTRAINT FK_SimulationMarketAggregationScenarioDataIndices_IndexName FOREIGN KEY(IndexName)
REFERENCES TypesIndexName (value)

CREATE TABLE SimulationParameters (
	SimulationId varchar(20) NOT NULL,
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
	SimulationId varchar(20) NOT NULL,
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
	SimulationId varchar(20) NOT NULL,
	Equity varchar(20) NOT NULL
CONSTRAINT PK_SimulationCrossAssetModelEquities PRIMARY KEY CLUSTERED (
	SimulationId ASC,
	Equity ASC
))
ALTER TABLE SimulationCrossAssetModelEquities WITH CHECK ADD CONSTRAINT FK_SimulationCrossAssetModelEquities_SimulationId FOREIGN KEY(SimulationId)
REFERENCES SimulationMarket (Id)
ALTER TABLE SimulationCrossAssetModelEquities WITH CHECK ADD CONSTRAINT FK_SimulationCrossAssetModelEquities_Equity FOREIGN KEY(Equity)
REFERENCES CurveConfigurationEquityCurves (CurveId)

CREATE TABLE SimulationCrossAssetModelInflationIndices (
	SimulationId varchar(20) NOT NULL,
	InflationIndex varchar(30) NOT NULL
CONSTRAINT PK_SimulationCrossAssetModelInflationIndices PRIMARY KEY CLUSTERED (
	SimulationId ASC,
	InflationIndex ASC
))
ALTER TABLE SimulationCrossAssetModelInflationIndices WITH CHECK ADD CONSTRAINT FK_SimulationCrossAssetModelInflationIndices_SimulationId FOREIGN KEY(SimulationId)
REFERENCES SimulationMarket (Id)
ALTER TABLE SimulationCrossAssetModelInflationIndices WITH CHECK ADD CONSTRAINT FK_SimulationCrossAssetModelInflationIndices_InflationIndex FOREIGN KEY(InflationIndex)
REFERENCES TypesIndexName (value)

CREATE TABLE SimulationCrossAssetModelCurrencies (
	SimulationId varchar(20) NOT NULL,
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
	SimulationId varchar(20) NOT NULL,
	ccy varchar(7) NOT NULL,
	CalibrationType varchar(10),
	VolatilityCalibrate varchar(5),
	VolatilityVolatilityType varchar(10),
	VolatilityParamType varchar(10),
	VolatilityTimeGrid varchar(120),
	VolatilityInitialValue varchar(70),
	ReversionCalibrate varchar(5),
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

CREATE TABLE SimulationCrossAssetModelInflationIndexModels (
	SimulationId varchar(20) NOT NULL,
	Currency varchar(7) NOT NULL,
	InflationIndex varchar(20) NOT NULL,
	CalibrationType varchar(10),
	VolatilityCalibrate varchar(5),
	VolatilityVolatilityType varchar(10),
	VolatilityParamType varchar(10),
	VolatilityTimeGrid varchar(120),
	VolatilityInitialValue varchar(70),
	ReversionCalibrate varchar(5),
	ReversionReversionType varchar(10),
	ReversionParamType varchar(10),
	ReversionTimeGrid varchar(120),
	ReversionInitialValue decimal(18,12),
	CalibrationCapFloorsCapFloor varchar(120),
	CalibrationCapFloorsExpiries varchar(120),
	CalibrationCapFloorsStrikes varchar(120),
	ParameterTransformationShiftHorizon decimal(18,12),
	ParameterTransformationScaling decimal(18,12)
CONSTRAINT PK_SimulationCrossAssetModelInflationIndexModels PRIMARY KEY CLUSTERED (
	SimulationId ASC,
	Currency ASC,
	InflationIndex ASC
))
ALTER TABLE SimulationCrossAssetModelInflationIndexModels WITH CHECK ADD CONSTRAINT FK_SimulationCrossAssetModelInflationIndexModels_SimulationId FOREIGN KEY(SimulationId)
REFERENCES SimulationMarket (Id)
ALTER TABLE SimulationCrossAssetModelInflationIndexModels WITH CHECK ADD CONSTRAINT FK_SimulationCrossAssetModelInflationIndexModels_Currency FOREIGN KEY(Currency)
REFERENCES TypesCurrencyCode (value)
ALTER TABLE SimulationCrossAssetModelInflationIndexModels WITH CHECK ADD CONSTRAINT FK_SimulationCrossAssetModelInflationIndexModels_InflationIndex FOREIGN KEY(InflationIndex)
REFERENCES CurveConfigurationInflationCurves (CurveId)
ALTER TABLE SimulationCrossAssetModelInflationIndexModels WITH CHECK ADD CONSTRAINT FK_SimulationCrossAssetModelInflationIndexModels_CalibrationType FOREIGN KEY(CalibrationType)
REFERENCES TypesCalibrationTypeType (value)
ALTER TABLE SimulationCrossAssetModelInflationIndexModels WITH CHECK ADD CONSTRAINT FK_SimulationCrossAssetModelInflationIndexModels_VolatilityCalibrate FOREIGN KEY(VolatilityCalibrate)
REFERENCES TypesBool (value)
ALTER TABLE SimulationCrossAssetModelInflationIndexModels WITH CHECK ADD CONSTRAINT FK_SimulationCrossAssetModelInflationIndexModels_VolatilityVolatilityType FOREIGN KEY(VolatilityVolatilityType)
REFERENCES TypesVolatilityTypeType (value)
ALTER TABLE SimulationCrossAssetModelInflationIndexModels WITH CHECK ADD CONSTRAINT FK_SimulationCrossAssetModelInflationIndexModels_VolatilityParamType FOREIGN KEY(VolatilityParamType)
REFERENCES TypesParamTypeType (value)
ALTER TABLE SimulationCrossAssetModelInflationIndexModels WITH CHECK ADD CONSTRAINT FK_SimulationCrossAssetModelInflationIndexModels_ReversionCalibrate FOREIGN KEY(ReversionCalibrate)
REFERENCES TypesBool (value)
ALTER TABLE SimulationCrossAssetModelInflationIndexModels WITH CHECK ADD CONSTRAINT FK_SimulationCrossAssetModelInflationIndexModels_ReversionReversionType FOREIGN KEY(ReversionReversionType)
REFERENCES TypesVolatilityTypeType (value)
ALTER TABLE SimulationCrossAssetModelInflationIndexModels WITH CHECK ADD CONSTRAINT FK_SimulationCrossAssetModelInflationIndexModels_ReversionParamType FOREIGN KEY(ReversionParamType)
REFERENCES TypesParamTypeType (value)

CREATE TABLE SimulationCrossAssetModelForeignExchangeModels (
	SimulationId varchar(20) NOT NULL,
	ForeignCcy varchar(7) NOT NULL,
	DomesticCcy varchar(7),
	CalibrationType varchar(10),
	SigmaCalibrate varchar(5),
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
	SimulationId varchar(20) NOT NULL,
	name varchar(20) NOT NULL,
	Currency varchar(7),
	CalibrationType varchar(10),
	SigmaCalibrate varchar(5),
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
	SimulationId varchar(20) NOT NULL,
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

