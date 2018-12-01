use ORE;

CREATE TABLE PortfolioTrades (
	Id varchar(180) not null,
	TradeType varchar(30),
	EnvelopeCounterParty varchar(30),
	EnvelopeNettingSetId varchar(30),
	AddFieldsAdditionalId varchar(70)
CONSTRAINT PK_PortfolioTrades PRIMARY KEY CLUSTERED
(
	Id ASC
));
ALTER TABLE PortfolioTrades ADD CONSTRAINT FK_PortfolioTrades_TradeType FOREIGN KEY(TradeType)
REFERENCES TypesOreTradeType (value);
ALTER TABLE PortfolioTrades ADD CONSTRAINT FK_PortfolioTrades_EnvelopeCounterParty FOREIGN KEY(EnvelopeCounterParty)
REFERENCES TypesParties (value);
ALTER TABLE PortfolioTrades ADD CONSTRAINT FK_PortfolioTrades_EnvelopeNettingSetId FOREIGN KEY(EnvelopeNettingSetId)
REFERENCES NettingSet (NettingSetId);


CREATE TABLE PortfolioTradeGroupingIds (
	TradeId varchar(180) not null,
	GroupingId varchar(70) not null,
CONSTRAINT PK_PortfolioTradeGroupingIds PRIMARY KEY CLUSTERED 
(
	TradeId ASC,
	GroupingId ASC
));


CREATE TABLE PortfolioTradeActions (
	Id int not null,
	TradeId varchar(180) not null,
	Type varchar(20),
	Owner varchar(20),
CONSTRAINT PK_PortfolioTradeActions PRIMARY KEY CLUSTERED 
(
	Id ASC
));
ALTER TABLE PortfolioTradeActions ADD CONSTRAINT FK_PortfolioTradeActions_TradeId FOREIGN KEY(TradeId)
REFERENCES PortfolioTrades (Id);
ALTER TABLE PortfolioTradeActions ADD CONSTRAINT FK_PortfolioTradeActions_Type FOREIGN KEY(Type)
REFERENCES TypesTradeActionType (value);
ALTER TABLE PortfolioTradeActions ADD CONSTRAINT FK_PortfolioTradeActions_Owner FOREIGN KEY(Owner)
REFERENCES TypesTradeActionOwner (value);


-- relates to LegData (LegDataId) or TradeActions (TradeActionId)
CREATE TABLE PortfolioScheduleDataRules (
	Id int not null,
	TradeActionId int,
	LegDataId int,
	StartDate date,
	EndDate date,
	Tenor varchar(8),
	Calendar varchar(20),
	Convention varchar(20),
	TermConvention varchar(20),
	RuleName varchar(20),
	EndOfMonth varchar(5),
	FirstDate date,
	LastDate date,
CONSTRAINT PK_PortfolioScheduleDataRules PRIMARY KEY CLUSTERED 
(
	Id ASC
));
-- ALTER TABLE PortfolioScheduleDataRules ADD CONSTRAINT FK_PortfolioScheduleDataRules_Calendar FOREIGN KEY(Calendar)
-- REFERENCES TypesCalendar (value);
ALTER TABLE PortfolioScheduleDataRules ADD CONSTRAINT FK_PortfolioScheduleDataRules_Convention FOREIGN KEY(Convention)
REFERENCES TypesBusinessDayConvention (value);
ALTER TABLE PortfolioScheduleDataRules ADD CONSTRAINT FK_PortfolioScheduleDataRules_TermConvention FOREIGN KEY(TermConvention)
REFERENCES TypesBusinessDayConvention (value);
ALTER TABLE PortfolioScheduleDataRules ADD CONSTRAINT FK_PortfolioScheduleDataRules_RuleName FOREIGN KEY(RuleName)
REFERENCES TypesDateRule (value);
ALTER TABLE PortfolioScheduleDataRules ADD CONSTRAINT FK_PortfolioScheduleDataRules_EndOfMonth FOREIGN KEY(EndOfMonth)
REFERENCES TypesBool (value);


CREATE TABLE PortfolioScheduleDataDates (
	Id int not null,
	TradeActionId int,
	LegDataId int,
	Calendar varchar(20),
	ScheduleDate date,
CONSTRAINT PK_PortfolioScheduleDataDates PRIMARY KEY CLUSTERED 
(
	Id ASC,
	ScheduleDate ASC
));
-- ALTER TABLE PortfolioScheduleDataDates ADD CONSTRAINT FK_PortfolioScheduleDataDates_Calendar FOREIGN KEY(Calendar)
-- REFERENCES TypesCalendar (value);


CREATE TABLE PortfolioSwapData (
	TradeId varchar(180) not null,
CONSTRAINT PK_PortfolioSwapData PRIMARY KEY CLUSTERED 
(
	TradeId ASC
));
ALTER TABLE PortfolioSwapData ADD CONSTRAINT FK_PortfolioSwapData_TradeId FOREIGN KEY(TradeId)
REFERENCES PortfolioTrades (Id);


