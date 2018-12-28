use ORE;

CREATE TABLE ConventionsZero (
	Id varchar(70) NOT NULL,
	GroupingId varchar(70),
	TenorBased varchar(5) NOT NULL,
	DayCounter varchar(30) NOT NULL,
	Compounding varchar(30),
	CompoundingFrequency varchar(20),
	TenorCalendar varchar(20),
	SpotLag int,
	SpotCalendar varchar(20),
	RollConvention varchar(20),
	EOM varchar(5),
CONSTRAINT PK_ConventionsZero PRIMARY KEY CLUSTERED (
	Id ASC
));
ALTER TABLE ConventionsZero ADD CONSTRAINT FK_ConventionsZero_TenorBased FOREIGN KEY(TenorBased)
REFERENCES TypesBool (value);
ALTER TABLE ConventionsZero ADD CONSTRAINT FK_ConventionsZero_DayCounter FOREIGN KEY(DayCounter)
REFERENCES TypesDayCounter (value);
ALTER TABLE ConventionsZero ADD CONSTRAINT FK_ConventionsZero_Compounding FOREIGN KEY(Compounding)
REFERENCES TypesCompounding (value);
ALTER TABLE ConventionsZero ADD CONSTRAINT FK_ConventionsZero_CompoundingFrequency FOREIGN KEY(CompoundingFrequency)
REFERENCES TypesFrequencyType (value);
ALTER TABLE ConventionsZero ADD CONSTRAINT FK_ConventionsZero_TenorCalendar FOREIGN KEY(TenorCalendar)
REFERENCES TypesCalendar (value);
ALTER TABLE ConventionsZero ADD CONSTRAINT FK_ConventionsZero_SpotCalendar FOREIGN KEY(SpotCalendar)
REFERENCES TypesCalendar (value);
ALTER TABLE ConventionsZero ADD CONSTRAINT FK_ConventionsZero_RollConvention FOREIGN KEY(RollConvention)
REFERENCES TypesBusinessDayConvention (value);
ALTER TABLE ConventionsZero ADD CONSTRAINT FK_ConventionsZero_EOM FOREIGN KEY(EOM)
REFERENCES TypesBool (value);

CREATE TABLE ConventionsCDS (
	Id varchar(70) NOT NULL,
	GroupingId varchar(70),
	SettlementDays int NOT NULL,
	Calendar varchar(20) NOT NULL,
	Frequency varchar(20) NOT NULL,
	PaymentConvention varchar(20) NOT NULL,
	RuleName varchar(20) NOT NULL,
	DayCounter varchar(30) NOT NULL,
	SettlesAccrual varchar(5) NOT NULL,
	PaysAtDefaultTime varchar(5)  NOT NULL,
CONSTRAINT PK_ConventionsCDS PRIMARY KEY CLUSTERED (
	Id ASC
));
ALTER TABLE ConventionsCDS ADD CONSTRAINT FK_ConventionsCDS_Calendar FOREIGN KEY(Calendar)
REFERENCES TypesCalendar (value);
ALTER TABLE ConventionsCDS ADD CONSTRAINT FK_ConventionsCDS_Frequency FOREIGN KEY(Frequency)
REFERENCES TypesFrequencyType (value);
ALTER TABLE ConventionsCDS ADD CONSTRAINT FK_ConventionsCDS_PaymentConvention FOREIGN KEY(PaymentConvention)
REFERENCES TypesBusinessDayConvention (value);
ALTER TABLE ConventionsCDS ADD CONSTRAINT FK_ConventionsCDS_RuleName FOREIGN KEY(RuleName)
REFERENCES TypesDateRule (value);
ALTER TABLE ConventionsCDS ADD CONSTRAINT FK_ConventionsCDS_DayCounter FOREIGN KEY(DayCounter)
REFERENCES TypesDayCounter (value);
ALTER TABLE ConventionsCDS ADD CONSTRAINT FK_ConventionsCDS_SettlesAccrual FOREIGN KEY(SettlesAccrual)
REFERENCES TypesBool (value);
ALTER TABLE ConventionsCDS ADD CONSTRAINT FK_ConventionsCDS_PaysAtDefaultTime FOREIGN KEY(PaysAtDefaultTime)
REFERENCES TypesBool (value);

