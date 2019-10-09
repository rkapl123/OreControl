use ORE;

CREATE TABLE CurveConfigurationFXSpots (
	CurveId varchar(6) NOT NULL,
	GroupingId varchar(70),
	CurveDescription varchar(70),
CONSTRAINT PK_CurveConfigurationFXSpots PRIMARY KEY CLUSTERED (
	CurveId ASC
));


CREATE TABLE CurveConfigurationSwaptionVolatilities (
	CurveId varchar(20) NOT NULL,
	GroupingId varchar(70),
	CurveDescription varchar(70),
	Dimension varchar(5),
	VolatilityType varchar(20),
	Extrapolation varchar(10),
	DayCounter varchar(30),
	Calendar varchar(20),
	BusinessDayConvention varchar(20),
	OptionTenors varchar(70),
	SwapTenors varchar(70),
	ShortSwapIndexBase varchar(30),
	SwapIndexBase varchar(30),
	SmileOptionTenors varchar(70),
	SmileSwapTenors varchar(70),
	SmileSpreads varchar(70),
CONSTRAINT PK_CurveConfigurationSwaptionVolatilities PRIMARY KEY CLUSTERED (
	CurveId ASC
));
ALTER TABLE CurveConfigurationSwaptionVolatilities ADD CONSTRAINT FK_CurveConfigurationSwaptionVolatilities_Dimension FOREIGN KEY(Dimension)
REFERENCES TypesDimensionType (value);
ALTER TABLE CurveConfigurationSwaptionVolatilities ADD CONSTRAINT FK_CurveConfigurationSwaptionVolatilities_VolatilityType FOREIGN KEY(VolatilityType)
REFERENCES TypesVolatilityType (value);
ALTER TABLE CurveConfigurationSwaptionVolatilities ADD CONSTRAINT FK_CurveConfigurationSwaptionVolatilities_Extrapolation FOREIGN KEY(Extrapolation)
REFERENCES TypesExtrapolationType (value);
ALTER TABLE CurveConfigurationSwaptionVolatilities ADD CONSTRAINT FK_CurveConfigurationSwaptionVolatilities_DayCounter FOREIGN KEY(DayCounter)
REFERENCES TypesDayCounter (value);
ALTER TABLE CurveConfigurationSwaptionVolatilities ADD CONSTRAINT FK_CurveConfigurationSwaptionVolatilities_Calendar FOREIGN KEY(Calendar)
REFERENCES TypesCalendar (value);
ALTER TABLE CurveConfigurationSwaptionVolatilities ADD CONSTRAINT FK_CurveConfigurationSwaptionVolatilities_BusinessDayConvention FOREIGN KEY(BusinessDayConvention)
REFERENCES TypesBusinessDayConvention (value);
ALTER TABLE CurveConfigurationSwaptionVolatilities ADD CONSTRAINT FK_CurveConfigurationSwaptionVolatilities_ShortSwapIndexBase FOREIGN KEY(ShortSwapIndexBase)
REFERENCES TypesIndexName (value);
ALTER TABLE CurveConfigurationSwaptionVolatilities ADD CONSTRAINT FK_CurveConfigurationSwaptionVolatilities_SwapIndexBase FOREIGN KEY(SwapIndexBase)
REFERENCES TypesIndexName (value);