CREATE TABLE PortfolioCDOData (
	TradeId varchar(180) not null,
	ProtectionStart date,
	UpfrontDate date,
	UpfrontFee decimal(18,3),
	AttachmentPoint decimal(18,3),
	DetachmentPoint decimal(18,3),
CONSTRAINT PK_PortfolioCDOData PRIMARY KEY CLUSTERED 
(
	TradeId ASC
));
ALTER TABLE PortfolioCDOData ADD CONSTRAINT FK_PortfolioCDOData_TradeId FOREIGN KEY(TradeId)
REFERENCES PortfolioTrades (Id);


CREATE TABLE PortfolioCreditDefaultSwapData (
	TradeId varchar(180) not null,
	IssuerId varchar(30) not null,
	CreditCurveId varchar(20) not null,
	SettlesAccrual varchar(5),
	PaysAtDefaultTime varchar(5),
	ProtectionStart date,
	UpfrontDate date,
	UpfrontFee decimal(18,3),
CONSTRAINT PK_PortfolioCreditDefaultSwapData PRIMARY KEY CLUSTERED 
(
	TradeId ASC
));
ALTER TABLE PortfolioCreditDefaultSwapData ADD CONSTRAINT FK_PortfolioCreditDefaultSwapData_TradeId FOREIGN KEY(TradeId)
REFERENCES PortfolioTrades (Id);
ALTER TABLE PortfolioCreditDefaultSwapData ADD CONSTRAINT FK_PortfolioCreditDefaultSwapData_IssuerId FOREIGN KEY(IssuerId)
REFERENCES TypesParties (value);
--  ALTER TABLE PortfolioCreditDefaultSwapData ADD CONSTRAINT FK_PortfolioCreditDefaultSwapData_CreditCurveId FOREIGN KEY(CreditCurveId)
--  REFERENCES CurveConfigurationDefaultCurves (CurveId);
ALTER TABLE PortfolioCreditDefaultSwapData ADD CONSTRAINT FK_PortfolioCreditDefaultSwapData_SettlesAccrual FOREIGN KEY(SettlesAccrual)
REFERENCES TypesBool (value);
ALTER TABLE PortfolioCreditDefaultSwapData ADD CONSTRAINT FK_PortfolioCreditDefaultSwapData_PaysAtDefaultTime FOREIGN KEY(PaysAtDefaultTime)
REFERENCES TypesBool (value);


CREATE TABLE PortfolioIndexCreditDefaultSwapData (
	TradeId varchar(180) not null,
	CreditCurveId varchar(20) not null,
	SettlesAccrual varchar(5),
	PaysAtDefaultTime varchar(5),
	ProtectionStart date,
	UpfrontDate date,
	UpfrontFee decimal(18,3),
CONSTRAINT PK_PortfolioIndexCreditDefaultSwapData PRIMARY KEY CLUSTERED 
(
	TradeId ASC
));
ALTER TABLE PortfolioIndexCreditDefaultSwapData ADD CONSTRAINT FK_PortfolioIndexCreditDefaultSwapData_TradeId FOREIGN KEY(TradeId)
REFERENCES PortfolioTrades (Id);
--  ALTER TABLE PortfolioIndexCreditDefaultSwapData ADD CONSTRAINT FK_PortfolioIndexCreditDefaultSwapData_CreditCurveId FOREIGN KEY(CreditCurveId)
--  REFERENCES CurveConfigurationDefaultCurves (CurveId);
ALTER TABLE PortfolioIndexCreditDefaultSwapData ADD CONSTRAINT FK_PortfolioIndexCreditDefaultSwapData_SettlesAccrual FOREIGN KEY(SettlesAccrual)
REFERENCES TypesBool (value);
ALTER TABLE PortfolioIndexCreditDefaultSwapData ADD CONSTRAINT FK_PortfolioIndexCreditDefaultSwapData_PaysAtDefaultTime FOREIGN KEY(PaysAtDefaultTime)
REFERENCES TypesBool (value);