CREATE TABLE ConventionsDeposit (
	Id varchar(70) NOT NULL,
	GroupingId varchar(70),
	IndexBased varchar(5) NOT NULL,
	IndexName varchar(30),
	Calendar varchar(20),
	Convention varchar(20),
	EOM varchar(5),
	DayCounter varchar(30),
	SettlementDays int,
CONSTRAINT PK_ConventionsDeposit PRIMARY KEY CLUSTERED (
	Id ASC
));
ALTER TABLE ConventionsDeposit ADD CONSTRAINT FK_ConventionsDeposit_IndexBased FOREIGN KEY(IndexBased)
REFERENCES TypesBool (value);
ALTER TABLE ConventionsDeposit ADD CONSTRAINT FK_ConventionsDeposit_IndexName FOREIGN KEY(IndexName)
REFERENCES TypesIndexName (value);
ALTER TABLE ConventionsDeposit ADD CONSTRAINT FK_ConventionsDeposit_Calendar FOREIGN KEY(Calendar)
REFERENCES TypesCalendar (value);
ALTER TABLE ConventionsDeposit ADD CONSTRAINT FK_ConventionsDeposit_Convention FOREIGN KEY(Convention)
REFERENCES TypesBusinessDayConvention (value);
ALTER TABLE ConventionsDeposit ADD CONSTRAINT FK_ConventionsDeposit_EOM FOREIGN KEY(EOM)
REFERENCES TypesBool (value);
ALTER TABLE ConventionsDeposit ADD CONSTRAINT FK_ConventionsDeposit_DayCounter FOREIGN KEY(DayCounter)
REFERENCES TypesDayCounter (value);

CREATE TABLE ConventionsFuture (
	Id varchar(70) NOT NULL,
	GroupingId varchar(70),
	IndexName varchar(30) NOT NULL,
CONSTRAINT PK_ConventionsFuture PRIMARY KEY CLUSTERED (
	Id ASC
));
ALTER TABLE ConventionsFuture ADD CONSTRAINT FK_ConventionsFuture_IndexName FOREIGN KEY(IndexName)
REFERENCES TypesIndexName (value);

CREATE TABLE ConventionsFRA (
	Id varchar(70) NOT NULL,
	GroupingId varchar(70),
	IndexName varchar(30) NOT NULL,
CONSTRAINT PK_ConventionsFRA PRIMARY KEY CLUSTERED (
	Id ASC
));
ALTER TABLE ConventionsFRA ADD CONSTRAINT FK_ConventionsFRA_IndexName FOREIGN KEY(IndexName)
REFERENCES TypesIndexName (value);

CREATE TABLE ConventionsOIS (
	Id varchar(70) NOT NULL,
	GroupingId varchar(70),
	SpotLag int NOT NULL,
	IndexName varchar(30) NOT NULL,
	FixedDayCounter varchar(30) NOT NULL,
	PaymentLag int,
	EOM varchar(5),
	FixedFrequency varchar(20),
	FixedConvention varchar(20),
	FixedPaymentConvention varchar(20),
	RuleName varchar(20),
CONSTRAINT PK_ConventionsOIS PRIMARY KEY CLUSTERED (
	Id ASC
));
ALTER TABLE ConventionsOIS ADD CONSTRAINT FK_ConventionsOIS_IndexName FOREIGN KEY(IndexName)
REFERENCES TypesIndexName (value);
ALTER TABLE ConventionsOIS ADD CONSTRAINT FK_ConventionsOIS_FixedDayCounter FOREIGN KEY(FixedDayCounter)
REFERENCES TypesDayCounter (value);
ALTER TABLE ConventionsOIS ADD CONSTRAINT FK_ConventionsOIS_EOM FOREIGN KEY(EOM)
REFERENCES TypesBool (value);
ALTER TABLE ConventionsOIS ADD CONSTRAINT FK_ConventionsOIS_FixedFrequency FOREIGN KEY(FixedFrequency)
REFERENCES TypesFrequencyType (value);
ALTER TABLE ConventionsOIS ADD CONSTRAINT FK_ConventionsOIS_FixedConvention FOREIGN KEY(FixedConvention)
REFERENCES TypesBusinessDayConvention (value);
ALTER TABLE ConventionsOIS ADD CONSTRAINT FK_ConventionsOIS_FixedPaymentConvention FOREIGN KEY(FixedPaymentConvention)
REFERENCES TypesBusinessDayConvention (value);
ALTER TABLE ConventionsOIS ADD CONSTRAINT FK_ConventionsOIS_RuleName FOREIGN KEY(RuleName)
REFERENCES TypesDateRule (value);

