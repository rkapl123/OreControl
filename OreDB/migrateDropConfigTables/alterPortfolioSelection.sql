USE [ORE]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER OFF
GO

ALTER VIEW [dbo].[PortfolioSelection]
AS
SELECT DISTINCT pgo.GroupingId, (SELECT 
	(SELECT Id [@id], TradeType, 
		(SELECT 
			ti.EnvelopeCounterParty CounterParty, ti.EnvelopeNettingSetId NettingSetId,
			(SELECT taf.AddFieldsAdditionalId AdditionalId
			FROM PortfolioTrades taf WHERE taf.id = t.id
			FOR XML PATH (''), TYPE) AdditionalFields
		FROM PortfolioTrades ti WHERE ti.id = t.id
		FOR XML PATH (''), TYPE) Envelope,
		(SELECT 
			ta.Type, ta.Owner,
			(SELECT 
				(SELECT 
				s.StartDate, s.EndDate, s.Tenor, s.Calendar, s.Convention, s.TermConvention, s.RuleName [Rule], ISNULL(s.EndOfMonth,'') EndOfMonth, ISNULL(convert(varchar,s.FirstDate,112),'') FirstDate, ISNULL(convert(varchar,s.LastDate,112),'') LastDate
				FROM PortfolioScheduleDataRules s WHERE s.TradeActionId = ta.Id
				FOR XML PATH (''), TYPE) Rules,
				(SELECT s.ScheduleDate [Date]
				FROM PortfolioScheduleDataDates s WHERE s.TradeActionId = ta.Id
				FOR XML PATH (''), TYPE) Dates
			FOR XML PATH (''), TYPE) Schedule
			FROM PortfolioTradeActions ta WHERE ta.TradeId = t.id
		FOR XML PATH ('TradeAction'), TYPE) TradeActions,
		(SELECT 
			(SELECT 
				ld.LegType, ld.Payer, ld.Currency, ld.DayCounter, ld.PaymentConvention,
				CASE WHEN ld.LegType <> 'Cashflow' THEN
				(SELECT
					(SELECT ln.startDate [@startDate], ln.Notional [data()]
					FROM PortfolioLegNotionals ln WHERE ln.LegDataId =ld.Id ORDER by SeqId
					FOR XML PATH ('Notional'), TYPE),
					CASE WHEN (SELECT COUNT(li.FXresetForeignCurrency) FROM PortfolioLegData li WHERE li.Id =ld.Id) > 0 THEN (SELECT li.FXresetForeignCurrency ForeignCurrency, li.FXresetForeignAmount ForeignAmount, li.FXresetFXIndex FXIndex, li.FXresetFixingDays FixingDays
					FROM PortfolioLegData li WHERE li.Id =ld.Id
					FOR XML PATH ('FXReset'), TYPE) ELSE '' END,
					(SELECT	li.NotionalInitialExchange InitialExchange, li.NotionalAmortizingExchange AmortizingExchange, li.NotionalFinalExchange FinalExchange
					FROM PortfolioLegData li WHERE li.Id =ld.Id
					FOR XML PATH (''), TYPE) Exchanges
				FOR XML PATH (''), TYPE) END Notionals,
				CASE WHEN ld.LegType <> 'Cashflow' THEN
				(SELECT 
					(SELECT s.StartDate, s.EndDate, s.Tenor, s.Calendar, s.Convention, s.TermConvention, s.RuleName [Rule], ISNULL(s.EndOfMonth,'') EndOfMonth, ISNULL(convert(varchar,s.FirstDate,112),'') FirstDate, ISNULL(convert(varchar,s.LastDate,112),'') LastDate
					FROM PortfolioScheduleDataRules s WHERE s.LegDataId = ld.Id
					FOR XML PATH (''), TYPE) Rules,
					(SELECT s.ScheduleDate [Date]
					FROM PortfolioScheduleDataDates s WHERE s.LegDataId = ld.Id
					FOR XML PATH (''), TYPE) Dates
				FOR XML PATH (''), TYPE) END ScheduleData,
				CASE WHEN ld.LegType = 'Fixed' THEN 
				(SELECT 
					(SELECT r.StartDate [@startDate], r.Rate [data()]
					FROM PortfolioFixedLegCPIRates r WHERE r.LegDataId = ld.Id ORDER by SeqId
					FOR XML PATH ('Rate'), TYPE) Rates
				FOR XML PATH (''), TYPE) END FixedLegData,
				CASE WHEN ld.LegType = 'Floating' THEN 
				(SELECT 
					li.FloatingLegFixingDays FixingDays, li.FloatingLegIndexName [Index], li.FloatingLegIsInArrears IsInArrears, li.FloatingLegIsNotResettingXCCY IsNotResettingXCCY,
					(SELECT r.StartDate [@startDate], r.Spread [data()]
					FROM PortfolioFloatingLegSpreads r WHERE r.LegDataId = ld.Id ORDER by SeqId
					FOR XML PATH ('Spread'), TYPE) Spreads,
					(SELECT r.StartDate [@startDate], r.Cap [data()]
					FROM PortfolioFloatingLegCaps r WHERE r.LegDataId = ld.Id ORDER by SeqId
					FOR XML PATH ('Cap'), TYPE) Caps,
					(SELECT r.StartDate [@startDate], r.[Floor] [data()]
					FROM PortfolioFloatingLegFloors r WHERE r.LegDataId = ld.Id ORDER by SeqId
					FOR XML PATH ('Floor'), TYPE) Floors,
					(SELECT r.StartDate [@startDate], r.Gearing [data()]
					FROM PortfolioFloatingLegGearings r WHERE r.LegDataId = ld.Id ORDER by SeqId
					FOR XML PATH ('Gearing'), TYPE) Gearings
				FROM PortfolioLegData li WHERE li.Id = ld.Id
				FOR XML PATH (''), TYPE) END FloatingLegData,
				CASE WHEN ld.LegType = 'Cashflow' THEN 
				(SELECT 
					(SELECT c.StartDate [@Date], c.Amount [data()]
					FROM PortfolioCashflowDataCashflow c WHERE c.LegDataId = ld.Id ORDER by SeqId
					FOR XML PATH ('Amount'), TYPE) Cashflow
				FOR XML PATH (''), TYPE) END CashflowData,
				CASE WHEN ld.LegType = 'CPI' THEN 
				(SELECT 
					li.CPILegIndexName [Index],
					(SELECT r.StartDate [@startDate], r.Rate [data()]
					FROM PortfolioFixedLegCPIRates r WHERE r.LegDataId = ld.Id ORDER by SeqId
					FOR XML PATH ('Rate'), TYPE) Rates,
					li.CPILegBaseCPI BaseCPI, li.CPILegObservationLag ObservationLag, li.CPILegInterpolated Interpolated
				FROM PortfolioLegData li WHERE li.Id = ld.Id
				FOR XML PATH (''), TYPE) END CPILegData,
				CASE WHEN ld.LegType = 'YY' THEN 
				(SELECT
					li.YYLegIndexName [Index], li.YYLegFixingDays FixingDays, li.YYLegObservationLag ObservationLag, li.YYLegInterpolated Interpolated,
					(SELECT r.StartDate [@startDate], r.Rate [data()]
					FROM PortfolioFixedLegCPIRates r WHERE r.LegDataId = ld.Id ORDER by SeqId
					FOR XML PATH ('Rate'), TYPE) Rates
				FROM PortfolioLegData li WHERE li.Id = ld.Id
				FOR XML PATH (''), TYPE) END YYLegData
			FROM PortfolioLegData ld WHERE ld.TradeId = t.id
			FOR XML PATH ('LegData'), TYPE)
		FROM PortfolioTrades sd WHERE sd.id = t.id
		FOR XML PATH (''), TYPE) SwapData,
		(SELECT
			(SELECT sd.OptionDataLongShort LongShort, sd.OptionDataOptionType OptionType, sd.OptionDataStyle Style, sd.OptionDataSettlement Settlement, sd.OptionDataPayOffAtExpiry PayOffAtExpiry,
				(SELECT sd.OptionDataPremiumAmount Amount, sd.OptionDataPremiumCurrency Currency, sd.OptionDataPremiumPayDate [Date]
				FOR XML PATH (''), TYPE) Premium,
				(SELECT ed.ExerciseDate
				FROM PortfolioOptionExercises ed WHERE ed.TradeId = t.id
				FOR XML PATH (''), TYPE) ExerciseDates,
				(SELECT ed.ExerciseFee
				FROM PortfolioOptionExercises ed WHERE ed.TradeId = t.id
				FOR XML PATH (''), TYPE) ExerciseFees,
				(SELECT ed.ExercisePrice
				FROM PortfolioOptionExercises ed WHERE ed.TradeId = t.id
				FOR XML PATH (''), TYPE) ExercisePrices
			FOR XML PATH (''), TYPE) OptionData,
			(SELECT 
				ld.LegType, ld.Payer, ld.Currency, ld.DayCounter, ld.PaymentConvention,
				(SELECT
					(SELECT ln.startDate [@startDate], ln.Notional [data()]
					FROM PortfolioLegNotionals ln WHERE ln.LegDataId =ld.Id
					FOR XML PATH ('Notional'), TYPE),
					CASE WHEN (SELECT COUNT(li.FXresetForeignCurrency) FROM PortfolioLegData li WHERE li.Id =ld.Id) > 0 THEN (SELECT li.FXresetForeignCurrency ForeignCurrency, li.FXresetForeignAmount ForeignAmount, li.FXresetFXIndex FXIndex, li.FXresetFixingDays FixingDays
					FROM PortfolioLegData li WHERE li.Id =ld.Id
					FOR XML PATH ('FXReset'), TYPE) ELSE '' END,
					(SELECT	li.NotionalInitialExchange InitialExchange, li.NotionalAmortizingExchange AmortizingExchange, li.NotionalFinalExchange FinalExchange
					FROM PortfolioLegData li WHERE li.Id =ld.Id
					FOR XML PATH (''), TYPE) Exchanges
				FOR XML PATH (''), TYPE) Notionals,
				(SELECT 
					(SELECT s.StartDate, s.EndDate, s.Tenor, s.Calendar, s.Convention, s.TermConvention, s.RuleName [Rule], ISNULL(s.EndOfMonth,'') EndOfMonth, ISNULL(convert(varchar,s.FirstDate,112),'') FirstDate, ISNULL(convert(varchar,s.LastDate,112),'') LastDate
					FROM PortfolioScheduleDataRules s WHERE s.LegDataId = ld.Id
					FOR XML PATH (''), TYPE) Rules,
					(SELECT s.ScheduleDate [Date]
					FROM PortfolioScheduleDataDates s WHERE s.LegDataId = ld.Id
					FOR XML PATH (''), TYPE) Dates
				FOR XML PATH (''), TYPE) ScheduleData,
				CASE WHEN ld.LegType = 'Fixed' THEN 
				(SELECT 
					(SELECT r.StartDate [@startDate], r.Rate [data()]
					FROM PortfolioFixedLegCPIRates r WHERE r.LegDataId = ld.Id ORDER by SeqId
					FOR XML PATH ('Rate'), TYPE) Rates
				FOR XML PATH (''), TYPE) END FixedLegData,
				CASE WHEN ld.LegType = 'Floating' THEN 
				(SELECT 
					li.FloatingLegFixingDays FixingDays, li.FloatingLegIndexName [Index], li.FloatingLegIsInArrears IsInArrears, li.FloatingLegIsNotResettingXCCY IsNotResettingXCCY,
					(SELECT r.StartDate [@startDate], r.Spread [data()]
					FROM PortfolioFloatingLegSpreads r WHERE r.LegDataId = ld.Id ORDER by SeqId
					FOR XML PATH ('Spread'), TYPE) Spreads,
					(SELECT r.StartDate [@startDate], r.Cap [data()]
					FROM PortfolioFloatingLegCaps r WHERE r.LegDataId = ld.Id ORDER by SeqId
					FOR XML PATH ('Cap'), TYPE) Caps,
					(SELECT r.StartDate [@startDate], r.[Floor] [data()]
					FROM PortfolioFloatingLegFloors r WHERE r.LegDataId = ld.Id ORDER by SeqId
					FOR XML PATH ('Floor'), TYPE) Floors,
					(SELECT r.StartDate [@startDate], r.Gearing [data()]
					FROM PortfolioFloatingLegGearings r WHERE r.LegDataId = ld.Id ORDER by SeqId
					FOR XML PATH ('Gearing'), TYPE) Gearings
				FROM PortfolioLegData li WHERE li.Id = ld.Id
				FOR XML PATH (''), TYPE) END FloatingLegData,
				CASE WHEN ld.LegType = 'CPI' THEN 
				(SELECT 
					li.CPILegIndexName [Index],
					(SELECT r.StartDate [@startDate], r.Rate [data()]
					FROM PortfolioFixedLegCPIRates r WHERE r.LegDataId = ld.Id ORDER by SeqId
					FOR XML PATH ('Rate'), TYPE) Rates,
					li.CPILegBaseCPI BaseCPI, li.CPILegObservationLag ObservationLag, li.CPILegInterpolated Interpolated
				FROM PortfolioLegData li WHERE li.Id = ld.Id
				FOR XML PATH (''), TYPE) END CPILegData,
				CASE WHEN ld.LegType = 'YY' THEN 
				(SELECT
					li.YYLegIndexName [Index], li.YYLegFixingDays FixingDays, li.YYLegObservationLag ObservationLag, li.YYLegInterpolated Interpolated,
					(SELECT r.StartDate [@startDate], r.Rate [data()]
					FROM PortfolioFixedLegCPIRates r WHERE r.LegDataId = ld.Id ORDER by SeqId
					FOR XML PATH ('Rate'), TYPE) Rates
				FROM PortfolioLegData li WHERE li.Id = ld.Id
				FOR XML PATH (''), TYPE) END YYLegData
			FROM PortfolioLegData ld WHERE ld.TradeId = t.id
			FOR XML PATH ('LegData'), TYPE)
		FROM PortfolioSwaptionData sd WHERE sd.TradeId = t.id
		FOR XML PATH (''), TYPE) SwaptionData,
		(SELECT fd.ValueDate, fd.BoughtCurrency, fd.BoughtAmount, fd.SoldCurrency, fd.SoldAmount
		FROM PortfolioFxForwardData fd WHERE fd.TradeId = t.id
		FOR XML PATH (''), TYPE) FxForwardData,
		(SELECT
			(SELECT fo.OptionDataLongShort LongShort, fo.OptionDataOptionType OptionType, fo.OptionDataStyle Style, fo.OptionDataSettlement Settlement, fo.OptionDataPayOffAtExpiry PayOffAtExpiry,
				(SELECT fo.OptionDataPremiumAmount Amount, fo.OptionDataPremiumCurrency Currency, fo.OptionDataPremiumPayDate [Date]
				FOR XML PATH (''), TYPE) Premium,
				(SELECT ed.ExerciseDate
				FROM PortfolioOptionExercises ed WHERE ed.TradeId = t.id
				FOR XML PATH (''), TYPE) ExerciseDates,
				(SELECT ed.ExerciseFee
				FROM PortfolioOptionExercises ed WHERE ed.TradeId = t.id
				FOR XML PATH (''), TYPE) ExerciseFees,
				(SELECT ed.ExercisePrice
				FROM PortfolioOptionExercises ed WHERE ed.TradeId = t.id
				FOR XML PATH (''), TYPE) ExercisePrices
			FOR XML PATH (''), TYPE) OptionData, 
		fo.BoughtCurrency, fo.BoughtAmount,  fo.SoldCurrency, fo.SoldAmount
		FROM PortfolioFxOptionData fo WHERE fo.TradeId = t.id
		FOR XML PATH (''), TYPE) FxOptionData,
		(SELECT 
			cfd.LongShort,
			(SELECT 
				ld.LegType, ld.Payer, ld.Currency, ld.DayCounter, ld.PaymentConvention,
				(SELECT
					(SELECT ln.startDate [@startDate], ln.Notional [data()]
					FROM PortfolioLegNotionals ln WHERE ln.LegDataId =ld.Id
					FOR XML PATH ('Notional'), TYPE)
				FOR XML PATH (''), TYPE) Notionals,
				(SELECT 
					(SELECT s.StartDate, s.EndDate, s.Tenor, s.Calendar, s.Convention, s.TermConvention, s.RuleName [Rule], ISNULL(s.EndOfMonth,'') EndOfMonth, ISNULL(convert(varchar,s.FirstDate,112),'') FirstDate, ISNULL(convert(varchar,s.LastDate,112),'') LastDate
					FROM PortfolioScheduleDataRules s WHERE s.LegDataId = ld.Id
					FOR XML PATH (''), TYPE) Rules,
					(SELECT s.ScheduleDate [Date]
					FROM PortfolioScheduleDataDates s WHERE s.LegDataId = ld.Id
					FOR XML PATH (''), TYPE) Dates
				FOR XML PATH (''), TYPE) ScheduleData,
				CASE WHEN ld.LegType = 'Fixed' THEN 
				(SELECT 
					(SELECT r.StartDate [@startDate], r.Rate [data()]
					FROM PortfolioFixedLegCPIRates r WHERE r.LegDataId = ld.Id ORDER by SeqId
					FOR XML PATH ('Rate'), TYPE) Rates
				FOR XML PATH (''), TYPE) END FixedLegData,
				CASE WHEN ld.LegType = 'Floating' THEN 
				(SELECT 
					li.FloatingLegFixingDays FixingDays, li.FloatingLegIndexName [Index], li.FloatingLegIsInArrears IsInArrears, li.FloatingLegIsNotResettingXCCY IsNotResettingXCCY,
					(SELECT r.StartDate [@startDate], r.Spread [data()]
					FROM PortfolioFloatingLegSpreads r WHERE r.LegDataId = ld.Id ORDER by SeqId
					FOR XML PATH ('Spread'), TYPE) Spreads,
					(SELECT r.StartDate [@startDate], r.Cap [data()]
					FROM PortfolioFloatingLegCaps r WHERE r.LegDataId = ld.Id ORDER by SeqId
					FOR XML PATH ('Cap'), TYPE) Caps,
					(SELECT r.StartDate [@startDate], r.[Floor] [data()]
					FROM PortfolioFloatingLegFloors r WHERE r.LegDataId = ld.Id ORDER by SeqId
					FOR XML PATH ('Floor'), TYPE) Floors,
					(SELECT r.StartDate [@startDate], r.Gearing [data()]
					FROM PortfolioFloatingLegGearings r WHERE r.LegDataId = ld.Id ORDER by SeqId
					FOR XML PATH ('Gearing'), TYPE) Gearings
				FROM PortfolioLegData li WHERE li.Id = ld.Id
				FOR XML PATH (''), TYPE) END FloatingLegData,
				CASE WHEN ld.LegType = 'CPI' THEN 
				(SELECT 
					li.CPILegIndexName [Index],
					(SELECT r.StartDate [@startDate], r.Rate [data()]
					FROM PortfolioFixedLegCPIRates r WHERE r.LegDataId = ld.Id ORDER by SeqId
					FOR XML PATH ('Rate'), TYPE) Rates,
					li.CPILegBaseCPI BaseCPI, li.CPILegObservationLag ObservationLag, li.CPILegInterpolated Interpolated
				FROM PortfolioLegData li WHERE li.Id = ld.Id
				FOR XML PATH (''), TYPE) END CPILegData,
				CASE WHEN ld.LegType = 'YY' THEN 
				(SELECT
					li.YYLegIndexName [Index], li.YYLegFixingDays FixingDays, li.YYLegObservationLag ObservationLag, li.YYLegInterpolated Interpolated,
					(SELECT r.StartDate [@startDate], r.Rate [data()]
					FROM PortfolioFixedLegCPIRates r WHERE r.LegDataId = ld.Id ORDER by SeqId
					FOR XML PATH ('Rate'), TYPE) Rates
				FROM PortfolioLegData li WHERE li.Id = ld.Id
				FOR XML PATH (''), TYPE) END YYLegData
			FROM PortfolioLegData ld WHERE ld.TradeId = t.id
			FOR XML PATH ('LegData'), TYPE),
			(SELECT r.Rate
			FROM PortfolioCapRates r WHERE r.TradeId = t.Id ORDER by SeqId
			FOR XML PATH (''), TYPE) CapRates,
			(SELECT r.Rate
			FROM PortfolioFloorRates r WHERE r.TradeId = t.Id ORDER by SeqId
			FOR XML PATH (''), TYPE) FloorRates
		FROM PortfolioCapFloorData cfd WHERE cfd.TradeId = t.id
		FOR XML PATH (''), TYPE) CapFloorData,
		(SELECT
			(SELECT eo.OptionDataLongShort LongShort, eo.OptionDataOptionType OptionType, eo.OptionDataStyle Style, eo.OptionDataSettlement Settlement, eo.OptionDataPayOffAtExpiry PayOffAtExpiry,
				(SELECT eo.OptionDataPremiumAmount Amount, eo.OptionDataPremiumCurrency Currency, eo.OptionDataPremiumPayDate [Date]
				FOR XML PATH (''), TYPE) Premium,
				(SELECT ed.ExerciseDate
				FROM PortfolioOptionExercises ed WHERE ed.TradeId = t.id
				FOR XML PATH (''), TYPE) ExerciseDates,
				(SELECT ed.ExerciseFee
				FROM PortfolioOptionExercises ed WHERE ed.TradeId = t.id
				FOR XML PATH (''), TYPE) ExerciseFees,
				(SELECT ed.ExercisePrice
				FROM PortfolioOptionExercises ed WHERE ed.TradeId = t.id
				FOR XML PATH (''), TYPE) ExercisePrices
			FOR XML PATH (''), TYPE) OptionData,
		eo.Name, eo.Currency, eo.Strike, eo.Quantity
		FROM PortfolioEquityOptionData eo WHERE eo.TradeId = t.id
		FOR XML PATH (''), TYPE) EquityOptionData,
		(SELECT ed.LongShort, ed.Maturity, ed.Name, ed.Currency, ed.Strike, ed.Quantity
		FROM PortfolioEquityForwardData ed WHERE ed.TradeId = t.id
		FOR XML PATH (''), TYPE) EquityForwardData,
		(SELECT b.IssuerId, b.CreditCurveId, b.SecurityId, b.ReferenceCurveId, b.SettlementDays, b.Calendar, b.IssueDate,
			(SELECT 
				ld.LegType, ld.Payer, ld.Currency, ld.DayCounter, ld.PaymentConvention,
				(SELECT
					(SELECT ln.startDate [@startDate], ln.Notional [data()]
					FROM PortfolioLegNotionals ln WHERE ln.LegDataId =ld.Id
					FOR XML PATH ('Notional'), TYPE),
					CASE WHEN (SELECT COUNT(li.FXresetForeignCurrency) FROM PortfolioLegData li WHERE li.Id =ld.Id) > 0 THEN (SELECT li.FXresetForeignCurrency ForeignCurrency, li.FXresetForeignAmount ForeignAmount, li.FXresetFXIndex FXIndex, li.FXresetFixingDays FixingDays
					FROM PortfolioLegData li WHERE li.Id =ld.Id
					FOR XML PATH ('FXReset'), TYPE) ELSE '' END,
					(SELECT	li.NotionalInitialExchange InitialExchange, li.NotionalAmortizingExchange AmortizingExchange, li.NotionalFinalExchange FinalExchange
					FROM PortfolioLegData li WHERE li.Id =ld.Id
					FOR XML PATH (''), TYPE) Exchanges
				FOR XML PATH (''), TYPE) Notionals,
				(SELECT 
					(SELECT s.StartDate, s.EndDate, s.Tenor, s.Calendar, s.Convention, s.TermConvention, s.RuleName [Rule], ISNULL(s.EndOfMonth,'') EndOfMonth, ISNULL(convert(varchar,s.FirstDate,112),'') FirstDate, ISNULL(convert(varchar,s.LastDate,112),'') LastDate
					FROM PortfolioScheduleDataRules s WHERE s.LegDataId = ld.Id
					FOR XML PATH (''), TYPE) Rules,
					(SELECT s.ScheduleDate [Date]
					FROM PortfolioScheduleDataDates s WHERE s.LegDataId = ld.Id
					FOR XML PATH (''), TYPE) Dates
				FOR XML PATH (''), TYPE) ScheduleData,
				CASE WHEN ld.LegType = 'Fixed' THEN 
				(SELECT 
					(SELECT r.StartDate [@startDate], r.Rate [data()]
					FROM PortfolioFixedLegCPIRates r WHERE r.LegDataId = ld.Id ORDER by SeqId
					FOR XML PATH ('Rate'), TYPE) Rates
				FOR XML PATH (''), TYPE) END FixedLegData,
				CASE WHEN ld.LegType = 'Floating' THEN 
				(SELECT 
					li.FloatingLegFixingDays FixingDays, li.FloatingLegIndexName [Index], li.FloatingLegIsInArrears IsInArrears, li.FloatingLegIsNotResettingXCCY IsNotResettingXCCY,
					(SELECT r.StartDate [@startDate], r.Spread [data()]
					FROM PortfolioFloatingLegSpreads r WHERE r.LegDataId = ld.Id ORDER by SeqId
					FOR XML PATH ('Spread'), TYPE) Spreads,
					(SELECT r.StartDate [@startDate], r.Cap [data()]
					FROM PortfolioFloatingLegCaps r WHERE r.LegDataId = ld.Id ORDER by SeqId
					FOR XML PATH ('Cap'), TYPE) Caps,
					(SELECT r.StartDate [@startDate], r.[Floor] [data()]
					FROM PortfolioFloatingLegFloors r WHERE r.LegDataId = ld.Id ORDER by SeqId
					FOR XML PATH ('Floor'), TYPE) Floors,
					(SELECT r.StartDate [@startDate], r.Gearing [data()]
					FROM PortfolioFloatingLegGearings r WHERE r.LegDataId = ld.Id ORDER by SeqId
					FOR XML PATH ('Gearing'), TYPE) Gearings
				FROM PortfolioLegData li WHERE li.Id = ld.Id
				FOR XML PATH (''), TYPE) END FloatingLegData,
				CASE WHEN ld.LegType = 'CPI' THEN 
				(SELECT 
					li.CPILegIndexName [Index],
					(SELECT r.StartDate [@startDate], r.Rate [data()]
					FROM PortfolioFixedLegCPIRates r WHERE r.LegDataId = ld.Id ORDER by SeqId
					FOR XML PATH ('Rate'), TYPE) Rates,
					li.CPILegBaseCPI BaseCPI, li.CPILegObservationLag ObservationLag, li.CPILegInterpolated Interpolated
				FROM PortfolioLegData li WHERE li.Id = ld.Id
				FOR XML PATH (''), TYPE) END CPILegData,
				CASE WHEN ld.LegType = 'YY' THEN 
				(SELECT
					li.YYLegIndexName [Index], li.YYLegFixingDays FixingDays, li.YYLegObservationLag ObservationLag, li.YYLegInterpolated Interpolated,
					(SELECT r.StartDate [@startDate], r.Rate [data()]
					FROM PortfolioFixedLegCPIRates r WHERE r.LegDataId = ld.Id ORDER by SeqId
					FOR XML PATH ('Rate'), TYPE) Rates
				FROM PortfolioLegData li WHERE li.Id = ld.Id
				FOR XML PATH (''), TYPE) END YYLegData
			FROM PortfolioLegData ld WHERE ld.TradeId = t.id
			FOR XML PATH ('LegData'), TYPE)
		FROM PortfolioBondData b WHERE b.TradeId = t.id
		FOR XML PATH (''), TYPE) BondData,
		(SELECT cd.IssuerId, cd.CreditCurveId, cd.SettlesAccrual, cd.PaysAtDefaultTime, cd.ProtectionStart, cd.UpfrontDate, cd.UpfrontFee,
			(SELECT 
				ld.LegType, ld.Payer, ld.Currency, ld.DayCounter, ld.PaymentConvention,
				(SELECT
					(SELECT ln.startDate [@startDate], ln.Notional [data()]
					FROM PortfolioLegNotionals ln WHERE ln.LegDataId =ld.Id
					FOR XML PATH ('Notional'), TYPE),
					CASE WHEN (SELECT COUNT(li.FXresetForeignCurrency) FROM PortfolioLegData li WHERE li.Id =ld.Id) > 0 THEN (SELECT li.FXresetForeignCurrency ForeignCurrency, li.FXresetForeignAmount ForeignAmount, li.FXresetFXIndex FXIndex, li.FXresetFixingDays FixingDays
					FROM PortfolioLegData li WHERE li.Id =ld.Id
					FOR XML PATH ('FXReset'), TYPE) ELSE '' END,
					(SELECT	li.NotionalInitialExchange InitialExchange, li.NotionalAmortizingExchange AmortizingExchange, li.NotionalFinalExchange FinalExchange
					FROM PortfolioLegData li WHERE li.Id =ld.Id
					FOR XML PATH (''), TYPE) Exchanges
				FOR XML PATH (''), TYPE) Notionals,
				(SELECT 
					(SELECT s.StartDate, s.EndDate, s.Tenor, s.Calendar, s.Convention, s.TermConvention, s.RuleName [Rule], ISNULL(s.EndOfMonth,'') EndOfMonth, ISNULL(convert(varchar,s.FirstDate,112),'') FirstDate, ISNULL(convert(varchar,s.LastDate,112),'') LastDate
					FROM PortfolioScheduleDataRules s WHERE s.LegDataId = ld.Id
					FOR XML PATH (''), TYPE) Rules,
					(SELECT s.ScheduleDate [Date]
					FROM PortfolioScheduleDataDates s WHERE s.LegDataId = ld.Id
					FOR XML PATH (''), TYPE) Dates
				FOR XML PATH (''), TYPE) ScheduleData,
				CASE WHEN ld.LegType = 'Fixed' THEN 
				(SELECT 
					(SELECT r.StartDate [@startDate], r.Rate [data()]
					FROM PortfolioFixedLegCPIRates r WHERE r.LegDataId = ld.Id ORDER by SeqId
					FOR XML PATH ('Rate'), TYPE) Rates
				FOR XML PATH (''), TYPE) END FixedLegData,
				CASE WHEN ld.LegType = 'Floating' THEN 
				(SELECT 
					li.FloatingLegFixingDays FixingDays, li.FloatingLegIndexName [Index], li.FloatingLegIsInArrears IsInArrears, li.FloatingLegIsNotResettingXCCY IsNotResettingXCCY,
					(SELECT r.StartDate [@startDate], r.Spread [data()]
					FROM PortfolioFloatingLegSpreads r WHERE r.LegDataId = ld.Id ORDER by SeqId
					FOR XML PATH ('Spread'), TYPE) Spreads,
					(SELECT r.StartDate [@startDate], r.Cap [data()]
					FROM PortfolioFloatingLegCaps r WHERE r.LegDataId = ld.Id ORDER by SeqId
					FOR XML PATH ('Cap'), TYPE) Caps,
					(SELECT r.StartDate [@startDate], r.[Floor] [data()]
					FROM PortfolioFloatingLegFloors r WHERE r.LegDataId = ld.Id ORDER by SeqId
					FOR XML PATH ('Floor'), TYPE) Floors,
					(SELECT r.StartDate [@startDate], r.Gearing [data()]
					FROM PortfolioFloatingLegGearings r WHERE r.LegDataId = ld.Id ORDER by SeqId
					FOR XML PATH ('Gearing'), TYPE) Gearings
				FROM PortfolioLegData li WHERE li.Id = ld.Id
				FOR XML PATH (''), TYPE) END FloatingLegData,
				CASE WHEN ld.LegType = 'CPI' THEN 
				(SELECT 
					li.CPILegIndexName [Index],
					(SELECT r.StartDate [@startDate], r.Rate [data()]
					FROM PortfolioFixedLegCPIRates r WHERE r.LegDataId = ld.Id ORDER by SeqId
					FOR XML PATH ('Rate'), TYPE) Rates,
					li.CPILegBaseCPI BaseCPI, li.CPILegObservationLag ObservationLag, li.CPILegInterpolated Interpolated
				FROM PortfolioLegData li WHERE li.Id = ld.Id
				FOR XML PATH (''), TYPE) END CPILegData,
				CASE WHEN ld.LegType = 'YY' THEN 
				(SELECT
					li.YYLegIndexName [Index], li.YYLegFixingDays FixingDays, li.YYLegObservationLag ObservationLag, li.YYLegInterpolated Interpolated,
					(SELECT r.StartDate [@startDate], r.Rate [data()]
					FROM PortfolioFixedLegCPIRates r WHERE r.LegDataId = ld.Id ORDER by SeqId
					FOR XML PATH ('Rate'), TYPE) Rates
				FROM PortfolioLegData li WHERE li.Id = ld.Id
				FOR XML PATH (''), TYPE) END YYLegData
			FROM PortfolioLegData ld WHERE ld.TradeId = t.id
			FOR XML PATH ('LegData'), TYPE)
		FROM PortfolioCreditDefaultSwapData cd WHERE cd.TradeId = t.id
		FOR XML PATH (''), TYPE) CreditDefaultSwapData,
		(SELECT id.CreditCurveId, id.SettlesAccrual, id.PaysAtDefaultTime, id.ProtectionStart, id.UpfrontDate, id.UpfrontFee,
			(SELECT 
				ld.LegType, ld.Payer, ld.Currency, ld.DayCounter, ld.PaymentConvention,
				(SELECT
					(SELECT ln.startDate [@startDate], ln.Notional [data()]
					FROM PortfolioLegNotionals ln WHERE ln.LegDataId =ld.Id
					FOR XML PATH ('Notional'), TYPE),
					CASE WHEN (SELECT COUNT(li.FXresetForeignCurrency) FROM PortfolioLegData li WHERE li.Id =ld.Id) > 0 THEN (SELECT li.FXresetForeignCurrency ForeignCurrency, li.FXresetForeignAmount ForeignAmount, li.FXresetFXIndex FXIndex, li.FXresetFixingDays FixingDays
					FROM PortfolioLegData li WHERE li.Id =ld.Id
					FOR XML PATH ('FXReset'), TYPE) ELSE '' END,
					(SELECT	li.NotionalInitialExchange InitialExchange, li.NotionalAmortizingExchange AmortizingExchange, li.NotionalFinalExchange FinalExchange
					FROM PortfolioLegData li WHERE li.Id =ld.Id
					FOR XML PATH (''), TYPE) Exchanges
				FOR XML PATH (''), TYPE) Notionals,
				(SELECT 
					(SELECT s.StartDate, s.EndDate, s.Tenor, s.Calendar, s.Convention, s.TermConvention, s.RuleName [Rule], ISNULL(s.EndOfMonth,'') EndOfMonth, ISNULL(convert(varchar,s.FirstDate,112),'') FirstDate, ISNULL(convert(varchar,s.LastDate,112),'') LastDate
					FROM PortfolioScheduleDataRules s WHERE s.LegDataId = ld.Id
					FOR XML PATH (''), TYPE) Rules,
					(SELECT s.ScheduleDate [Date]
					FROM PortfolioScheduleDataDates s WHERE s.LegDataId = ld.Id
					FOR XML PATH (''), TYPE) Dates
				FOR XML PATH (''), TYPE) ScheduleData,
				CASE WHEN ld.LegType = 'Fixed' THEN 
				(SELECT 
					(SELECT r.StartDate [@startDate], r.Rate [data()]
					FROM PortfolioFixedLegCPIRates r WHERE r.LegDataId = ld.Id ORDER by SeqId
					FOR XML PATH ('Rate'), TYPE) Rates
				FOR XML PATH (''), TYPE) END FixedLegData,
				CASE WHEN ld.LegType = 'Floating' THEN 
				(SELECT 
					li.FloatingLegFixingDays FixingDays, li.FloatingLegIndexName [Index], li.FloatingLegIsInArrears IsInArrears, li.FloatingLegIsNotResettingXCCY IsNotResettingXCCY,
					(SELECT r.StartDate [@startDate], r.Spread [data()]
					FROM PortfolioFloatingLegSpreads r WHERE r.LegDataId = ld.Id ORDER by SeqId
					FOR XML PATH ('Spread'), TYPE) Spreads,
					(SELECT r.StartDate [@startDate], r.Cap [data()]
					FROM PortfolioFloatingLegCaps r WHERE r.LegDataId = ld.Id ORDER by SeqId
					FOR XML PATH ('Cap'), TYPE) Caps,
					(SELECT r.StartDate [@startDate], r.[Floor] [data()]
					FROM PortfolioFloatingLegFloors r WHERE r.LegDataId = ld.Id ORDER by SeqId
					FOR XML PATH ('Floor'), TYPE) Floors,
					(SELECT r.StartDate [@startDate], r.Gearing [data()]
					FROM PortfolioFloatingLegGearings r WHERE r.LegDataId = ld.Id ORDER by SeqId
					FOR XML PATH ('Gearing'), TYPE) Gearings
				FROM PortfolioLegData li WHERE li.Id = ld.Id
				FOR XML PATH (''), TYPE) END FloatingLegData,
				CASE WHEN ld.LegType = 'CPI' THEN 
				(SELECT 
					li.CPILegIndexName [Index],
					(SELECT r.StartDate [@startDate], r.Rate [data()]
					FROM PortfolioFixedLegCPIRates r WHERE r.LegDataId = ld.Id ORDER by SeqId
					FOR XML PATH ('Rate'), TYPE) Rates,
					li.CPILegBaseCPI BaseCPI, li.CPILegObservationLag ObservationLag, li.CPILegInterpolated Interpolated
				FROM PortfolioLegData li WHERE li.Id = ld.Id
				FOR XML PATH (''), TYPE) END CPILegData,
				CASE WHEN ld.LegType = 'YY' THEN 
				(SELECT
					li.YYLegIndexName [Index], li.YYLegFixingDays FixingDays, li.YYLegObservationLag ObservationLag, li.YYLegInterpolated Interpolated,
					(SELECT r.StartDate [@startDate], r.Rate [data()]
					FROM PortfolioFixedLegCPIRates r WHERE r.LegDataId = ld.Id ORDER by SeqId
					FOR XML PATH ('Rate'), TYPE) Rates
				FROM PortfolioLegData li WHERE li.Id = ld.Id
				FOR XML PATH (''), TYPE) END YYLegData
			FROM PortfolioLegData ld WHERE ld.TradeId = t.id
			FOR XML PATH ('LegData'), TYPE),
			(SELECT ba.IssuerId, ba.CreditCurveId, ba.Notional, ba.Currency
			FROM PortfolioBaskets ba WHERE ba.TradeId = t.id
			FOR XML PATH ('Name'), TYPE) Basket
		FROM PortfolioIndexCreditDefaultSwapData id WHERE id.TradeId = t.id
		FOR XML PATH (''), TYPE) IndexCreditDefaultSwapData,
		(SELECT iod.KnockOut,
			(SELECT iod.OptionDataLongShort LongShort, iod.OptionDataOptionType OptionType, iod.OptionDataStyle Style, iod.OptionDataSettlement Settlement, iod.OptionDataPayOffAtExpiry PayOffAtExpiry,
				(SELECT iod.OptionDataPremiumAmount Amount, iod.OptionDataPremiumCurrency Currency, iod.OptionDataPremiumPayDate [Date]
				FOR XML PATH (''), TYPE) Premium,
				(SELECT ed.ExerciseDate
				FROM PortfolioOptionExercises ed WHERE ed.TradeId = t.id
				FOR XML PATH (''), TYPE) ExerciseDates,
				(SELECT ed.ExerciseFee
				FROM PortfolioOptionExercises ed WHERE ed.TradeId = t.id
				FOR XML PATH (''), TYPE) ExerciseFees,
				(SELECT ed.ExercisePrice
				FROM PortfolioOptionExercises ed WHERE ed.TradeId = t.id
				FOR XML PATH (''), TYPE) ExercisePrices
			FOR XML PATH (''), TYPE) OptionData,
			(SELECT id.CreditCurveId, id.SettlesAccrual, id.PaysAtDefaultTime, id.ProtectionStart, id.UpfrontDate, id.UpfrontFee,
				(SELECT 
					ld.LegType, ld.Payer, ld.Currency, ld.DayCounter, ld.PaymentConvention,
					(SELECT
						(SELECT ln.startDate [@startDate], ln.Notional [data()]
						FROM PortfolioLegNotionals ln WHERE ln.LegDataId =ld.Id
						FOR XML PATH ('Notional'), TYPE),
						CASE WHEN (SELECT COUNT(li.FXresetForeignCurrency) FROM PortfolioLegData li WHERE li.Id =ld.Id) > 0 THEN (SELECT li.FXresetForeignCurrency ForeignCurrency, li.FXresetForeignAmount ForeignAmount, li.FXresetFXIndex FXIndex, li.FXresetFixingDays FixingDays
						FROM PortfolioLegData li WHERE li.Id =ld.Id
						FOR XML PATH ('FXReset'), TYPE) ELSE '' END,
						(SELECT	li.NotionalInitialExchange InitialExchange, li.NotionalAmortizingExchange AmortizingExchange, li.NotionalFinalExchange FinalExchange
						FROM PortfolioLegData li WHERE li.Id =ld.Id
						FOR XML PATH (''), TYPE) Exchanges
					FOR XML PATH (''), TYPE) Notionals,
					(SELECT 
						(SELECT s.StartDate, s.EndDate, s.Tenor, s.Calendar, s.Convention, s.TermConvention, s.RuleName [Rule], ISNULL(s.EndOfMonth,'') EndOfMonth, ISNULL(convert(varchar,s.FirstDate,112),'') FirstDate, ISNULL(convert(varchar,s.LastDate,112),'') LastDate
						FROM PortfolioScheduleDataRules s WHERE s.LegDataId = ld.Id
						FOR XML PATH (''), TYPE) Rules,
						(SELECT s.ScheduleDate [Date]
						FROM PortfolioScheduleDataDates s WHERE s.LegDataId = ld.Id
						FOR XML PATH (''), TYPE) Dates
					FOR XML PATH (''), TYPE) ScheduleData,
					CASE WHEN ld.LegType = 'Fixed' THEN 
					(SELECT 
						(SELECT r.StartDate [@startDate], r.Rate [data()]
						FROM PortfolioFixedLegCPIRates r WHERE r.LegDataId = ld.Id ORDER by SeqId
						FOR XML PATH ('Rate'), TYPE) Rates
					FOR XML PATH (''), TYPE) END FixedLegData,
					CASE WHEN ld.LegType = 'Floating' THEN 
					(SELECT 
						li.FloatingLegFixingDays FixingDays, li.FloatingLegIndexName [Index], li.FloatingLegIsInArrears IsInArrears, li.FloatingLegIsNotResettingXCCY IsNotResettingXCCY,
						(SELECT r.StartDate [@startDate], r.Spread [data()]
						FROM PortfolioFloatingLegSpreads r WHERE r.LegDataId = ld.Id ORDER by SeqId
						FOR XML PATH ('Spread'), TYPE) Spreads,
						(SELECT r.StartDate [@startDate], r.Cap [data()]
						FROM PortfolioFloatingLegCaps r WHERE r.LegDataId = ld.Id ORDER by SeqId
						FOR XML PATH ('Cap'), TYPE) Caps,
						(SELECT r.StartDate [@startDate], r.[Floor] [data()]
						FROM PortfolioFloatingLegFloors r WHERE r.LegDataId = ld.Id ORDER by SeqId
						FOR XML PATH ('Floor'), TYPE) Floors,
						(SELECT r.StartDate [@startDate], r.Gearing [data()]
						FROM PortfolioFloatingLegGearings r WHERE r.LegDataId = ld.Id ORDER by SeqId
						FOR XML PATH ('Gearing'), TYPE) Gearings
					FROM PortfolioLegData li WHERE li.Id = ld.Id
					FOR XML PATH (''), TYPE) END FloatingLegData,
					CASE WHEN ld.LegType = 'CPI' THEN 
					(SELECT 
						li.CPILegIndexName [Index],
						(SELECT r.StartDate [@startDate], r.Rate [data()]
						FROM PortfolioFixedLegCPIRates r WHERE r.LegDataId = ld.Id ORDER by SeqId
						FOR XML PATH ('Rate'), TYPE) Rates,
						li.CPILegBaseCPI BaseCPI, li.CPILegObservationLag ObservationLag, li.CPILegInterpolated Interpolated
					FROM PortfolioLegData li WHERE li.Id = ld.Id
					FOR XML PATH (''), TYPE) END CPILegData,
					CASE WHEN ld.LegType = 'YY' THEN 
					(SELECT
						li.YYLegIndexName [Index], li.YYLegFixingDays FixingDays, li.YYLegObservationLag ObservationLag, li.YYLegInterpolated Interpolated,
						(SELECT r.StartDate [@startDate], r.Rate [data()]
						FROM PortfolioFixedLegCPIRates r WHERE r.LegDataId = ld.Id ORDER by SeqId
						FOR XML PATH ('Rate'), TYPE) Rates
					FROM PortfolioLegData li WHERE li.Id = ld.Id
					FOR XML PATH (''), TYPE) END YYLegData
				FROM PortfolioLegData ld WHERE ld.TradeId = t.id
				FOR XML PATH ('LegData'), TYPE),
				(SELECT ba.IssuerId, ba.CreditCurveId, ba.Notional, ba.Currency
				FROM PortfolioBaskets ba WHERE ba.TradeId = t.id ORDER by SeqId
				FOR XML PATH ('Name'), TYPE) Basket
			FROM PortfolioIndexCreditDefaultSwapOptionSwapData id WHERE id.TradeId = t.id
			FOR XML PATH (''), TYPE) IndexCreditDefaultSwapData
		FROM PortfolioIndexCreditDefaultSwapOptionData iod WHERE iod.TradeId = t.id
		FOR XML PATH (''), TYPE) IndexCreditDefaultSwapOptionData
	FROM PortfolioTrades t INNER JOIN PortfolioTradeGroupingIds pg ON pg.TradeId = t.Id AND pgo.GroupingId = pg.GroupingId
	FOR XML PATH ('Trade'), TYPE)
FOR XML PATH ('Portfolio')) XMLData
FROM PortfolioTradeGroupingIds pgo

GO