CREATE TABLE CurveConfigurationCapFloorVolatilities (
	CurveId varchar(20) NOT NULL,
	GroupingId varchar(70),
	CurveDescription varchar(70),
	VolatilityType varchar(20),
	Extrapolation varchar(10),
	IncludeAtm varchar(5),
	DayCounter varchar(30),
	Calendar varchar(20),
	BusinessDayConvention varchar(20),
	Tenors varchar(70),
	Strikes varchar(130),
	IborIndex varchar(30),
	DiscountCurve varchar(70),
CONSTRAINT PK_CurveConfigurationCapFloorVolatilities PRIMARY KEY CLUSTERED (
	CurveId ASC
));
ALTER TABLE CurveConfigurationCapFloorVolatilities ADD CONSTRAINT FK_CurveConfigurationCapFloorVolatilities_Type FOREIGN KEY(VolatilityType)
REFERENCES TypesVolatilityType (value);
ALTER TABLE CurveConfigurationCapFloorVolatilities ADD CONSTRAINT FK_CurveConfigurationCapFloorVolatilities_Extrapolation FOREIGN KEY(Extrapolation)
REFERENCES TypesExtrapolationType (value);
ALTER TABLE CurveConfigurationCapFloorVolatilities ADD CONSTRAINT FK_CurveConfigurationCapFloorVolatilities_IncludeAtm FOREIGN KEY(IncludeAtm)
REFERENCES TypesBool (value);
ALTER TABLE CurveConfigurationCapFloorVolatilities ADD CONSTRAINT FK_CurveConfigurationCapFloorVolatilities_DayCounter FOREIGN KEY(DayCounter)
REFERENCES TypesDayCounter (value);
-- ALTER TABLE CurveConfigurationCapFloorVolatilities ADD CONSTRAINT FK_CurveConfigurationCapFloorVolatilities_Calendar FOREIGN KEY(Calendar)
-- REFERENCES TypesCalendar (value);
ALTER TABLE CurveConfigurationCapFloorVolatilities ADD CONSTRAINT FK_CurveConfigurationCapFloorVolatilities_BusinessDayConvention FOREIGN KEY(BusinessDayConvention)
REFERENCES TypesBusinessDayConvention (value);
ALTER TABLE CurveConfigurationCapFloorVolatilities ADD CONSTRAINT FK_CurveConfigurationCapFloorVolatilities_IborIndex FOREIGN KEY(IborIndex)
REFERENCES TypesIndexName (value);
ALTER TABLE CurveConfigurationCapFloorVolatilities ADD CONSTRAINT FK_CurveConfigurationCapFloorVolatilities_DiscountCurve FOREIGN KEY(DiscountCurve)
REFERENCES TodaysMarketCurveSpecs (id);


CREATE TABLE CurveConfigurationYieldCurves (
	CurveId varchar(20) NOT NULL,
	GroupingId varchar(70),
	CurveDescription varchar(70),
	Currency varchar(7),
	DiscountCurve varchar(70),
	InterpolationVariable varchar(20),
	InterpolationMethod varchar(20),
	YieldCurveDayCounter varchar(30),
	Tolerance decimal(18,14),
	Extrapolation varchar(5),
CONSTRAINT PK_CurveConfigurationYieldCurves PRIMARY KEY CLUSTERED (
	CurveId ASC
));
ALTER TABLE CurveConfigurationYieldCurves ADD CONSTRAINT FK_CurveConfigurationYieldCurves_Currency FOREIGN KEY(Currency)
REFERENCES TypesCurrencyCode (value);
ALTER TABLE CurveConfigurationYieldCurves ADD CONSTRAINT FK_CurveConfigurationYieldCurves_InterpolationVariable FOREIGN KEY(InterpolationVariable)
REFERENCES TypesInterpolationVariableType (value);
ALTER TABLE CurveConfigurationYieldCurves ADD CONSTRAINT FK_CurveConfigurationYieldCurves_InterpolationMethod FOREIGN KEY(InterpolationMethod)
REFERENCES TypesInterpolationMethodType (value);
ALTER TABLE CurveConfigurationYieldCurves ADD CONSTRAINT FK_CurveConfigurationYieldCurves_YieldCurveDayCounter FOREIGN KEY(YieldCurveDayCounter)
REFERENCES TypesDayCounter (value);
ALTER TABLE CurveConfigurationYieldCurves ADD CONSTRAINT FK_CurveConfigurationYieldCurves_Extrapolation FOREIGN KEY(Extrapolation)
REFERENCES TypesBool (value);
ALTER TABLE CurveConfigurationYieldCurves ADD CONSTRAINT FK_CurveConfigurationYieldCurves_DiscountCurve FOREIGN KEY(DiscountCurve)
REFERENCES TodaysMarketCurveSpecs (id);