CREATE TABLE PortfolioIndexCreditDefaultSwapOptionData (
	TradeId varchar(180) not null,
	KnockOut varchar(5),
	OptionDataLongShort varchar(5),
	OptionDataOptionType varchar(10),
	OptionDataStyle varchar(10),
	OptionDataSettlement varchar(10),
	OptionDataPayOffAtExpiry varchar(5),
	OptionDataPremiumAmount decimal(18,3),
	OptionDataPremiumCurrency varchar(7),
	OptionDataPremiumPayDate date,
CONSTRAINT PK_PortfolioIndexCreditDefaultSwapOptionData PRIMARY KEY CLUSTERED 
(
	TradeId ASC
));
ALTER TABLE PortfolioIndexCreditDefaultSwapOptionData ADD CONSTRAINT FK_PortfolioIndexCreditDefaultSwapOptionData_TradeId FOREIGN KEY(TradeId)
REFERENCES PortfolioTrades (Id);
ALTER TABLE PortfolioIndexCreditDefaultSwapOptionData ADD CONSTRAINT FK_PortfolioIndexCreditDefaultSwapOptionData_KnockOut FOREIGN KEY(KnockOut)
REFERENCES TypesBool (value);
ALTER TABLE PortfolioIndexCreditDefaultSwapOptionData ADD CONSTRAINT FK_PortfolioIndexCreditDefaultSwapOptionData_OptionDataLongShort FOREIGN KEY(OptionDataLongShort)
REFERENCES TypesLongShort (value);
ALTER TABLE PortfolioIndexCreditDefaultSwapOptionData ADD CONSTRAINT FK_PortfolioIndexCreditDefaultSwapOptionData_OptionDataOptType FOREIGN KEY(OptionDataOptionType)
REFERENCES TypesOptionType (value);
ALTER TABLE PortfolioIndexCreditDefaultSwapOptionData ADD CONSTRAINT FK_PortfolioIndexCreditDefaultSwapOptionData_OptionDataStyle FOREIGN KEY(OptionDataStyle)
REFERENCES TypesOptionStyle (value);
ALTER TABLE PortfolioIndexCreditDefaultSwapOptionData ADD CONSTRAINT FK_PortfolioIndexCreditDefaultSwapOptionData_OptionDataSettl FOREIGN KEY(OptionDataSettlement)
REFERENCES TypesOptionSettlement (value);
ALTER TABLE PortfolioIndexCreditDefaultSwapOptionData ADD CONSTRAINT FK_PortfolioIndexCreditDefaultSwapOptionData_OptionDataPayOAtExp FOREIGN KEY(OptionDataPayOffAtExpiry)
REFERENCES TypesBool (value);
ALTER TABLE PortfolioIndexCreditDefaultSwapOptionData ADD CONSTRAINT FK_PortfolioIndexCreditDefaultSwapOptionData_OptionDataPremCurr FOREIGN KEY(OptionDataPremiumCurrency)
REFERENCES TypesCurrencyCode (value);


--  refers to PortfolioIndexCreditDefaultSwapOptionData as part of a IndexCreditDefaultSwapOption
CREATE TABLE PortfolioIndexCreditDefaultSwapOptionSwapData (
	TradeId varchar(180) not null,
	CreditCurveId varchar(20) not null,
	SettlesAccrual varchar(5),
	PaysAtDefaultTime varchar(5),
	ProtectionStart date,
	UpfrontDate date,
	UpfrontFee decimal(18,3),
CONSTRAINT PK_PortfolioIndexCreditDefaultSwapOptionSwapData PRIMARY KEY CLUSTERED 
(
	TradeId ASC
));
ALTER TABLE PortfolioIndexCreditDefaultSwapOptionSwapData ADD CONSTRAINT FK_PortfolioIndexCreditDefaultSwapOptionSwapData_TradeId FOREIGN KEY(TradeId)
REFERENCES PortfolioIndexCreditDefaultSwapOptionData (TradeId);
--  ALTER TABLE PortfolioIndexCreditDefaultSwapData ADD CONSTRAINT FK_PortfolioIndexCreditDefaultSwapData_CreditCurveId FOREIGN KEY(CreditCurveId)
--  REFERENCES CurveConfigurationDefaultCurves (CurveId);
ALTER TABLE PortfolioIndexCreditDefaultSwapOptionSwapData ADD CONSTRAINT FK_PortfolioIndexCreditDefaultSwapOptionSwapData_SettlesAccrual FOREIGN KEY(SettlesAccrual)
REFERENCES TypesBool (value);
ALTER TABLE PortfolioIndexCreditDefaultSwapOptionSwapData ADD CONSTRAINT FK_PortfolioIndexCreditDefaultSwapOptionSwapData_PaysAtDefTime FOREIGN KEY(PaysAtDefaultTime)
REFERENCES TypesBool (value);


CREATE TABLE PortfolioBaskets (
	TradeId varchar(180) not null,
	SeqId int not null,
	IssuerId varchar(30),
	CreditCurveId varchar(20),
	Notional decimal(18,3),
	Currency varchar(7),
CONSTRAINT PK_PortfolioBaskets PRIMARY KEY CLUSTERED 
(
	TradeId ASC,
	SeqId ASC
));
ALTER TABLE PortfolioBaskets ADD CONSTRAINT FK_PortfolioBaskets_TradeId FOREIGN KEY(TradeId)
REFERENCES PortfolioTrades (Id);
ALTER TABLE PortfolioBaskets ADD CONSTRAINT FK_PortfolioBaskets_IssuerId FOREIGN KEY(IssuerId)
REFERENCES TypesParties (value);
ALTER TABLE PortfolioBaskets ADD CONSTRAINT FK_PortfolioBaskets_Currency FOREIGN KEY(Currency)
REFERENCES TypesCurrencyCode (value);