CREATE TABLE ConventionsSwap (
	Id varchar(70) NOT NULL,
	GroupingId varchar(70),
	FixedCalendar varchar(20) NOT NULL,
	FixedFrequency varchar(20) NOT NULL,
	FixedConvention varchar(20) NOT NULL,
	FixedDayCounter varchar(30) NOT NULL,
	IndexName varchar(30) NOT NULL,
	FloatFrequency varchar(20),
	SubPeriodsCouponType varchar(20),
CONSTRAINT PK_ConventionsSwap PRIMARY KEY CLUSTERED (
	Id ASC
));
ALTER TABLE ConventionsSwap ADD CONSTRAINT FK_ConventionsSwap_FixedCalendar FOREIGN KEY(FixedCalendar)
REFERENCES TypesCalendar (value);
ALTER TABLE ConventionsSwap ADD CONSTRAINT FK_ConventionsSwap_FixedFrequency FOREIGN KEY(FixedFrequency)
REFERENCES TypesFrequencyType (value);
ALTER TABLE ConventionsSwap ADD CONSTRAINT FK_ConventionsSwap_FixedConvention FOREIGN KEY(FixedConvention)
REFERENCES TypesBusinessDayConvention (value);
ALTER TABLE ConventionsSwap ADD CONSTRAINT FK_ConventionsSwap_FixedDayCounter FOREIGN KEY(FixedDayCounter)
REFERENCES TypesDayCounter (value);
ALTER TABLE ConventionsSwap ADD CONSTRAINT FK_ConventionsSwap_IndexName FOREIGN KEY(IndexName)
REFERENCES TypesIndexName (value);
ALTER TABLE ConventionsSwap ADD CONSTRAINT FK_ConventionsSwap_FloatFrequency FOREIGN KEY(FloatFrequency)
REFERENCES TypesFrequencyType (value);
ALTER TABLE ConventionsSwap ADD CONSTRAINT FK_ConventionsSwap_SubPeriodsCouponType FOREIGN KEY(SubPeriodsCouponType)
REFERENCES TypesSubPeriodsCouponType (value);

CREATE TABLE ConventionsAverageOIS (
	Id varchar(70) NOT NULL,
	GroupingId varchar(70),
	SpotLag int NOT NULL,
	FixedTenor varchar(8) NOT NULL,
	FixedDayCounter varchar(30) NOT NULL,
	FixedCalendar varchar(20) NOT NULL,
	FixedConvention varchar(20) NOT NULL,
	FixedPaymentConvention varchar(20) NOT NULL,
	IndexName varchar(30) NOT NULL,
	OnTenor varchar(8) NOT NULL,
	RateCutoff varchar(8) NOT NULL,
CONSTRAINT PK_ConventionsAverageOIS PRIMARY KEY CLUSTERED (
	Id ASC
));
ALTER TABLE ConventionsAverageOIS ADD CONSTRAINT FK_ConventionsAverageOIS_FixedDayCounter FOREIGN KEY(FixedDayCounter)
REFERENCES TypesDayCounter (value);
ALTER TABLE ConventionsAverageOIS ADD CONSTRAINT FK_ConventionsAverageOIS_FixedCalendar FOREIGN KEY(FixedCalendar)
REFERENCES TypesCalendar (value);
ALTER TABLE ConventionsAverageOIS ADD CONSTRAINT FK_ConventionsAverageOIS_FixedConvention FOREIGN KEY(FixedConvention)
REFERENCES TypesBusinessDayConvention (value);
ALTER TABLE ConventionsAverageOIS ADD CONSTRAINT FK_ConventionsAverageOIS_FixedPaymentConvention FOREIGN KEY(FixedPaymentConvention)
REFERENCES TypesBusinessDayConvention (value);
ALTER TABLE ConventionsAverageOIS ADD CONSTRAINT FK_ConventionsAverageOIS_IndexName FOREIGN KEY(IndexName)
REFERENCES TypesIndexName (value);


