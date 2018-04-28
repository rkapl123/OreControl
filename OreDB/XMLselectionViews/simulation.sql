use ORE
GO

CREATE VIEW SimulationSelection
AS
SELECT o.Id, o.SimulationDescription,
	(SELECT
		(SELECT Discretization,Grid,Calendar,Sequence,Seed,Samples
		FROM SimulationParameters p where p.SimulationId = o.Id
		FOR XML PATH ('Parameters'), TYPE),
		(SELECT DomesticCcy,
			(SELECT Currency
			FROM SimulationCrossAssetModelCurrencies i WHERE i.SimulationId = o.Id ORDER BY (CASE WHEN i.Currency = c.DomesticCcy THEN '0' ELSE i.Currency END)
			FOR XML PATH (''), TYPE) Currencies,
			-- Domestic Currency always needs to be first !^^
			(SELECT Equity
			FROM SimulationCrossAssetModelEquities i WHERE i.SimulationId = o.Id
			FOR XML PATH (''), TYPE) Equities,
			BootstrapTolerance,
			(SELECT ccy [@ccy],CalibrationType,
				(SELECT VolatilityCalibrate Calibrate,VolatilityVolatilityType VolatilityType,VolatilityParamType ParamType,ISNULL(VolatilityTimeGrid,'') TimeGrid,VolatilityInitialValue InitialValue
				FROM SimulationCrossAssetModelInterestRateModels ii WHERE ii.SimulationId = i.SimulationId and ii.ccy = i.ccy
				FOR XML PATH (''), TYPE) Volatility,
				(SELECT ReversionCalibrate Calibrate,ReversionReversionType ReversionType,ReversionParamType ParamType,ISNULL(ReversionTimeGrid,'') TimeGrid,ReversionInitialValue InitialValue
				FROM SimulationCrossAssetModelInterestRateModels ii WHERE ii.SimulationId = i.SimulationId and ii.ccy = i.ccy
				FOR XML PATH (''), TYPE) Reversion,
				(SELECT CalibrationSwaptionsExpiries Expiries,CalibrationSwaptionsTerms Terms,CalibrationSwaptionsStrikes Strikes
				FROM SimulationCrossAssetModelInterestRateModels ii WHERE ii.SimulationId = i.SimulationId and ii.ccy = i.ccy
				FOR XML PATH (''), TYPE) CalibrationSwaptions,
				(SELECT ParameterTransformationShiftHorizon ShiftHorizon,ParameterTransformationScaling Scaling
				FROM SimulationCrossAssetModelInterestRateModels ii WHERE ii.SimulationId = i.SimulationId and ii.ccy = i.ccy
				FOR XML PATH (''), TYPE) ParameterTransformation
			FROM SimulationCrossAssetModelInterestRateModels i WHERE i.SimulationId = o.Id
			FOR XML PATH ('LGM'), TYPE) InterestRateModels,
			(SELECT ForeignCcy [@foreignCcy], DomesticCcy, CalibrationType, 
				(SELECT SigmaCalibrate Calibrate,SigmaParamType ParamType,ISNULL(SigmaTimeGrid,'') TimeGrid,SigmaInitialValue InitialValue
				FROM SimulationCrossAssetModelForeignExchangeModels ii WHERE ii.SimulationId = i.SimulationId and ii.ForeignCcy = i.ForeignCcy
				FOR XML PATH (''), TYPE) Sigma,
				(SELECT CalibrationOptionsExpiries Expiries,CalibrationOptionsStrikes Strikes
				FROM SimulationCrossAssetModelForeignExchangeModels ii WHERE ii.SimulationId = i.SimulationId and ii.ForeignCcy = i.ForeignCcy
				FOR XML PATH (''), TYPE) CalibrationOptions
			FROM SimulationCrossAssetModelForeignExchangeModels i WHERE i.SimulationId = o.Id
			FOR XML PATH ('CrossCcyLGM'), TYPE) ForeignExchangeModels,
			(SELECT name [@name], Currency, CalibrationType, 
				(SELECT SigmaCalibrate Calibrate,SigmaParamType ParamType,ISNULL(SigmaTimeGrid,'') TimeGrid,SigmaInitialValue InitialValue
				FROM SimulationCrossAssetModelEquityModels ii WHERE ii.SimulationId = i.SimulationId and ii.name = i.name
				FOR XML PATH (''), TYPE) Sigma,
				(SELECT CalibrationOptionsExpiries Expiries,CalibrationOptionsStrikes Strikes
				FROM SimulationCrossAssetModelEquityModels ii WHERE ii.SimulationId = i.SimulationId and ii.name = i.name
				FOR XML PATH (''), TYPE) CalibrationOptions
			FROM SimulationCrossAssetModelEquityModels i WHERE i.SimulationId = o.Id
			FOR XML PATH ('CrossAssetLGM'), TYPE) EquityModels,
			(SELECT factor1 [@factor1],factor2 [@factor2], Correlation [data()] 
			FROM SimulationCrossAssetModelInstantaneousCorrelations i where i.SimulationId = o.Id
			FOR XML PATH ('Correlation'), TYPE) InstantaneousCorrelations
		FROM SimulationCrossAssetModel c where c.SimulationId = o.Id
		FOR XML PATH ('CrossAssetModel'), TYPE),
		(SELECT BaseCurrency,
			(SELECT Currency 
			FROM SimulationMarketCurrencies i WHERE i.SimulationId = o.Id
			FOR XML PATH (''), TYPE) Currencies,
			(SELECT YieldCurvesConfigurationTenors Tenors, YieldCurvesConfigurationInterpolation Interpolation, YieldCurvesConfigurationExtrapolation Extrapolation
			FROM SimulationMarket i WHERE i.Id = o.Id
			FOR XML PATH ('Configuration'), TYPE) YieldCurves,
			(SELECT CurrencyPair
			FROM SimulationMarketFxRatesCurrencyPairs i WHERE i.SimulationId = o.Id AND NOT CurrencyPair IS NULL
			FOR XML PATH (''), ROOT('CurrencyPairs'), TYPE) FxRates,
			(SELECT IndexName [Index]
			FROM SimulationMarketIndices i WHERE i.SimulationId = o.Id
			FOR XML PATH (''), TYPE) Indices,
			(SELECT Name, ForwardingIndex, DiscountingIndex
			FROM SimulationMarketSwapIndices i WHERE i.SimulationId = o.Id
			FOR XML PATH ('SwapIndex'), TYPE) SwapIndices,
			(SELECT DefaultCurvesTenors Tenors,
				ISNULL((SELECT Name
				FROM SimulationMarketDefaultCurvesNames i WHERE i.SimulationId = o.Id
				FOR XML PATH (''), TYPE),(SELECT '' FOR XML PATH (''), TYPE)) Names
			FROM SimulationMarket i WHERE i.Id = o.Id AND NOT DefaultCurvesTenors IS NULL
			FOR XML PATH (''), ROOT('DefaultCurves'), TYPE),
			(SELECT SwaptionVolatilitiesSimulate Simulate,
				SwaptionVolatilitiesReactionToTimeDecay ReactionToTimeDecay,
				(SELECT Currency 
				FROM SimulationMarketSwaptionVolatilitiesCurrencies i WHERE i.SimulationId = o.Id
				FOR XML PATH (''), TYPE) Currencies,
				SwaptionVolatilitiesExpiries Expiries, SwaptionVolatilitiesTerms Terms,
				SwaptionVolatilitiesCubeSimulateATMOnly AS "Cube/SimulateATMOnly", SwaptionVolatilitiesCubeStrikeSpreads AS "Cube/StrikeSpreads"
			FROM SimulationMarket i WHERE i.Id = o.Id AND NOT SwaptionVolatilitiesSimulate IS NULL
			FOR XML PATH (''), ROOT('SwaptionVolatilities'), TYPE),
			(SELECT CapFloorVolatilitiesSimulate Simulate,
				CapFloorVolatilitiesReactionToTimeDecay ReactionToTimeDecay,
				(SELECT Currency 
				FROM SimulationMarketCapFloorVolatilitiesCurrencies i WHERE i.SimulationId = o.Id
				FOR XML PATH (''), TYPE) Currencies,
				CapFloorVolatilitiesExpiries Expiries,
				CapFloorVolatilitiesStrikes Strikes
			FROM SimulationMarket i WHERE i.Id = o.Id AND NOT CapFloorVolatilitiesSimulate IS NULL
			FOR XML PATH (''), ROOT('CapFloorVolatilities'), TYPE),
			(SELECT FxVolatilitiesSimulate Simulate,
				FxVolatilitiesReactionToTimeDecay ReactionToTimeDecay,
				(SELECT CurrencyPair
				FROM SimulationMarketFxVolatilitiesCurrencyPairs i WHERE i.SimulationId = o.Id
				FOR XML PATH (''), TYPE) CurrencyPairs,
				FxVolatilitiesExpiries Expiries,
				FxVolatilitiesSurfaceMoneyness AS "Surface/Moneyness"
			FROM SimulationMarket i WHERE i.Id = o.Id AND NOT FxVolatilitiesSimulate IS NULL
			FOR XML PATH (''), ROOT('FxVolatilities'), TYPE),
			(SELECT Currency, Name
			FROM SimulationMarketBenchmarkCurves i WHERE i.SimulationId = o.Id
			FOR XML PATH ('BenchmarkCurve'), TYPE) BenchmarkCurves,
			(SELECT Security
			FROM SimulationMarketSecurities i WHERE i.SimulationId = o.Id
			FOR XML PATH (''), TYPE) Securities,
			(SELECT
				(SELECT Name
				FROM SimulationMarketEquitiesNames i WHERE i.SimulationId = o.Id
				FOR XML PATH (''), TYPE) Names,
				EquitiesDividendTenors DividendTenors,
				EquitiesForecastTenors ForecastTenors
			FROM SimulationMarket i WHERE i.Id = o.Id AND NOT EquitiesDividendTenors IS NULL AND NOT EquitiesForecastTenors IS NULL
			FOR XML PATH (''), ROOT('Equities'), TYPE),
			(SELECT EquityVolatilitiesSimulate Simulate,
				EquityVolatilitiesReactionToTimeDecay ReactionToTimeDecay,
				(SELECT Name
				FROM SimulationMarketEquityVolatilitiesEquityNames i WHERE i.SimulationId = o.Id
				FOR XML PATH (''), TYPE) Names,
				EquityVolatilitiesExpiries Expiries,
				EquityVolatilitiesSurfaceSimulateATMOnly AS "Surface/SimulateATMOnly", EquityVolatilitiesSurfaceMoneyness AS "Surface/Moneyness"
			FROM SimulationMarket i WHERE i.Id = o.Id AND NOT EquityVolatilitiesSimulate IS NULL
			FOR XML PATH (''), ROOT('EquityVolatilities'), TYPE),
			(SELECT Currency
			FROM SimulationMarketAggregationScenarioDataCurrencies i WHERE i.SimulationId = o.Id
			FOR XML PATH (''), TYPE) AggregationScenarioDataCurrencies,
			(SELECT IndexName [Index]
			FROM SimulationMarketAggregationScenarioDataIndices i WHERE i.SimulationId = o.Id
			FOR XML PATH (''), TYPE) AggregationScenarioDataIndices
		FROM [dbo].[SimulationMarket] m where m.Id = o.Id
		FOR XML PATH ('Market'), TYPE)
	FOR XML PATH ('Simulation')) XMLData
FROM [dbo].[SimulationMarket] o