CREATE TABLE PortfolioSwaptionData (
	TradeId varchar(180) not null,
	OptionDataLongShort varchar(5),
	OptionDataOptionType varchar(10),
	OptionDataStyle varchar(10),
	OptionDataSettlement varchar(10),
	OptionDataPayOffAtExpiry varchar(5),
	OptionDataPremiumAmount decimal(18,3),
	OptionDataPremiumCurrency varchar(7),
	OptionDataPremiumPayDate date,
CONSTRAINT PK_PortfolioSwaptionData PRIMARY KEY CLUSTERED 
(
	TradeId ASC
));
ALTER TABLE PortfolioSwaptionData ADD CONSTRAINT FK_PortfolioSwaptionData_TradeId FOREIGN KEY(TradeId)
REFERENCES PortfolioTrades (Id);
ALTER TABLE PortfolioSwaptionData ADD CONSTRAINT FK_PortfolioSwaptionData_OptionDataLongShort FOREIGN KEY(OptionDataLongShort)
REFERENCES TypesLongShort (value);
ALTER TABLE PortfolioSwaptionData ADD CONSTRAINT FK_PortfolioSwaptionData_OptionDataOptionType FOREIGN KEY(OptionDataOptionType)
REFERENCES TypesOptionType (value);
ALTER TABLE PortfolioSwaptionData ADD CONSTRAINT FK_PortfolioSwaptionData_OptionDataStyle FOREIGN KEY(OptionDataStyle)
REFERENCES TypesOptionStyle (value);
ALTER TABLE PortfolioSwaptionData ADD CONSTRAINT FK_PortfolioSwaptionData_OptionDataSettlement FOREIGN KEY(OptionDataSettlement)
REFERENCES TypesOptionSettlement (value);
ALTER TABLE PortfolioSwaptionData ADD CONSTRAINT FK_PortfolioSwaptionData_OptionDataPayOffAtExpiry FOREIGN KEY(OptionDataPayOffAtExpiry)
REFERENCES TypesBool (value);
ALTER TABLE PortfolioSwaptionData ADD CONSTRAINT FK_PortfolioSwaptionData_OptionDataPremiumCurrency FOREIGN KEY(OptionDataPremiumCurrency)
REFERENCES TypesCurrencyCode (value);


CREATE TABLE PortfolioFxOptionData (
	TradeId varchar(180) not null,
	BoughtCurrency varchar(7),
	BoughtAmount decimal(18,3),
	SoldCurrency varchar(7),
	SoldAmount decimal(18,3),
	OptionDataLongShort varchar(5),
	OptionDataOptionType varchar(10),
	OptionDataStyle varchar(10),
	OptionDataSettlement varchar(10),
	OptionDataPayOffAtExpiry varchar(5),
	OptionDataPremiumAmount decimal(18,3),
	OptionDataPremiumCurrency varchar(7),
	OptionDataPremiumPayDate date,
CONSTRAINT PK_PortfolioFxOptionData PRIMARY KEY CLUSTERED 
(
	TradeId ASC
));
ALTER TABLE PortfolioFxOptionData ADD CONSTRAINT FK_PortfolioFxOptionData_TradeId FOREIGN KEY(TradeId)
REFERENCES PortfolioTrades (Id);
ALTER TABLE PortfolioFxOptionData ADD CONSTRAINT FK_PortfolioFxOptionData_BoughtCurrency FOREIGN KEY(BoughtCurrency)
REFERENCES TypesCurrencyCode (value);
ALTER TABLE PortfolioFxOptionData ADD CONSTRAINT FK_PortfolioFxOptionData_SoldCurrency FOREIGN KEY(SoldCurrency)
REFERENCES TypesCurrencyCode (value);
ALTER TABLE PortfolioFxOptionData ADD CONSTRAINT FK_PortfolioFxOptionData_OptionDataLongShort FOREIGN KEY(OptionDataLongShort)
REFERENCES TypesLongShort (value);
ALTER TABLE PortfolioFxOptionData ADD CONSTRAINT FK_PortfolioFxOptionData_OptionDataOptionType FOREIGN KEY(OptionDataOptionType)
REFERENCES TypesOptionType (value);
ALTER TABLE PortfolioFxOptionData ADD CONSTRAINT FK_PortfolioFxOptionData_OptionDataStyle FOREIGN KEY(OptionDataStyle)
REFERENCES TypesOptionStyle (value);
ALTER TABLE PortfolioFxOptionData ADD CONSTRAINT FK_PortfolioFxOptionData_OptionDataSettlement FOREIGN KEY(OptionDataSettlement)
REFERENCES TypesOptionSettlement (value);
ALTER TABLE PortfolioFxOptionData ADD CONSTRAINT FK_PortfolioFxOptionData_OptionDataPayOffAtExpiry FOREIGN KEY(OptionDataPayOffAtExpiry)
REFERENCES TypesBool (value);
ALTER TABLE PortfolioFxOptionData ADD CONSTRAINT FK_PortfolioFxOptionData_OptionDataPremiumCurrency FOREIGN KEY(OptionDataPremiumCurrency)
REFERENCES TypesCurrencyCode (value);