CREATE TABLE CurveConfigurationDefaultCurves (
	CurveId varchar(30) NOT NULL,
	GroupingId varchar(70),
	CurveDescription varchar(70),
	Currency varchar(7),
	Type varchar(20),
	DiscountCurve varchar(70),
	DayCounter varchar(30),
	RecoveryRate varchar(70),
	Conventions varchar(70),
	BenchmarkCurve varchar(70),
	SourceCurve varchar(70),
	Pillars varchar(70),
	SpotLag int,
	Calendar varchar(20),
	Extrapolation varchar(5),
CONSTRAINT PK_CurveConfigurationDefaultCurves PRIMARY KEY CLUSTERED (
	CurveId ASC
));
ALTER TABLE CurveConfigurationDefaultCurves ADD CONSTRAINT FK_CurveConfigurationDefaultCurves_Currency FOREIGN KEY(Currency)
REFERENCES TypesCurrencyCode (value);
ALTER TABLE CurveConfigurationDefaultCurves ADD CONSTRAINT FK_CurveConfigurationDefaultCurves_Type FOREIGN KEY(Type)
REFERENCES TypesDefaultCurveType (value);
ALTER TABLE CurveConfigurationDefaultCurves ADD CONSTRAINT FK_CurveConfigurationDefaultCurves_DiscountCurve FOREIGN KEY(DiscountCurve)
REFERENCES TodaysMarketCurveSpecs (id);
ALTER TABLE CurveConfigurationDefaultCurves ADD CONSTRAINT FK_CurveConfigurationDefaultCurves_DayCounter FOREIGN KEY(DayCounter)
REFERENCES TypesDayCounter (value);
ALTER TABLE CurveConfigurationDefaultCurves ADD CONSTRAINT FK_CurveConfigurationDefaultCurves_Conventions FOREIGN KEY(Conventions)
REFERENCES ConventionsCDS (Id);
ALTER TABLE CurveConfigurationDefaultCurves ADD CONSTRAINT FK_CurveConfigurationDefaultCurves_BenchmarkCurve FOREIGN KEY(BenchmarkCurve)
REFERENCES TodaysMarketCurveSpecs (id);
ALTER TABLE CurveConfigurationDefaultCurves ADD CONSTRAINT FK_CurveConfigurationDefaultCurves_SourceCurve FOREIGN KEY(SourceCurve)
REFERENCES TodaysMarketCurveSpecs (id);
-- ALTER TABLE CurveConfigurationDefaultCurves ADD CONSTRAINT FK_CurveConfigurationDefaultCurves_Calendar FOREIGN KEY(Calendar)
-- REFERENCES TypesCalendar (value);
ALTER TABLE CurveConfigurationDefaultCurves ADD CONSTRAINT FK_CurveConfigurationDefaultCurves_Extrapolation FOREIGN KEY(Extrapolation)
REFERENCES TypesBool (value);


CREATE TABLE CurveConfigurationFXVolatilities (
	CurveId varchar(20) NOT NULL,
	GroupingId varchar(70),
	CurveDescription varchar(70),
	Dimension varchar(5),
	Expiries varchar(70),
	FXSpotID varchar(70),
	FXForeignCurveID varchar(70),
	FXDomesticCurveID varchar(70),
CONSTRAINT PK_CurveConfigurationFXVolatilities PRIMARY KEY CLUSTERED (
	CurveId ASC
));
ALTER TABLE CurveConfigurationFXVolatilities ADD CONSTRAINT FK_CurveConfigurationFXVolatilities_Dimension FOREIGN KEY(Dimension)
REFERENCES TypesDimensionType (value);
ALTER TABLE CurveConfigurationFXVolatilities ADD CONSTRAINT FK_CurveConfigurationFXVolatilities_FXSpotID FOREIGN KEY(FXSpotID)
REFERENCES TodaysMarketCurveSpecs (id);
ALTER TABLE CurveConfigurationFXVolatilities ADD CONSTRAINT FK_CurveConfigurationFXVolatilities_FXForeignCurveID FOREIGN KEY(FXForeignCurveID)
REFERENCES TodaysMarketCurveSpecs (id);
ALTER TABLE CurveConfigurationFXVolatilities ADD CONSTRAINT FK_CurveConfigurationFXVolatilities_FXDomesticCurveID FOREIGN KEY(FXDomesticCurveID)
REFERENCES TodaysMarketCurveSpecs (id);


CREATE TABLE CurveConfigurationCDSVolatilities (
	CurveId varchar(20) NOT NULL,
	GroupingId varchar(70),
	CurveDescription varchar(70),
	Expiries varchar(70),
CONSTRAINT PK_CurveConfigurationCDSVolatilities PRIMARY KEY CLUSTERED (
	CurveId ASC
));


