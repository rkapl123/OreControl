# ORE DB

ORE DB is
- a collection of sql DDL scripts to create a Database for storing ORE Parameters, trade data and marketdata/fixingdata.
- perl scripts to extract given xml files (e.g. examples) or marketdata/fixingdata into sql DML scripts
- the perl scripts, SQL DDL/DML scripts and final database extraction/ORE running are executed with windows cmd-shell scripts.

## SQL DDL scripts

### Tables
The main rationale was to  
a) follow the structure set up by the xml schemata  
b) have relational intgrity where possible  
Following tables have been set up (grouped by usage/prefix) in the Tables folder:

#### Types
* TypesAmortizationType
* TypesBool
* TypesBusinessDayConvention
* TypesCalendar
* TypesCalibrationTypeType
* TypesCdsType
* TypesCompounding
* TypesCsaType
* TypesCurrencyCode
* TypesCurrencyPair
* TypesCurveType
* TypesDateRule
* TypesDayCounter
* TypesDefaultCurveType
* TypesDimensionType
* TypesDiscretizationType
* TypesEquityType
* TypesExtrapolationType
* TypesFactors
* TypesFrequencyType
* TypesIndependentAmountType
* TypesIndexName
* TypesInflationType
* TypesInterpolationMethodType
* TypesInterpolationVariableType
* TypesLegType
* TypesLongShort
* TypesOptionSettlement
* TypesOptionStyle
* TypesOptionType
* TypesOreTradeType
* TypesParamTypeType
* TypesParties
* TypesSegmentType
* TypesSegmentTypeType
* TypesSequenceType
* TypesShiftType
* TypesSubPeriodsCouponType
* TypesTimeDecayType
* TypesTradeActionOwner
* TypesTradeActionType
* TypesVolatilityType
* TypesVolatilityTypeType
* TypesYcInterpolation

#### Pricingengine
* PricingEngineEngineParameters
* PricingEngineModelParameters
* PricingEngineProducts

#### Conventions
* ConventionsAverageOIS
* ConventionsCDS
* ConventionsCrossCurrencyBasis
* ConventionsDeposit
* ConventionsFRA
* ConventionsFuture
* ConventionsFX
* ConventionsInflationSwap
* ConventionsOIS
* ConventionsSwap
* ConventionsSwapIndex
* ConventionsTenorBasisSwap
* ConventionsTenorBasisTwoSwap
* ConventionsZero

#### Todaysmarket
* TodaysMarketBaseCorrelations
* TodaysMarketCapFloorVolatilities
* TodaysMarketCDSVolatilities
* TodaysMarketConfiguration
* TodaysMarketConfigurationTypes
* TodaysMarketCurveSpecs
* TodaysMarketDefaultCurves
* TodaysMarketDiscountingCurves
* TodaysMarketEquityCurves
* TodaysMarketEquityVolatilities
* TodaysMarketFxSpots
* TodaysMarketFxVolatilities
* TodaysMarketIndexForwardingCurves
* TodaysMarketInflationCapFloorPriceSurfaces
* TodaysMarketSecurities
* TodaysMarketSwapIndexCurves
* TodaysMarketSwaptionVolatilities
* TodaysMarketYieldCurves
* TodaysMarketYYInflationIndexCurves
* TodaysMarketZeroInflationIndexCurves

#### CurveConfiguration
* CurveConfigurationBaseCorrelation
* CurveConfigurationCapFloorVolatilities
* CurveConfigurationCDSVolatilities
* CurveConfigurationCompositeQuotes
* CurveConfigurationDefaultCurves
* CurveConfigurationEquityCurves
* CurveConfigurationEquityVolatilities
* CurveConfigurationFXSpots
* CurveConfigurationFXVolatilities
* CurveConfigurationInflationCapFloorPriceSurfaces
* CurveConfigurationInflationCurves
* CurveConfigurationQuotes
* CurveConfigurationSeasonalityFactors
* CurveConfigurationSecurities
* CurveConfigurationSwaptionVolatilities
* CurveConfigurationYieldCurves
* CurveConfigurationYieldCurveSegments

#### OreParameters
* OreParametersAnalytics
* OreParametersConfigs
* OreParametersMarkets
* OreParametersSetup

#### Netting
* NettingCSADetails
* NettingEligibleCollateralsCurrencies
* NettingSet

#### Simulation
* SimulationCrossAssetModel
* SimulationCrossAssetModelCurrencies
* SimulationCrossAssetModelEquities
* SimulationCrossAssetModelEquityModels
* SimulationCrossAssetModelForeignExchangeModels
* SimulationCrossAssetModelInflationIndexModels
* SimulationCrossAssetModelInflationIndices
* SimulationCrossAssetModelInstantaneousCorrelations
* SimulationCrossAssetModelInterestRateModels
* SimulationMarket
* SimulationMarketAggregationScenarioDataCurrencies
* SimulationMarketAggregationScenarioDataIndices
* SimulationMarketBaseCorrelationsNames
* SimulationMarketBenchmarkCurves
* SimulationMarketCapFloorVolatilitiesCurrencies
* SimulationMarketCDSVolatilitiesNames
* SimulationMarketCpiCapFloorVolatilities
* SimulationMarketCPIIndices
* SimulationMarketCurrencies
* SimulationMarketDefaultCurvesNames
* SimulationMarketEquitiesNames
* SimulationMarketEquityVolatilitiesEquityNames
* SimulationMarketFxRatesCurrencyPairs
* SimulationMarketFxVolatilitiesCurrencyPairs
* SimulationMarketIndices
* SimulationMarketSecurities
* SimulationMarketSwapIndices
* SimulationMarketSwaptionVolatilitiesCurrencies
* SimulationMarketYieldCurveDayCounters
* SimulationMarketYYCapFloorVolatilities
* SimulationMarketYYInflationIndexCurves
* SimulationMarketZeroInflationIndexCurves
* SimulationParameters