CREATE TABLE PortfolioEquityOptionData (
	TradeId varchar(180) not null,
	Name varchar(20),
	Currency varchar(7),
	Strike decimal(18,3),
	Quantity decimal(18,3),
	OptionDataLongShort varchar(5),
	OptionDataOptionType varchar(10),
	OptionDataStyle varchar(10),
	OptionDataSettlement varchar(10),
	OptionDataPayOffAtExpiry varchar(5),
	OptionDataPremiumAmount decimal(18,3),
	OptionDataPremiumCurrency varchar(7),
	OptionDataPremiumPayDate date,
CONSTRAINT PK_PortfolioEquityOptionData PRIMARY KEY CLUSTERED 
(
	TradeId ASC
));
ALTER TABLE PortfolioEquityOptionData ADD CONSTRAINT FK_PortfolioEquityOptionData_TradeId FOREIGN KEY(TradeId)
REFERENCES PortfolioTrades (Id);
ALTER TABLE PortfolioEquityOptionData ADD CONSTRAINT FK_PortfolioEquityOptionData_Name FOREIGN KEY(Name)
REFERENCES CurveConfigurationEquityCurves (CurveId);
ALTER TABLE PortfolioEquityOptionData ADD CONSTRAINT FK_PortfolioEquityOptionData_Currency FOREIGN KEY(Currency)
REFERENCES TypesCurrencyCode (value);
ALTER TABLE PortfolioEquityOptionData ADD CONSTRAINT FK_PortfolioEquityOptionData_OptionDataPremiumCurrency FOREIGN KEY(OptionDataPremiumCurrency)
REFERENCES TypesCurrencyCode (value);
ALTER TABLE PortfolioEquityOptionData ADD CONSTRAINT FK_PortfolioEquityOptionData_OptionDataLongShort FOREIGN KEY(OptionDataLongShort)
REFERENCES TypesLongShort (value);
ALTER TABLE PortfolioEquityOptionData ADD CONSTRAINT FK_PortfolioEquityOptionData_OptionDataOptionType FOREIGN KEY(OptionDataOptionType)
REFERENCES TypesOptionType (value);
ALTER TABLE PortfolioEquityOptionData ADD CONSTRAINT FK_PortfolioEquityOptionData_OptionDataStyle FOREIGN KEY(OptionDataStyle)
REFERENCES TypesOptionStyle (value);
ALTER TABLE PortfolioEquityOptionData ADD CONSTRAINT FK_PortfolioEquityOptionData_OptionDataSettlement FOREIGN KEY(OptionDataSettlement)
REFERENCES TypesOptionSettlement (value);
ALTER TABLE PortfolioEquityOptionData ADD CONSTRAINT FK_PortfolioEquityOptionData_OptionDataPayOffAtExpiry FOREIGN KEY(OptionDataPayOffAtExpiry)
REFERENCES TypesBool (value);


CREATE TABLE PortfolioOptionExercises (
	TradeId varchar(180) not null,
	ExerciseDate date not null,
	ExerciseFee decimal(18,3),
	ExercisePrice decimal(18,3),
CONSTRAINT PK_PortfolioOptionExerciseDates PRIMARY KEY CLUSTERED 
(
	TradeId ASC,
	ExerciseDate ASC
));
ALTER TABLE PortfolioOptionExercises ADD CONSTRAINT FK_PortfolioOptionExercises_TradeId FOREIGN KEY(TradeId)
REFERENCES PortfolioTrades (Id);


CREATE TABLE PortfolioBondData (
	TradeId varchar(180) not null,
	IssuerId varchar(30) not null,
	CreditCurveId varchar(30) not null,
	SecurityId varchar(20) not null,
	ReferenceCurveId varchar(20) not null,
	SettlementDays int not null,
	Calendar varchar(20) not null,
	IssueDate date not null,
CONSTRAINT PK_PortfolioBondData PRIMARY KEY CLUSTERED 
(
	TradeId ASC
));
ALTER TABLE PortfolioBondData ADD CONSTRAINT FK_PortfolioBondData_TradeId FOREIGN KEY(TradeId)
REFERENCES PortfolioTrades (Id);
ALTER TABLE PortfolioBondData ADD CONSTRAINT FK_PortfolioBondData_IssuerId FOREIGN KEY(IssuerId)
REFERENCES TypesParties (value);
ALTER TABLE PortfolioBondData ADD CONSTRAINT FK_PortfolioBondData_CreditCurveId FOREIGN KEY(CreditCurveId)
REFERENCES TypesParties (value);
ALTER TABLE PortfolioBondData ADD CONSTRAINT FK_PortfolioBondData_SecurityId FOREIGN KEY(SecurityId)
REFERENCES CurveConfigurationSecurities (CurveId);
-- ALTER TABLE PortfolioBondData ADD CONSTRAINT FK_PortfolioBondData_Calendar FOREIGN KEY(Calendar)
-- REFERENCES TypesCalendar (value);