CREATE TABLE CurveConfigurationInflationCurves (
	CurveId varchar(20) NOT NULL,
	GroupingId varchar(70),
	CurveDescription varchar(70),
	NominalTermStructure varchar(70) NOT NULL,
	Type varchar(2) NOT NULL,
	Conventions varchar(70),
	Extrapolation varchar(5),
	Calendar varchar(20),
	DayCounter varchar(30),
	Lag varchar(5) NOT NULL,
	Frequency varchar(20) NOT NULL,
	BaseRate decimal(9,6),
	Tolerance decimal(18,14),
	SeasonalityBaseDate datetime,
	SeasonalityFrequency varchar(20),
CONSTRAINT PK_CurveConfigurationInflationCurves PRIMARY KEY CLUSTERED (
	CurveId ASC
));
ALTER TABLE CurveConfigurationInflationCurves ADD CONSTRAINT FK_CurveConfigurationInflationCurves_NominalTermStructure FOREIGN KEY(NominalTermStructure)
REFERENCES TodaysMarketCurveSpecs (id);
ALTER TABLE CurveConfigurationInflationCurves ADD CONSTRAINT FK_CurveConfigurationInflationCurves_Type FOREIGN KEY(Type)
REFERENCES TypesInflationType (value);
ALTER TABLE CurveConfigurationInflationCurves ADD CONSTRAINT FK_CurveConfigurationInflationCurves_Conventions FOREIGN KEY(Conventions)
REFERENCES ConventionsInflationSwap (Id);
ALTER TABLE CurveConfigurationInflationCurves ADD CONSTRAINT FK_CurveConfigurationInflationCurves_Extrapolation FOREIGN KEY(Extrapolation)
REFERENCES TypesBool (value);
-- ALTER TABLE CurveConfigurationInflationCurves ADD CONSTRAINT FK_CurveConfigurationInflationCurves_Calendar FOREIGN KEY(Calendar)
-- REFERENCES TypesCalendar (value);
ALTER TABLE CurveConfigurationInflationCurves ADD CONSTRAINT FK_CurveConfigurationInflationCurves_DayCounter FOREIGN KEY(DayCounter)
REFERENCES TypesDayCounter (value);
ALTER TABLE CurveConfigurationInflationCurves ADD CONSTRAINT FK_CurveConfigurationInflationCurves_Frequency FOREIGN KEY(Frequency)
REFERENCES TypesFrequencyType (value);
ALTER TABLE CurveConfigurationInflationCurves ADD CONSTRAINT FK_CurveConfigurationInflationCurves_SeasonalityFrequency FOREIGN KEY(SeasonalityFrequency)
REFERENCES TypesFrequencyType (value);


CREATE TABLE CurveConfigurationSeasonalityFactors (
	CurveId varchar(20) NOT NULL,
	Factor  varchar(70) NOT NULL,
CONSTRAINT PK_CurveConfigurationSeasonalityFactors PRIMARY KEY CLUSTERED (
	CurveId ASC,
	Factor ASC
));