CREATE TABLE ConventionsTenorBasisSwap (
	Id varchar(70) NOT NULL,
	GroupingId varchar(70),
	LongIndex varchar(30) NOT NULL,
	ShortIndex varchar(30) NOT NULL,
	ShortPayTenor varchar(8),
	SpreadOnShort varchar(5),
	IncludeSpread varchar(5),
	SubPeriodsCouponType varchar(20),
CONSTRAINT PK_ConventionsTenorBasisSwap PRIMARY KEY CLUSTERED (
	Id ASC
));
ALTER TABLE ConventionsTenorBasisSwap ADD CONSTRAINT FK_ConventionsTenorBasisSwap_SpreadOnShort FOREIGN KEY(SpreadOnShort)
REFERENCES TypesBool (value);
ALTER TABLE ConventionsTenorBasisSwap ADD CONSTRAINT FK_ConventionsTenorBasisSwap_IncludeSpread FOREIGN KEY(IncludeSpread)
REFERENCES TypesBool (value);
ALTER TABLE ConventionsTenorBasisSwap ADD CONSTRAINT FK_ConventionsTenorBasisSwap_LongIndex FOREIGN KEY(LongIndex)
REFERENCES TypesIndexName (value);
ALTER TABLE ConventionsTenorBasisSwap ADD CONSTRAINT FK_ConventionsTenorBasisSwap_ShortIndex FOREIGN KEY(ShortIndex)
REFERENCES TypesIndexName (value);
ALTER TABLE ConventionsTenorBasisSwap ADD CONSTRAINT FK_ConventionsTenorBasisSwap_SubPeriodsCouponType FOREIGN KEY(SubPeriodsCouponType)
REFERENCES TypesSubPeriodsCouponType (value);