--  relates to SwapData, SwaptionData, BondData. ALSO INCLUDES LegData_capfloor
CREATE TABLE PortfolioLegData (
	Id int not null,
	TradeId varchar(180) not null,
	Payer varchar(5),
	LegType varchar(20),
	Currency varchar(7),
	PaymentConvention varchar(20),
	DayCounter varchar(30),
	NotionalInitialExchange varchar(5),
	NotionalFinalExchange varchar(5),
	NotionalAmortizingExchange varchar(5),
	FXResetForeignCurrency varchar(7),
	FXResetForeignAmount decimal(18,3),
	FXResetFXIndex varchar(30),
	FXResetFixingDays int,
	FloatingLegIndexName varchar(30),
	FloatingLegIsInArrears varchar(5),
	FloatingLegFixingDays int,
	FloatingLegIsAveraged varchar(5),
	FloatingLegIsNotResettingXCCY varchar(5),
	FloatingLegNakedOption varchar(5),
	CPILegIndexName varchar(30),
	CPILegBaseCPI decimal(18,10),
	CPILegObservationLag varchar(5),
	CPILegInterpolated varchar(5),
	CPILegSubtractInflationNotional varchar(5),
	YYLegIndexName varchar(30),
	YYLegFixingDays int,
	YYLegObservationLag varchar(5),
	YYLegInterpolated varchar(5),
CONSTRAINT PK_PortfolioLegData PRIMARY KEY CLUSTERED 
(
	Id ASC
));
ALTER TABLE PortfolioLegData ADD CONSTRAINT FK_PortfolioLegData_TradeId FOREIGN KEY(TradeId)
REFERENCES PortfolioTrades (Id);
ALTER TABLE PortfolioLegData ADD CONSTRAINT FK_PortfolioLegData_Payer FOREIGN KEY(Payer)
REFERENCES TypesBool (value);
ALTER TABLE PortfolioLegData ADD CONSTRAINT FK_PortfolioLegData_LegType FOREIGN KEY(LegType)
REFERENCES TypesLegType (value);
ALTER TABLE PortfolioLegData ADD CONSTRAINT FK_PortfolioLegData_Currency FOREIGN KEY(Currency)
REFERENCES TypesCurrencyCode (value);
ALTER TABLE PortfolioLegData ADD CONSTRAINT FK_PortfolioLegData_PaymentConvention FOREIGN KEY(PaymentConvention)
REFERENCES TypesBusinessDayConvention (value);
ALTER TABLE PortfolioLegData ADD CONSTRAINT FK_PortfolioLegData_DayCounter FOREIGN KEY(DayCounter)
REFERENCES TypesDayCounter (value);
ALTER TABLE PortfolioLegData ADD CONSTRAINT FK_PortfolioLegData_NotionalInitialExchange FOREIGN KEY(NotionalInitialExchange)
REFERENCES TypesBool (value);
ALTER TABLE PortfolioLegData ADD CONSTRAINT FK_PortfolioLegData_NotionalFinalExchange FOREIGN KEY(NotionalFinalExchange)
REFERENCES TypesBool (value);
ALTER TABLE PortfolioLegData ADD CONSTRAINT FK_PortfolioLegData_NotionalAmortizingExchange FOREIGN KEY(NotionalAmortizingExchange)
REFERENCES TypesBool (value);
ALTER TABLE PortfolioLegData ADD CONSTRAINT FK_PortfolioLegData_FXResetForeignCurrency FOREIGN KEY(FXResetForeignCurrency)
REFERENCES TypesCurrencyCode (value);
ALTER TABLE PortfolioLegData ADD CONSTRAINT FK_PortfolioLegData_FXResetFXIndex FOREIGN KEY(FXResetFXIndex)
REFERENCES TypesIndexName (value);
ALTER TABLE PortfolioLegData ADD CONSTRAINT FK_PortfolioLegData_FloatingLegIndexName FOREIGN KEY(FloatingLegIndexName)
REFERENCES TypesIndexName (value);
ALTER TABLE PortfolioLegData ADD CONSTRAINT FK_PortfolioLegData_FloatingLegIsInArrears FOREIGN KEY(FloatingLegIsInArrears)
REFERENCES TypesBool (value);
ALTER TABLE PortfolioLegData ADD CONSTRAINT FK_PortfolioLegData_FloatingLegIsAveraged FOREIGN KEY(FloatingLegIsAveraged)
REFERENCES TypesBool (value);
ALTER TABLE PortfolioLegData ADD CONSTRAINT FK_PortfolioLegData_FloatingLegIsNotResettingXCCY FOREIGN KEY(FloatingLegIsNotResettingXCCY)
REFERENCES TypesBool (value);
ALTER TABLE PortfolioLegData ADD CONSTRAINT FK_PortfolioLegData_FloatingLegNakedOption FOREIGN KEY(FloatingLegNakedOption)
REFERENCES TypesBool (value);
ALTER TABLE PortfolioLegData ADD CONSTRAINT FK_PortfolioLegData_CPILegIndexName FOREIGN KEY(CPILegIndexName)
REFERENCES TypesIndexName (value);
ALTER TABLE PortfolioLegData ADD CONSTRAINT FK_PortfolioLegData_CPILegInterpolated FOREIGN KEY(CPILegInterpolated)
REFERENCES TypesBool (value);
ALTER TABLE PortfolioLegData ADD CONSTRAINT FK_PortfolioLegData_CPILegSubtractInflationNotional FOREIGN KEY(CPILegSubtractInflationNotional)
REFERENCES TypesBool (value);
ALTER TABLE PortfolioLegData ADD CONSTRAINT FK_PortfolioLegData_YYLegIndexName FOREIGN KEY(YYLegIndexName)
REFERENCES TypesIndexName (value);
ALTER TABLE PortfolioLegData ADD CONSTRAINT FK_PortfolioLegData_YYLegInterpolated FOREIGN KEY(YYLegInterpolated)
REFERENCES TypesBool (value);