CREATE TABLE CurveConfigurationInflationCapFloorPriceSurfaces (
	CurveId varchar(20) NOT NULL,
	GroupingId varchar(70),
	CurveDescription varchar(70) NOT NULL,
	Type varchar(2) NOT NULL,
	StartRate decimal(9,6) NOT NULL,
	ObservationLag varchar(5) NOT NULL,
	Calendar varchar(20) NOT NULL,
	BusinessDayConvention varchar(20) NOT NULL,
	DayCounter varchar(30) NOT NULL,
	IndexName varchar(30) NOT NULL,
	IndexCurve varchar(70) NOT NULL,
	IndexInterpolated varchar(5) NOT NULL,
	YieldTermStructure varchar(70) NOT NULL,
	CapStrikes varchar(70) DEFAULT '' NOT NULL,
	FloorStrikes varchar(70) NOT NULL,
	Maturities varchar(70) NOT NULL,
CONSTRAINT PK_CurveConfigurationInflationCapFloorPriceSurfaces PRIMARY KEY CLUSTERED (
	CurveId ASC
));
ALTER TABLE CurveConfigurationInflationCapFloorPriceSurfaces ADD CONSTRAINT FK_CurveConfigurationInflationCapFloorPriceSurfaces_Type FOREIGN KEY(Type)
REFERENCES TypesInflationType (value);
-- ALTER TABLE CurveConfigurationInflationCapFloorPriceSurfaces ADD CONSTRAINT FK_CurveConfigurationInflationCapFloorPriceSurfaces_Calendar FOREIGN KEY(Calendar)
-- REFERENCES TypesCalendar (value);
ALTER TABLE CurveConfigurationInflationCapFloorPriceSurfaces ADD CONSTRAINT FK_CurveConfigurationInflationCapFloorPriceSurfaces_BusDayConv FOREIGN KEY(BusinessDayConvention)
REFERENCES TypesBusinessDayConvention (value);
ALTER TABLE CurveConfigurationInflationCapFloorPriceSurfaces ADD CONSTRAINT FK_CurveConfigurationInflationCapFloorPriceSurfaces_DayCounter FOREIGN KEY(DayCounter)
REFERENCES TypesDayCounter (value);
ALTER TABLE CurveConfigurationInflationCapFloorPriceSurfaces ADD CONSTRAINT FK_CurveConfigurationInflationCapFloorPriceSurfaces_IndexName FOREIGN KEY(IndexName)
REFERENCES TypesIndexName (value);
ALTER TABLE CurveConfigurationInflationCapFloorPriceSurfaces ADD CONSTRAINT FK_CurveConfigurationInflationCapFloorPriceSurfaces_IndexCurve FOREIGN KEY(IndexCurve)
REFERENCES TodaysMarketCurveSpecs (id);
ALTER TABLE CurveConfigurationInflationCapFloorPriceSurfaces ADD CONSTRAINT FK_CurveConfigurationInflationCapFloorPriceSurfaces_IndexInterp FOREIGN KEY(IndexInterpolated)
REFERENCES TypesBool (value);
ALTER TABLE CurveConfigurationInflationCapFloorPriceSurfaces ADD CONSTRAINT FK_CurveConfigurationInflationCapFloorPriceSurfaces_YieldTermStr FOREIGN KEY(YieldTermStructure)
REFERENCES TodaysMarketCurveSpecs (id);
-- ALTER TABLE CurveConfigurationInflationCapFloorPriceSurfaces ADD CONSTRAINT DF_CurveConfigurationInflationCapFloorPriceSurfaces_CapStrikes  DEFAULT ('') FOR CapStrikes;


CREATE TABLE CurveConfigurationEquityCurves (
	CurveId varchar(20) NOT NULL,
	GroupingId varchar(70),
	CurveDescription varchar(70),
	Currency varchar(7),
	ForecastingCurve varchar(20),
	Type varchar(20),
	SpotQuote varchar(100),
	DayCounter varchar(30),
	DividendInterpolationVariable varchar(20),
	DividendInterpolationMethod varchar(20),
CONSTRAINT PK_CurveConfigurationEquityCurves PRIMARY KEY CLUSTERED (
	CurveId ASC
));
ALTER TABLE CurveConfigurationEquityCurves ADD CONSTRAINT FK_CurveConfigurationEquityCurves_Currency FOREIGN KEY(Currency)
REFERENCES TypesCurrencyCode (value);
ALTER TABLE CurveConfigurationEquityCurves ADD CONSTRAINT FK_CurveConfigurationEquityCurves_ForecastingCurve FOREIGN KEY(ForecastingCurve)
REFERENCES CurveConfigurationYieldCurves (CurveId);
ALTER TABLE CurveConfigurationEquityCurves ADD CONSTRAINT FK_CurveConfigurationEquityCurves_Type FOREIGN KEY(Type)
REFERENCES TypesEquityType (value);
ALTER TABLE CurveConfigurationEquityCurves ADD CONSTRAINT FK_CurveConfigurationEquityCurves_DayCounter FOREIGN KEY(DayCounter)
REFERENCES TypesDayCounter (value);
ALTER TABLE CurveConfigurationEquityCurves ADD CONSTRAINT FK_CurveConfigurationEquityCurves_DividendInterpolationVariable FOREIGN KEY(DividendInterpolationVariable)
REFERENCES TypesInterpolationVariableType (value);
ALTER TABLE CurveConfigurationEquityCurves ADD CONSTRAINT FK_CurveConfigurationEquityCurves_DividendInterpolationMethod FOREIGN KEY(DividendInterpolationMethod)
REFERENCES TypesInterpolationMethodType (value);
ALTER TABLE CurveConfigurationEquityCurves ADD CONSTRAINT FK_CurveConfigurationEquityCurves_SpotQuote FOREIGN KEY(SpotQuote)
REFERENCES MdatMarketDataDefinitions (Quote);


