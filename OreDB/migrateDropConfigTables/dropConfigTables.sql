use ORE
go
drop view ConventionsSelection
go
drop view CurveConfigSelection
go
drop view OreParametersSelection
go
drop view PricingEngineSelection
go
drop view SensitivityanalysisSelection
go
drop view SimulationSelection
go
drop view StresstestSelection
go
drop view TodaysMarketSelection
go
-- OreParametersTables.sql
drop table OreParametersAnalytics
go
drop table OreParametersMarkets
go
drop table OreParametersSetup
go
drop table OreParametersConfigs
go
-- SimulationTables.sql
drop table SimulationCrossAssetModel
go
drop table SimulationCrossAssetModelCurrencies
go
drop table SimulationCrossAssetModelEquities
go
drop table SimulationCrossAssetModelEquityModels
go
drop table SimulationCrossAssetModelForeignExchangeModels
go
drop table SimulationCrossAssetModelInflationIndexModels
go
drop table SimulationCrossAssetModelInflationIndices
go
drop table SimulationCrossAssetModelInstantaneousCorrelations
go
drop table SimulationCrossAssetModelInterestRateModels
go
drop table SimulationMarketAggregationScenarioDataCurrencies
go
drop table SimulationMarketAggregationScenarioDataIndices
go
drop table SimulationMarketBaseCorrelationsNames
go
drop table SimulationMarketBenchmarkCurves
go
drop table SimulationMarketCapFloorVolatilitiesCurrencies
go
drop table SimulationMarketCDSVolatilitiesNames
go
drop table SimulationMarketCpiCapFloorVolatilities
go
drop table SimulationMarketCPIIndices
go
drop table SimulationMarketCurrencies
go
drop table SimulationMarketDefaultCurvesNames
go
drop table SimulationMarketEquitiesNames
go
drop table SimulationMarketEquityVolatilitiesEquityNames
go
drop table SimulationMarketFxRatesCurrencyPairs
go
drop table SimulationMarketFxVolatilitiesCurrencyPairs
go
drop table SimulationMarketIndices
go
drop table SimulationMarketSecurities
go
drop table SimulationMarketSwapIndices
go
drop table SimulationMarketSwaptionVolatilitiesCurrencies
go
drop table SimulationMarketYieldCurveDayCounters
go
drop table SimulationMarketYYCapFloorVolatilities
go
drop table SimulationMarketYYInflationIndexCurves
go
drop table SimulationMarketZeroInflationIndexCurves
go
drop table SimulationParameters
go
drop table SimulationMarket
go
-- StresstestTables.sql
drop table StresstestCapFloorVolatility
go
drop table StresstestDiscountCurve
go
drop table StresstestEquitySpot
go
drop table StresstestEquityVolatility
go
drop table StresstestFxSpot
go
drop table StresstestFxVolatility
go
drop table StresstestIndexCurve
go
drop table StresstestSwaptionShift
go
drop table StresstestSwaptionVolatility
go
drop table StresstestYieldCurve
go
drop table StresstestYYInflationIndexCurve
go
drop table StresstestZeroInflationIndexCurve
go
drop table Stresstest
go
-- SensitivityanalysisTables.sql
drop table SensitivityanalysisBaseCorrelation
go
drop table SensitivityanalysisCapFloorVolatility
go
drop table SensitivityanalysisCreditCurve
go
drop table SensitivityanalysisCrossgammafilter
go
drop table SensitivityanalysisDiscountCurve
go
drop table SensitivityanalysisDividendYieldCurve
go
drop table SensitivityanalysisEquitySpot
go
drop table SensitivityanalysisEquityVolatility
go
drop table SensitivityanalysisFxSpot
go
drop table SensitivityanalysisFxVolatility
go
drop table SensitivityanalysisIndexCurve
go
drop table SensitivityanalysisSwaptionVolatility
go
drop table SensitivityanalysisYieldCurve
go
drop table SensitivityanalysisYYInflationIndexCurve
go
drop table SensitivityanalysisZeroInflationIndexCurve
go
drop table Sensitivityanalysis
go
-- TodaysmarketTables.sql
drop table TodaysMarketBaseCorrelations
go
drop table TodaysMarketCapFloorVolatilities
go
drop table TodaysMarketCDSVolatilities
go
drop table TodaysMarketConfiguration
go
drop table TodaysMarketConfigurationTypes
go
drop table TodaysMarketDefaultCurves
go
drop table TodaysMarketDiscountingCurves
go
drop table TodaysMarketEquityCurves
go
drop table TodaysMarketEquityVolatilities
go
drop table TodaysMarketFxSpots
go
drop table TodaysMarketFxVolatilities
go
drop table TodaysMarketIndexForwardingCurves
go
drop table TodaysMarketInflationCapFloorPriceSurfaces
go
drop table TodaysMarketSecurities
go
drop table TodaysMarketSwapIndexCurves
go
drop table TodaysMarketSwaptionVolatilities
go
drop table TodaysMarketYieldCurves
go
drop table TodaysMarketYYInflationIndexCurves
go
drop table TodaysMarketZeroInflationIndexCurves
go
-- CurveConfigurationTables.sql
drop table CurveConfigurationBaseCorrelation
go
drop table CurveConfigurationCapFloorVolatilities
go
drop table CurveConfigurationCDSVolatilities
go
drop table CurveConfigurationCompositeQuotes
go
drop table CurveConfigurationDefaultCurves
go
drop table CurveConfigurationEquityCurves
go
drop table CurveConfigurationEquityVolatilities
go
drop table CurveConfigurationFXSpots
go
drop table CurveConfigurationFXVolatilities
go
drop table CurveConfigurationInflationCapFloorPriceSurfaces
go
drop table CurveConfigurationInflationCurves
go
drop table CurveConfigurationQuotes
go
drop table CurveConfigurationSeasonalityFactors
go
drop table CurveConfigurationSecurities
go
drop table CurveConfigurationSwaptionVolatilities
go
drop table CurveConfigurationYieldCurveSegments
go
drop table CurveConfigurationYieldCurves
go
drop table TodaysMarketCurveSpecs
go
-- ConventionsTables.sql
drop table ConventionsAverageOIS
go
drop table ConventionsCDS
go
drop table ConventionsCrossCurrencyBasis
go
drop table ConventionsDeposit
go
drop table ConventionsFRA
go
drop table ConventionsFuture
go
drop table ConventionsFX
go
drop table ConventionsInflationSwap
go
drop table ConventionsOIS
go
drop table ConventionsSwapIndex
go
drop table ConventionsSwap
go
drop table ConventionsTenorBasisSwap
go
drop table ConventionsTenorBasisTwoSwap
go
drop table ConventionsZero
go
-- PricingengineTables.sql
drop table PricingEngineEngineParameters
go
drop table PricingEngineModelParameters
go
drop table PricingEngineProducts
go
-- TypesTables.sql
drop table TypesAmortizationType
go
drop table TypesBool
go
drop table TypesBusinessDayConvention
go
drop table TypesCalendar
go
drop table TypesCalibrationTypeType
go
drop table TypesCdsType
go
drop table TypesCompounding
go
drop table TypesCsaType
go
drop table TypesCurrencyCode
go
drop table TypesCurrencyPair
go
drop table TypesCurveType
go
drop table TypesDateRule
go
drop table TypesDayCounter
go
drop table TypesDefaultCurves
go
drop table TypesDefaultCurveType
go
drop table TypesDimensionType
go
drop table TypesDiscretizationType
go
drop table TypesEquityCurves
go
drop table TypesEquityType
go
drop table TypesExtrapolationType
go
drop table TypesFactors
go
drop table TypesFrequencyType
go
drop table TypesIndependentAmountType
go
drop table TypesIndexName
go
drop table TypesInflationType
go
drop table TypesInterpolationMethodType
go
drop table TypesInterpolationVariableType
go
drop table TypesLegType
go
drop table TypesLongShort
go
drop table TypesOptionSettlement
go
drop table TypesOptionStyle
go
drop table TypesOptionType
go
drop table TypesOreTradeType
go
drop table TypesParamTypeType
go
drop table TypesParties
go
drop table TypesSecurityCurves
go
drop table TypesSegmentType
go
drop table TypesSegmentTypeType
go
drop table TypesSequenceType
go
drop table TypesShiftType
go
drop table TypesSubPeriodsCouponType
go
drop table TypesTimeDecayType
go
drop table TypesTradeActionOwner
go
drop table TypesTradeActionType
go
drop table TypesVolatilityType
go
drop table TypesVolatilityTypeType
go
drop table TypesYcInterpolation
go