CREATE TABLE PortfolioLegAmortizations (
	LegDataId int not null,
	SeqId int not null,
	Type varchar(30) not null,
	Value decimal(18,3) not null,
	StartDate date,
	EndDate date,
	Frequency varchar(5),
	Underflow varchar(5),
CONSTRAINT PK_PortfolioLegAmortizations PRIMARY KEY CLUSTERED 
(
	LegDataId ASC,
	SeqId ASC
));
ALTER TABLE PortfolioLegAmortizations ADD CONSTRAINT FK_PortfolioLegAmortizations_Type FOREIGN KEY(Type)
REFERENCES TypesAmortizationType (value);
ALTER TABLE PortfolioLegAmortizations ADD CONSTRAINT FK_PortfolioLegAmortizations_Underflow FOREIGN KEY(Underflow)
REFERENCES TypesBool (value);


CREATE TABLE PortfolioLegNotionals (
	LegDataId int not null,
	SeqId int not null,
	Notional decimal(18,3) not null,
	startDate date,
CONSTRAINT PK_PortfolioLegNotionals PRIMARY KEY CLUSTERED 
(
	LegDataId ASC,
	SeqId ASC
));
ALTER TABLE PortfolioLegNotionals ADD CONSTRAINT FK_PortfolioLegNotionals_LegDataId FOREIGN KEY(LegDataId)
REFERENCES PortfolioLegData (Id);


CREATE TABLE PortfolioFixedLegCPIRates (
	LegDataId int not null,
	SeqId int not null,
	Rate decimal(18,10) not null,
	StartDate date,
CONSTRAINT PK_PortfolioFixedLegCPIRates PRIMARY KEY CLUSTERED 
(
	LegDataId ASC,
	SeqId ASC
));
ALTER TABLE PortfolioFixedLegCPIRates ADD CONSTRAINT FK_PortfolioFixedLegCPIRates_LegDataId FOREIGN KEY(LegDataId)
REFERENCES PortfolioLegData (Id);


CREATE TABLE PortfolioFloatingLegSpreads (
	LegDataId int not null,
	SeqId int not null,
	Spread decimal(18,10) not null,
	StartDate date,
CONSTRAINT PK_PortfolioFloatingLegSpreads PRIMARY KEY CLUSTERED 
(
	LegDataId ASC,
	SeqId ASC
));
ALTER TABLE PortfolioFloatingLegSpreads ADD CONSTRAINT FK_PortfolioFloatingLegSpreads_LegDataId FOREIGN KEY(LegDataId)
REFERENCES PortfolioLegData (Id);


CREATE TABLE PortfolioFloatingLegCaps (
	LegDataId int not null,
	SeqId int not null,
	Cap decimal(18,10) not null,
	StartDate date,
CONSTRAINT PK_PortfolioFloatingLegCaps PRIMARY KEY CLUSTERED 
(
	LegDataId ASC,
	SeqId ASC
));
ALTER TABLE PortfolioFloatingLegCaps ADD CONSTRAINT FK_PortfolioFloatingLegCaps_LegDataId FOREIGN KEY(LegDataId)
REFERENCES PortfolioLegData (Id);


CREATE TABLE PortfolioFloatingLegFloors (
	LegDataId int not null,
	SeqId int not null,
	Floor decimal(18,10) not null,
	StartDate date,
CONSTRAINT PK_PortfolioFloatingLegFloors PRIMARY KEY CLUSTERED 
(
	LegDataId ASC,
	SeqId ASC
));
ALTER TABLE PortfolioFloatingLegFloors ADD CONSTRAINT FK_PortfolioFloatingLegFloors_LegDataId FOREIGN KEY(LegDataId)
REFERENCES PortfolioLegData (Id);


CREATE TABLE PortfolioFloatingLegGearings (
	LegDataId int not null,
	SeqId int not null,
	Gearing decimal(18,10) not null,
	StartDate date,
CONSTRAINT PK_PortfolioFloatingLegGearings PRIMARY KEY CLUSTERED 
(
	LegDataId ASC,
	SeqId ASC
));
ALTER TABLE PortfolioFloatingLegGearings ADD CONSTRAINT FK_PortfolioFloatingLegGearings_LegDataId FOREIGN KEY(LegDataId)
REFERENCES PortfolioLegData (Id);