CREATE TABLE CurveConfigurationEquityVolatilities (
	CurveId varchar(20) NOT NULL,
	GroupingId varchar(70),
	CurveDescription varchar(70),
	Currency varchar(7),
	Dimension varchar(5),
	Expiries varchar(70),
	Strikes varchar(100),
CONSTRAINT PK_CurveConfigurationEquityVolatilities PRIMARY KEY CLUSTERED (
	CurveId ASC
));
ALTER TABLE CurveConfigurationEquityVolatilities ADD CONSTRAINT FK_CurveConfigurationEquityVolatilities_Currency FOREIGN KEY(Currency)
REFERENCES TypesCurrencyCode (value);
ALTER TABLE CurveConfigurationEquityVolatilities ADD CONSTRAINT FK_CurveConfigurationEquityVolatilities_Dimension FOREIGN KEY(Dimension)
REFERENCES TypesDimensionType (value);


CREATE TABLE CurveConfigurationSecurities (
	CurveId varchar(20) NOT NULL,
	GroupingId varchar(70),
	CurveDescription varchar(70),
	SpreadQuote varchar(100),
	RecoveryRateQuote varchar(100),
CONSTRAINT PK_CurveConfigurationSecurities PRIMARY KEY CLUSTERED (
	CurveId ASC
));
ALTER TABLE CurveConfigurationSecurities ADD CONSTRAINT FK_CurveConfigurationSecurities_SpreadQuote FOREIGN KEY(SpreadQuote)
REFERENCES MdatMarketDataDefinitions (Quote);
ALTER TABLE CurveConfigurationSecurities ADD CONSTRAINT FK_CurveConfigurationSecurities_RecoveryRateQuote FOREIGN KEY(RecoveryRateQuote)
REFERENCES MdatMarketDataDefinitions (Quote);

-- relates to CurveConfigurationYieldCurve above
CREATE TABLE CurveConfigurationYieldCurveSegments (
	CurveId varchar(20) NOT NULL,
	Seq int NOT NULL,
	Type varchar(30) NOT NULL,
	SegmentsType varchar(15) NOT NULL,
	Conventions varchar(70) NOT NULL,
	ProjectionCurve varchar(20),
	ProjectionCurveLong varchar(20),
	ProjectionCurveShort varchar(20),
	DiscountCurve varchar(20),
	SpotRate varchar(100),
	ProjectionCurveDomestic varchar(20),
	ProjectionCurveForeign varchar(20),
	ReferenceCurve varchar(20),
CONSTRAINT PK_CurveConfigurationYieldCurveSegments PRIMARY KEY CLUSTERED (
	CurveId ASC,
	Seq ASC
));
ALTER TABLE CurveConfigurationYieldCurveSegments ADD CONSTRAINT FK_CurveConfigurationYieldCurveSegments_Type FOREIGN KEY(Type)
REFERENCES TypesSegmentTypeType (value);
ALTER TABLE CurveConfigurationYieldCurveSegments ADD CONSTRAINT FK_CurveConfigurationYieldCurveSegments_SegmentsType FOREIGN KEY(SegmentsType)
REFERENCES TypesSegmentType (value);
ALTER TABLE CurveConfigurationYieldCurveSegments ADD CONSTRAINT FK_CurveConfigurationYieldCurveSegments_CurveId FOREIGN KEY(CurveId)
REFERENCES CurveConfigurationYieldCurves (CurveId);
ALTER TABLE CurveConfigurationYieldCurveSegments ADD CONSTRAINT FK_CurveConfigurationYieldCurveSegments_ProjectionCurve FOREIGN KEY(ProjectionCurve)
REFERENCES CurveConfigurationYieldCurves (CurveId);
ALTER TABLE CurveConfigurationYieldCurveSegments ADD CONSTRAINT FK_CurveConfigurationYieldCurveSegments_ProjectionCurveLong FOREIGN KEY(ProjectionCurveLong)
REFERENCES CurveConfigurationYieldCurves (CurveId);
ALTER TABLE CurveConfigurationYieldCurveSegments ADD CONSTRAINT FK_CurveConfigurationYieldCurveSegments_ProjectionCurveShort FOREIGN KEY(ProjectionCurveShort)
REFERENCES CurveConfigurationYieldCurves (CurveId);
ALTER TABLE CurveConfigurationYieldCurveSegments ADD CONSTRAINT FK_CurveConfigurationYieldCurveSegments_DiscountCurve FOREIGN KEY(DiscountCurve)
REFERENCES CurveConfigurationYieldCurves (CurveId);
ALTER TABLE CurveConfigurationYieldCurveSegments ADD CONSTRAINT FK_CurveConfigurationYieldCurveSegments_ProjectionCurveDomestic FOREIGN KEY(ProjectionCurveDomestic)
REFERENCES CurveConfigurationYieldCurves (CurveId);
ALTER TABLE CurveConfigurationYieldCurveSegments ADD CONSTRAINT FK_CurveConfigurationYieldCurveSegments_ProjectionCurveForeign FOREIGN KEY(ProjectionCurveForeign)
REFERENCES CurveConfigurationYieldCurves (CurveId);
ALTER TABLE CurveConfigurationYieldCurveSegments ADD CONSTRAINT FK_CurveConfigurationYieldCurveSegments_ReferenceCurve FOREIGN KEY(ReferenceCurve)
REFERENCES CurveConfigurationYieldCurves (CurveId);
ALTER TABLE CurveConfigurationYieldCurveSegments ADD CONSTRAINT FK_CurveConfigurationYieldCurveSegments_SpotRate FOREIGN KEY(SpotRate)
REFERENCES MdatMarketDataDefinitions (Quote);