CREATE TABLE ConventionsTenorBasisTwoSwap (
	Id varchar(70) NOT NULL,
	GroupingId varchar(70),
	Calendar varchar(20) NOT NULL,
	LongFixedFrequency varchar(20) NOT NULL,
	LongFixedConvention varchar(20) NOT NULL,
	LongFixedDayCounter varchar(30) NOT NULL,
	LongIndex varchar(30) NOT NULL,
	ShortFixedFrequency varchar(20) NOT NULL,
	ShortFixedConvention varchar(20) NOT NULL,
	ShortFixedDayCounter varchar(30) NOT NULL,
	ShortIndex varchar(30) NOT NULL,
	LongMinusShort varchar(5),
CONSTRAINT PK_ConventionsTenorBasisTwoSwap PRIMARY KEY CLUSTERED (
	Id ASC
));
ALTER TABLE ConventionsTenorBasisTwoSwap ADD CONSTRAINT FK_ConventionsTenorBasisTwoSwap_Calendar FOREIGN KEY(Calendar)
REFERENCES TypesCalendar (value);
ALTER TABLE ConventionsTenorBasisTwoSwap ADD CONSTRAINT FK_ConventionsTenorBasisTwoSwap_LongFixedFrequency FOREIGN KEY(LongFixedFrequency)
REFERENCES TypesFrequencyType (value);
ALTER TABLE ConventionsTenorBasisTwoSwap ADD CONSTRAINT FK_ConventionsTenorBasisTwoSwap_LongFixedConvention FOREIGN KEY(LongFixedConvention)
REFERENCES TypesBusinessDayConvention (value);
ALTER TABLE ConventionsTenorBasisTwoSwap ADD CONSTRAINT FK_ConventionsTenorBasisTwoSwap_LongFixedDayCounter FOREIGN KEY(LongFixedDayCounter)
REFERENCES TypesDayCounter (value);
ALTER TABLE ConventionsTenorBasisTwoSwap ADD CONSTRAINT FK_ConventionsTenorBasisTwoSwap_LongIndex FOREIGN KEY(LongIndex)
REFERENCES TypesIndexName (value);
ALTER TABLE ConventionsTenorBasisTwoSwap ADD CONSTRAINT FK_ConventionsTenorBasisTwoSwap_ShortFixedFrequency FOREIGN KEY(ShortFixedFrequency)
REFERENCES TypesFrequencyType (value);
ALTER TABLE ConventionsTenorBasisTwoSwap ADD CONSTRAINT FK_ConventionsTenorBasisTwoSwap_ShortFixedConvention FOREIGN KEY(ShortFixedConvention)
REFERENCES TypesBusinessDayConvention (value);
ALTER TABLE ConventionsTenorBasisTwoSwap ADD CONSTRAINT FK_ConventionsTenorBasisTwoSwap_ShortFixedDayCounter FOREIGN KEY(ShortFixedDayCounter)
REFERENCES TypesDayCounter (value);
ALTER TABLE ConventionsTenorBasisTwoSwap ADD CONSTRAINT FK_ConventionsTenorBasisTwoSwap_ShortIndex FOREIGN KEY(ShortIndex)
REFERENCES TypesIndexName (value);
ALTER TABLE ConventionsTenorBasisTwoSwap ADD CONSTRAINT FK_ConventionsTenorBasisTwoSwap_LongMinusShort FOREIGN KEY(LongMinusShort)
REFERENCES TypesBool (value);

CREATE TABLE ConventionsFX (
	Id varchar(70) NOT NULL,
	GroupingId varchar(70),
	SpotDays int NOT NULL,
	SourceCurrency varchar(7) NOT NULL,
	TargetCurrency varchar(7) NOT NULL,
	PointsFactor Decimal(18,4) NOT NULL,
	AdvanceCalendar varchar(20),
	SpotRelative varchar(5),
	AdditionalSettleCalendar varchar(20),
CONSTRAINT PK_ConventionsFX PRIMARY KEY CLUSTERED (
	Id ASC
));
ALTER TABLE ConventionsFX ADD CONSTRAINT FK_ConventionsFX_SourceCurrency FOREIGN KEY(SourceCurrency)
REFERENCES TypesCurrencyCode (value);
ALTER TABLE ConventionsFX ADD CONSTRAINT FK_ConventionsFX_TargetCurrency FOREIGN KEY(TargetCurrency)
REFERENCES TypesCurrencyCode (value);
ALTER TABLE ConventionsFX ADD CONSTRAINT FK_ConventionsFX_AdvanceCalendar FOREIGN KEY(AdvanceCalendar)
REFERENCES TypesCalendar (value);
ALTER TABLE ConventionsFX ADD CONSTRAINT FK_ConventionsFX_SpotRelative FOREIGN KEY(SpotRelative)
REFERENCES TypesBool (value);
ALTER TABLE ConventionsFX ADD CONSTRAINT FK_ConventionsFX_AdditionalSettleCalendar FOREIGN KEY(AdditionalSettleCalendar)
REFERENCES TypesCalendar (value);

