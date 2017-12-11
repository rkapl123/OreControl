use ORE
GO

CREATE VIEW ConventionsSelection
AS
SELECT DISTINCT g.GroupingId,
(SELECT 
	(SELECT
		(SELECT Id,TenorBased,DayCounter,Compounding,CompoundingFrequency,TenorCalendar,SpotLag,SpotCalendar,RollConvention,EOM
		FROM ConventionsZero WHERE GroupingId = g.GroupingId
		FOR XML PATH ('Zero'), TYPE),
		(SELECT Id,SettlementDays,Calendar,Frequency,PaymentConvention,RuleName [Rule],DayCounter,SettlesAccrual,PaysAtDefaultTime
		FROM ConventionsCDS WHERE GroupingId = g.GroupingId
		FOR XML PATH ('CDS'), TYPE),
		(SELECT Id,IndexBased,IndexName [Index],Calendar,Convention,EOM,DayCounter
		FROM ConventionsDeposit WHERE GroupingId = g.GroupingId
		FOR XML PATH ('Deposit'), TYPE),
		(SELECT Id,IndexName [Index]
		FROM ConventionsFuture WHERE GroupingId = g.GroupingId
		FOR XML PATH ('Future'), TYPE),
		(SELECT Id,IndexName [Index]
		FROM ConventionsFRA WHERE GroupingId = g.GroupingId
		FOR XML PATH ('FRA'), TYPE),
		(SELECT Id,Conventions
		FROM ConventionsSwapIndex WHERE GroupingId = g.GroupingId
		FOR XML PATH ('SwapIndex'), TYPE),
		(SELECT Id,FixedCalendar,FixedFrequency,FixedConvention,FixedDayCounter,IndexName [Index],FloatFrequency,SubPeriodsCouponType
		FROM ConventionsSwap WHERE GroupingId = g.GroupingId
		FOR XML PATH ('Swap'), TYPE),
		(SELECT Id,SpotLag,IndexName [Index],FixedDayCounter,PaymentLag,EOM,FixedFrequency,FixedConvention,FixedPaymentConvention,RuleName [Rule]
		FROM ConventionsOIS WHERE GroupingId = g.GroupingId
		FOR XML PATH ('OIS'), TYPE),
		(SELECT Id,SpotLag,FixedTenor,FixedDayCounter,FixedCalendar,FixedConvention,FixedPaymentConvention,IndexName [Index],OnTenor,RateCutoff
		FROM ConventionsAverageOIS WHERE GroupingId = g.GroupingId
		FOR XML PATH ('AverageOIS'), TYPE),
		(SELECT Id,Calendar,LongFixedFrequency,LongFixedConvention,LongFixedDayCounter,LongIndex,ShortFixedFrequency,ShortFixedConvention,ShortFixedDayCounter,ShortIndex,LongMinusShort
		FROM ConventionsTenorBasisTwoSwap WHERE GroupingId = g.GroupingId
		FOR XML PATH ('TenorBasisTwoSwap'), TYPE),
		(SELECT Id,LongIndex,ShortIndex,ShortPayTenor,SpreadOnShort,IncludeSpread,SubPeriodsCouponType
		FROM ConventionsTenorBasisSwap WHERE GroupingId = g.GroupingId
		FOR XML PATH ('TenorBasisSwap'), TYPE),
		(SELECT Id,SpotDays,SourceCurrency,TargetCurrency,PointsFactor,AdvanceCalendar,SpotRelative,AdditionalSettleCalendar
		FROM ConventionsFX WHERE GroupingId = g.GroupingId
		FOR XML PATH ('FX'), TYPE),
		(SELECT Id,SettlementDays,SettlementCalendar,RollConvention,FlatIndex,SpreadIndex,EOM
		FROM ConventionsCrossCurrencyBasis WHERE GroupingId = g.GroupingId
		FOR XML PATH ('CrossCurrencyBasis'), TYPE),
		(SELECT Id,FixCalendar,FixConvention,DayCounter,IndexName [Index],Interpolated,ObservationLag,AdjustInflationObservationDates,InflationCalendar,InflationConvention
		FROM ConventionsInflationSwap WHERE GroupingId = g.GroupingId
		FOR XML PATH ('InflationSwap'), TYPE)
	FOR XML PATH ('Conventions'))) XMLData
FROM 
(SELECT GroupingId FROM ConventionsZero
UNION
SELECT GroupingId FROM ConventionsCDS
UNION
SELECT GroupingId FROM ConventionsDeposit
UNION
SELECT GroupingId FROM ConventionsFuture
UNION
SELECT GroupingId FROM ConventionsFRA
UNION
SELECT GroupingId FROM ConventionsSwapIndex
UNION
SELECT GroupingId FROM ConventionsSwap
UNION
SELECT GroupingId FROM ConventionsOIS
UNION
SELECT GroupingId FROM ConventionsAverageOIS
UNION
SELECT GroupingId FROM ConventionsTenorBasisTwoSwap
UNION
SELECT GroupingId FROM ConventionsTenorBasisSwap
UNION
SELECT GroupingId FROM ConventionsFX
UNION
SELECT GroupingId FROM ConventionsCrossCurrencyBasis
UNION
SELECT GroupingId FROM ConventionsInflationSwap) g