-- relates to Segments table above, only for Type AverageOIS
CREATE TABLE CurveConfigurationCompositeQuotes (
	CurveId varchar(20) NOT NULL,
	Seq int NOT NULL,
	SeqSegment int NOT NULL,
	SpreadQuote varchar(100) NOT NULL,
	RateQuote varchar(100) NOT NULL,
CONSTRAINT PK_CurveConfigurationCompositeQuotes PRIMARY KEY CLUSTERED (
	CurveId ASC,
	Seq ASC,
	SeqSegment ASC
));
ALTER TABLE CurveConfigurationCompositeQuotes ADD CONSTRAINT FK_CurveConfigurationCompositeQuotes_SpreadQuote FOREIGN KEY(SpreadQuote)
REFERENCES MdatMarketDataDefinitions (Quote);
ALTER TABLE CurveConfigurationCompositeQuotes ADD CONSTRAINT FK_CurveConfigurationCompositeQuotes_RateQuote FOREIGN KEY(RateQuote)
REFERENCES MdatMarketDataDefinitions (Quote);

-- relates to the Segment table above, except AverageOIS
CREATE TABLE CurveConfigurationQuotes (
	CurveId varchar(20) NOT NULL,
	Seq int NOT NULL,
	SeqSegment int NOT NULL,
	Quote varchar(100) NOT NULL,
CONSTRAINT PK_CurveConfigurationQuotes PRIMARY KEY CLUSTERED (
	CurveId ASC,
	Seq ASC,
	SeqSegment ASC
));
ALTER TABLE CurveConfigurationQuotes ADD CONSTRAINT FK_CurveConfigurationQuotes_Quote FOREIGN KEY(Quote)
REFERENCES MdatMarketDataDefinitions (Quote);

CREATE TABLE CurveConfigurationBaseCorrelation (
	CurveId varchar(20) NOT NULL,
	GroupingId varchar(70),
	CurveDescription varchar(70),
	Terms varchar(70),
	DetachmentPoints varchar(70),
	SettlementDays decimal(9,6),
	Calendar varchar(20) NOT NULL,
	BusinessDayConvention varchar(20) NOT NULL,
	DayCounter varchar(30) NOT NULL,
	Extrapolate varchar(5),
CONSTRAINT PK_CurveConfigurationBaseCorrelation PRIMARY KEY CLUSTERED (
	CurveId ASC
));
-- ALTER TABLE CurveConfigurationBaseCorrelation ADD CONSTRAINT FK_CurveConfigurationBaseCorrelation_Calendar FOREIGN KEY(Calendar)
-- REFERENCES TypesCalendar (value);
ALTER TABLE CurveConfigurationBaseCorrelation ADD CONSTRAINT FK_CurveConfigurationBaseCorrelation_BusinessDayConvention FOREIGN KEY(BusinessDayConvention)
REFERENCES TypesBusinessDayConvention (value);
ALTER TABLE CurveConfigurationBaseCorrelation ADD CONSTRAINT FK_CurveConfigurationBaseCorrelation_DayCounter FOREIGN KEY(DayCounter)
REFERENCES TypesDayCounter (value);
ALTER TABLE CurveConfigurationBaseCorrelation ADD CONSTRAINT FK_CurveConfigurationBaseCorrelation_Extrapolate FOREIGN KEY(Extrapolate)
REFERENCES TypesBool (value);