CREATE TABLE ConventionsCrossCurrencyBasis (
	Id varchar(70) NOT NULL,
	GroupingId varchar(70),
	SettlementDays int NOT NULL,
	SettlementCalendar varchar(20),
	RollConvention varchar(20) NOT NULL,
	FlatIndex varchar(30) NOT NULL,
	SpreadIndex varchar(30) NOT NULL,
	EOM varchar(5),
CONSTRAINT PK_ConventionsCrossCurrencyBasis PRIMARY KEY CLUSTERED (
	Id ASC
));
ALTER TABLE ConventionsCrossCurrencyBasis ADD CONSTRAINT FK_ConventionsCrossCurrencyBasis_SettlementCalendar FOREIGN KEY(SettlementCalendar)
REFERENCES TypesCalendar (value);
ALTER TABLE ConventionsCrossCurrencyBasis ADD CONSTRAINT FK_ConventionsCrossCurrencyBasis_RollConvention FOREIGN KEY(RollConvention)
REFERENCES TypesBusinessDayConvention (value);
ALTER TABLE ConventionsCrossCurrencyBasis ADD CONSTRAINT FK_ConventionsCrossCurrencyBasis_FlatIndex FOREIGN KEY(FlatIndex)
REFERENCES TypesIndexName (value);
ALTER TABLE ConventionsCrossCurrencyBasis ADD CONSTRAINT FK_ConventionsCrossCurrencyBasis_SpreadIndex FOREIGN KEY(SpreadIndex)
REFERENCES TypesIndexName (value);
ALTER TABLE ConventionsCrossCurrencyBasis ADD CONSTRAINT FK_ConventionsCrossCurrencyBasis_EOM FOREIGN KEY(EOM)
REFERENCES TypesBool (value);

CREATE TABLE ConventionsSwapIndex (
	Id varchar(70) NOT NULL,
	GroupingId varchar(70),
	Conventions varchar(70) NOT NULL,
CONSTRAINT PK_ConventionsSwapIndex PRIMARY KEY CLUSTERED (
	Id ASC
));
ALTER TABLE ConventionsSwapIndex ADD CONSTRAINT FK_ConventionsSwapIndex_Conventions FOREIGN KEY(Conventions)
REFERENCES ConventionsSwap (Id);

CREATE TABLE ConventionsInflationSwap (
	Id varchar(70) NOT NULL,
	GroupingId varchar(70),
	FixCalendar varchar(20) NOT NULL,
	FixConvention varchar(20) NOT NULL,
	DayCounter varchar(30) NOT NULL,
	IndexName varchar(30) NOT NULL,
	Interpolated varchar(5) NOT NULL,
	ObservationLag varchar(8) NOT NULL,
	AdjustInflationObservationDates varchar(5) NOT NULL,
	InflationCalendar varchar(20) NOT NULL,
	InflationConvention varchar(20) NOT NULL,
CONSTRAINT PK_ConventionsInflationSwap PRIMARY KEY CLUSTERED (
	Id ASC
));
ALTER TABLE ConventionsInflationSwap ADD CONSTRAINT FK_ConventionsInflationSwap_FixCalendar FOREIGN KEY(FixCalendar)
REFERENCES TypesCalendar (value);
ALTER TABLE ConventionsInflationSwap ADD CONSTRAINT FK_ConventionsInflationSwap_FixConvention FOREIGN KEY(FixConvention)
REFERENCES TypesBusinessDayConvention (value);
ALTER TABLE ConventionsInflationSwap ADD CONSTRAINT FK_ConventionsInflationSwap_DayCounter FOREIGN KEY(DayCounter)
REFERENCES TypesDayCounter (value);
ALTER TABLE ConventionsInflationSwap ADD CONSTRAINT FK_ConventionsInflationSwap_IndexName FOREIGN KEY(IndexName)
REFERENCES TypesIndexName (value);
ALTER TABLE ConventionsInflationSwap ADD CONSTRAINT FK_ConventionsInflationSwap_Interpolated FOREIGN KEY(Interpolated)
REFERENCES TypesBool (value);
ALTER TABLE ConventionsInflationSwap ADD CONSTRAINT FK_ConventionsInflationSwap_AdjustInflationObservationDates FOREIGN KEY(AdjustInflationObservationDates)
REFERENCES TypesBool (value);
ALTER TABLE ConventionsInflationSwap ADD CONSTRAINT FK_ConventionsInflationSwap_InflationCalendar FOREIGN KEY(InflationCalendar)
REFERENCES TypesCalendar (value);