#### Portfolio
* PortfolioAdditionalFields
* PortfolioBaskets
* PortfolioBondData
* PortfolioCapFloorData
* PortfolioCapRates
* PortfolioCDOData
* PortfolioCreditDefaultSwapData
* PortfolioEquityForwardData
* PortfolioEquityOptionData
* PortfolioFixedLegCPIRates
* PortfolioFloatingLegCaps
* PortfolioFloatingLegFloors
* PortfolioFloatingLegGearings
* PortfolioFloatingLegSpreads
* PortfolioFloorRates
* PortfolioFxForwardData
* PortfolioFxOptionData
* PortfolioIndexCreditDefaultSwapData
* PortfolioIndexCreditDefaultSwapOptionData
* PortfolioIndexCreditDefaultSwapOptionSwapData
* PortfolioLegData
* PortfolioLegNotionals
* PortfolioOptionExercises
* PortfolioScheduleDataDates
* PortfolioScheduleDataRules
* PortfolioSwapData
* PortfolioSwaptionData
* PortfolioTradeActions
* PortfolioTradePortfolioIds
* PortfolioTrades

#### Stresstest
* Stresstest
* StresstestCapFloorVolatility
* StresstestDiscountCurve
* StresstestEquitySpot
* StresstestEquityVolatility
* StresstestFxSpot
* StresstestFxVolatility
* StresstestIndexCurve
* StresstestSwaptionShift
* StresstestSwaptionVolatility
* StresstestYieldCurve
* StresstestYYInflationIndexCurve
* StresstestZeroInflationIndexCurve

#### Sensitivityanalysis
* Sensitivityanalysis
* SensitivityanalysisBaseCorrelation
* SensitivityanalysisCapFloorVolatility
* SensitivityanalysisCreditCurve
* SensitivityanalysisCrossgammafilter
* SensitivityanalysisDiscountCurve
* SensitivityanalysisDividendYieldCurve
* SensitivityanalysisEquitySpot
* SensitivityanalysisEquityVolatility
* SensitivityanalysisFxSpot
* SensitivityanalysisFxVolatility
* SensitivityanalysisIndexCurve
* SensitivityanalysisSwaptionVolatility
* SensitivityanalysisYieldCurve
* SensitivityanalysisYYInflationIndexCurve
* SensitivityanalysisZeroInflationIndexCurve

#### Marketdata
* FixingData
* FixingDataDefinitions
* MarketData
* MarketDataDefinitions

#### Results
* ResultsColVA
* ResultsCrossGamma
* ResultsCube
* ResultsCurves
* ResultsDimEvolution
* ResultsDimRegression
* ResultsExposureNettingSet
* ResultsExposureTrade
* ResultsFlows
* ResultsNPV
* ResultsScenario
* ResultsSensitivity
* ResultsStresstest
* ResultsXVA

### XMLselectionViews
These are MS SQL Server XML query Views to extract the data into usable xml text. The logic of this extraction is detailed in [https://rkapl123.github.io/SQLServerXML.html](https://rkapl123.github.io/SQLServerXML.html)

## SQL DML script generation

DML scripts are generated by perl scripts into the Data folder.

### ORE Parameters and Trade data
The cmd shell script runConvertXML2SQL.cmd (calls the perl script convertXML2SQL.pl) is used for the extraction of XML from ORE Parameter and Trade Data and conversion into DDL.
This can be either done for the provided Examples (as is preconfigured) or for other files. Configuration of the files to be taken is done in convertXML2SQL.pl:
```perl
# set this to your ORE Root folder
my $oreRoot='../../Engine';
# set this to the folder where configuration files are located (named as the example configurations)
my $configDir = "$oreRoot/Examples/Input";
# set this to the xsd schema definitions (should be the ones from the ORE Engine)
my $xsdDir = "$oreRoot/xsd";
# set this to your analysis input folder (to translate portfolio, ore parameters, netting sets and simulation/stresstest/sensitivity parameters)
my $inputDir = "$oreRoot/Examples/Example_1/Input";
# leave empty to process standard examples
#$inputDir = "";
```
The convertXML2SQL.pl script requires following packages to be installed: ```XML::LibXML; Scalar::Util```

### Market-, Covariance- and Fixing data
The cmd shell script runConvertMarketdata2SQL.cmd (calls the perl script convertMarketdata2SQL.pl) is used for the extraction of text from ORE marketdata/covariancedata/fixingdata and conversion into DDL.
This can be either done for the provided Examples (as is preconfigured) or for other files. Configuration of the files to be taken is done in convertXML2SQL.pl:
```perl
# set this to your ORE Root folder
my $oreRoot='../../Engine';
# set this to the folder where marketdata/fixingdata/covariance files are located
my $marketdataFile = "$oreRoot/Examples/Input/market_20160205.txt";
my $fixingdataFile = "$oreRoot/Examples/Input/fixings_20160205.txt";
my $covarianceFile = "$oreRoot/Examples/Example_15/Input/covariance.csv";
```

## Database creation and filling

The DDL and DML scripts are executed with runOREDBScriptsSQLServer.cmd that runs each script using runSingleScript.cmd (used as a wrapper for different databases, currently MS SQL and MYSQL have been tested, MYSQL doesn't handle the XML query views)

## Database extraction and running ORE

With the script runXMLOutput.cmd the Database stored data is fetched for example 2 (Sensitivityanalysis and Stresstest from example 15) and written into respective xml files in folder OREDB. Subsequently ORE is started with the ore.xml parametrization from example 2.