CREATE TABLE PortfolioForwardRateAgreementData (
	TradeId varchar(180) not null,
	StartDate date,
	EndDate date,
	Currency varchar(7),
	IndexName varchar(30),
	LongShort varchar(5),
	Strike decimal(18,10),
	Notional decimal(18,3),
CONSTRAINT PK_PortfolioForwardRateAgreementData PRIMARY KEY CLUSTERED 
(
	TradeId ASC
));
ALTER TABLE PortfolioForwardRateAgreementData ADD CONSTRAINT FK_PortfolioForwardRateAgreementData_TradeId FOREIGN KEY(TradeId)
REFERENCES PortfolioTrades (Id);
ALTER TABLE PortfolioForwardRateAgreementData ADD CONSTRAINT FK_PortfolioForwardRateAgreementData_Currency FOREIGN KEY(Currency)
REFERENCES TypesCurrencyCode (value);
ALTER TABLE PortfolioForwardRateAgreementData ADD CONSTRAINT FK_PortfolioForwardRateAgreementData_LongShort FOREIGN KEY(LongShort)
REFERENCES TypesLongShort (value);
ALTER TABLE PortfolioForwardRateAgreementData ADD CONSTRAINT FK_PortfolioForwardRateAgreementData_IndexName FOREIGN KEY(IndexName)
REFERENCES TypesIndexName (value);


CREATE TABLE PortfolioFxForwardData (
	TradeId varchar(180) not null,
	ValueDate date,
	BoughtCurrency varchar(7),
	BoughtAmount decimal(18,3),
	SoldCurrency varchar(7),
	SoldAmount decimal(18,3),
CONSTRAINT PK_PortfolioFxForwardData PRIMARY KEY CLUSTERED 
(
	TradeId ASC
));
ALTER TABLE PortfolioFxForwardData ADD CONSTRAINT FK_PortfolioFxForwardData_TradeId FOREIGN KEY(TradeId)
REFERENCES PortfolioTrades (Id);
ALTER TABLE PortfolioFxForwardData ADD CONSTRAINT FK_PortfolioFxForwardData_BoughtCurrency FOREIGN KEY(BoughtCurrency)
REFERENCES TypesCurrencyCode (value);
ALTER TABLE PortfolioFxForwardData ADD CONSTRAINT FK_PortfolioFxForwardData_SoldCurrency FOREIGN KEY(SoldCurrency)
REFERENCES TypesCurrencyCode (value);


CREATE TABLE PortfolioCapFloorData (
	TradeId varchar(180) not null,
	LongShort varchar(7),
CONSTRAINT PK_PortfolioCapFloorData PRIMARY KEY CLUSTERED 
(
	TradeId ASC
));
ALTER TABLE PortfolioCapFloorData ADD CONSTRAINT FK_PortfolioCapFloorData_TradeId FOREIGN KEY(TradeId)
REFERENCES PortfolioTrades (Id);


CREATE TABLE PortfolioCapRates (
	TradeId varchar(180) not null,
	SeqId int not null,
	Rate decimal(18,10) not null,
	StartDate date,
CONSTRAINT PK_PortfolioCapRates PRIMARY KEY CLUSTERED 
(
	TradeId ASC,
	SeqId ASC
));
ALTER TABLE PortfolioCapRates ADD CONSTRAINT FK_PortfolioCapRates_TradeId FOREIGN KEY(TradeId)
REFERENCES PortfolioTrades (Id);


CREATE TABLE PortfolioFloorRates (
	TradeId varchar(180) not null,
	SeqId int not null,
	Rate decimal(18,10) not null,
	StartDate date,
CONSTRAINT PK_PortfolioFloorRates PRIMARY KEY CLUSTERED 
(
	TradeId ASC,
	SeqId ASC
));
ALTER TABLE PortfolioFloorRates ADD CONSTRAINT FK_PortfolioFloorRates_TradeId FOREIGN KEY(TradeId)
REFERENCES PortfolioTrades (Id);


CREATE TABLE PortfolioEquityForwardData (
	TradeId varchar(180) not null,
	LongShort varchar(5),
	Maturity date,
	Name varchar(20),
	Currency varchar(7),
	Strike decimal(18,10),
	Quantity decimal(18,3),
CONSTRAINT PK_PortfolioEquityForwardData PRIMARY KEY CLUSTERED 
(
	TradeId ASC
));
ALTER TABLE PortfolioEquityForwardData ADD CONSTRAINT FK_PortfolioEquityForwardData_TradeId FOREIGN KEY(TradeId)
REFERENCES PortfolioTrades (Id);
ALTER TABLE PortfolioEquityForwardData ADD CONSTRAINT FK_PortfolioEquityForwardData_LongShort FOREIGN KEY(LongShort)
REFERENCES TypesLongShort (value);
ALTER TABLE PortfolioEquityForwardData ADD CONSTRAINT FK_PortfolioEquityForwardData_Name FOREIGN KEY(Name)
REFERENCES CurveConfigurationEquityCurves (CurveId);
ALTER TABLE PortfolioEquityForwardData ADD CONSTRAINT FK_PortfolioEquityForwardData_Currency FOREIGN KEY(Currency)
REFERENCES TypesCurrencyCode (value);
