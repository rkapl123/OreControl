use ORE

CREATE TABLE CurveConfigurationFXVolatilities (
	CurveId varchar(20) NOT NULL,
	GroupingId varchar(70),
	CurveDescription varchar(70),
	Dimension varchar(5),
	Expiries varchar(70)
CONSTRAINT PK_CurveConfigurationFXVolatilities PRIMARY KEY CLUSTERED (
	CurveId ASC
))
ALTER TABLE CurveConfigurationFXVolatilities WITH CHECK ADD CONSTRAINT FK_CurveConfigurationFXVolatilities_Dimension FOREIGN KEY(Dimension)
REFERENCES TypesDimensionType (value)

CREATE TABLE CurveConfigurationSwaptionVolatilities (
	CurveId varchar(20) NOT NULL,
	GroupingId varchar(70),
	CurveDescription varchar(70),
	Dimension varchar(5),
	VolatilityType varchar(20),
	Extrapolation varchar(10),
	DayCounter varchar(30),
	Calendar varchar(20),
	BusinessDayConvention varchar(20) COLLATE Latin1_General_CS_AS,
	OptionTenors varchar(70),
	SwapTenors varchar(70),
	ShortSwapIndexBase varchar(20),
	SwapIndexBase varchar(20)
CONSTRAINT PK_CurveConfigurationSwaptionVolatilities PRIMARY KEY CLUSTERED (
	CurveId ASC
))
ALTER TABLE CurveConfigurationSwaptionVolatilities WITH CHECK ADD CONSTRAINT FK_CurveConfigurationSwaptionVolatilities_Dimension FOREIGN KEY(Dimension)
REFERENCES TypesDimensionType (value)
ALTER TABLE CurveConfigurationSwaptionVolatilities WITH CHECK ADD CONSTRAINT FK_CurveConfigurationSwaptionVolatilities_VolatilityType FOREIGN KEY(VolatilityType)
REFERENCES TypesVolatilityType (value)
ALTER TABLE CurveConfigurationSwaptionVolatilities WITH CHECK ADD CONSTRAINT FK_CurveConfigurationSwaptionVolatilities_Extrapolation FOREIGN KEY(Extrapolation)
REFERENCES TypesExtrapolationType (value)
ALTER TABLE CurveConfigurationSwaptionVolatilities WITH CHECK ADD CONSTRAINT FK_CurveConfigurationSwaptionVolatilities_DayCounter FOREIGN KEY(DayCounter)
REFERENCES TypesDayCounter (value)
ALTER TABLE CurveConfigurationSwaptionVolatilities WITH CHECK ADD CONSTRAINT FK_CurveConfigurationSwaptionVolatilities_Calendar FOREIGN KEY(Calendar)
REFERENCES TypesCalendar (value)
ALTER TABLE CurveConfigurationSwaptionVolatilities WITH CHECK ADD CONSTRAINT FK_CurveConfigurationSwaptionVolatilities_BusinessDayConvention FOREIGN KEY(BusinessDayConvention)
REFERENCES TypesBusinessDayConvention (value)
ALTER TABLE CurveConfigurationSwaptionVolatilities WITH CHECK ADD CONSTRAINT FK_CurveConfigurationSwaptionVolatilities_ShortSwapIndexBase FOREIGN KEY(ShortSwapIndexBase)
REFERENCES TypesIndexName (value)
ALTER TABLE CurveConfigurationSwaptionVolatilities WITH CHECK ADD CONSTRAINT FK_CurveConfigurationSwaptionVolatilities_SwapIndexBase FOREIGN KEY(SwapIndexBase)
REFERENCES TypesIndexName (value)

CREATE TABLE CurveConfigurationCapFloorVolatilities (
	CurveId varchar(20) NOT NULL,
	GroupingId varchar(70),
	CurveDescription varchar(70),
	VolatilityType varchar(20),
	Extrapolation varchar(5) COLLATE Latin1_General_CS_AS,
	IncludeAtm varchar(5) COLLATE Latin1_General_CS_AS,
	DayCounter varchar(30),
	Calendar varchar(20),
	BusinessDayConvention varchar(20) COLLATE Latin1_General_CS_AS,
	Tenors varchar(70),
	Strikes varchar(130),
	IborIndex varchar(20),
	DiscountCurve varchar(70)
CONSTRAINT PK_CurveConfigurationCapFloorVolatilities PRIMARY KEY CLUSTERED (
	CurveId ASC
))
ALTER TABLE CurveConfigurationCapFloorVolatilities WITH CHECK ADD CONSTRAINT FK_CurveConfigurationCapFloorVolatilities_Type FOREIGN KEY(VolatilityType)
REFERENCES TypesVolatilityType (value)
ALTER TABLE CurveConfigurationCapFloorVolatilities WITH CHECK ADD CONSTRAINT FK_CurveConfigurationCapFloorVolatilities_Extrapolation FOREIGN KEY(Extrapolation)
REFERENCES TypesBool (value)
ALTER TABLE CurveConfigurationCapFloorVolatilities WITH CHECK ADD CONSTRAINT FK_CurveConfigurationCapFloorVolatilities_IncludeAtm FOREIGN KEY(IncludeAtm)
REFERENCES TypesBool (value)
ALTER TABLE CurveConfigurationCapFloorVolatilities WITH CHECK ADD CONSTRAINT FK_CurveConfigurationCapFloorVolatilities_DayCounter FOREIGN KEY(DayCounter)
REFERENCES TypesDayCounter (value)
ALTER TABLE CurveConfigurationCapFloorVolatilities WITH CHECK ADD CONSTRAINT FK_CurveConfigurationCapFloorVolatilities_Calendar FOREIGN KEY(Calendar)
REFERENCES TypesCalendar (value)
ALTER TABLE CurveConfigurationCapFloorVolatilities WITH CHECK ADD CONSTRAINT FK_CurveConfigurationCapFloorVolatilities_BusinessDayConvention FOREIGN KEY(BusinessDayConvention)
REFERENCES TypesBusinessDayConvention (value)
ALTER TABLE CurveConfigurationCapFloorVolatilities WITH CHECK ADD CONSTRAINT FK_CurveConfigurationCapFloorVolatilities_IborIndex FOREIGN KEY(IborIndex)
REFERENCES TypesIndexName (value)

CREATE TABLE CurveConfigurationDefaultCurves (
	CurveId varchar(20) NOT NULL,
	GroupingId varchar(70),
	CurveDescription varchar(70),
	Currency varchar(7),
	Type varchar(20),
	DiscountCurve varchar(70),
	DayCounter varchar(30),
	RecoveryRate varchar(70),
	Conventions varchar(70)
CONSTRAINT PK_CurveConfigurationDefaultCurves PRIMARY KEY CLUSTERED (
	CurveId ASC
))
ALTER TABLE CurveConfigurationDefaultCurves WITH CHECK ADD CONSTRAINT FK_CurveConfigurationDefaultCurves_Currency FOREIGN KEY(Currency)
REFERENCES TypesCurrencyCode (value)
ALTER TABLE CurveConfigurationDefaultCurves WITH CHECK ADD CONSTRAINT FK_CurveConfigurationDefaultCurves_Type FOREIGN KEY(Type)
REFERENCES TypesCdsType (value)
ALTER TABLE CurveConfigurationDefaultCurves WITH CHECK ADD CONSTRAINT FK_CurveConfigurationDefaultCurves_DayCounter FOREIGN KEY(DayCounter)
REFERENCES TypesDayCounter (value)
ALTER TABLE CurveConfigurationDefaultCurves WITH CHECK ADD CONSTRAINT FK_CurveConfigurationDefaultCurves_Conventions FOREIGN KEY(Conventions)
REFERENCES ConventionsCDS (Id)

CREATE TABLE CurveConfigurationYieldCurves (
	CurveId varchar(20) NOT NULL,
	GroupingId varchar(70),
	CurveDescription varchar(70),
	Currency varchar(7),
	DiscountCurve varchar(20),
	InterpolationVariable varchar(20),
	InterpolationMethod varchar(20),
	YieldCurveDayCounter varchar(30),
	Tolerance decimal(18,14),
	Extrapolation varchar(5) COLLATE Latin1_General_CS_AS
CONSTRAINT PK_CurveConfigurationYieldCurves PRIMARY KEY CLUSTERED (
	CurveId ASC
))
ALTER TABLE CurveConfigurationYieldCurves WITH CHECK ADD CONSTRAINT FK_CurveConfigurationYieldCurves_Currency FOREIGN KEY(Currency)
REFERENCES TypesCurrencyCode (value)
ALTER TABLE CurveConfigurationYieldCurves WITH CHECK ADD CONSTRAINT FK_CurveConfigurationYieldCurves_InterpolationVariable FOREIGN KEY(InterpolationVariable)
REFERENCES TypesInterpolationVariableType (value)
ALTER TABLE CurveConfigurationYieldCurves WITH CHECK ADD CONSTRAINT FK_CurveConfigurationYieldCurves_InterpolationMethod FOREIGN KEY(InterpolationMethod)
REFERENCES TypesInterpolationMethodType (value)
ALTER TABLE CurveConfigurationYieldCurves WITH CHECK ADD CONSTRAINT FK_CurveConfigurationYieldCurves_YieldCurveDayCounter FOREIGN KEY(YieldCurveDayCounter)
REFERENCES TypesDayCounter (value)
ALTER TABLE CurveConfigurationYieldCurves WITH CHECK ADD CONSTRAINT FK_CurveConfigurationYieldCurves_Extrapolation FOREIGN KEY(Extrapolation)
REFERENCES TypesBool (value)

CREATE TABLE CurveConfigurationInflationCurves (
	CurveId varchar(20) NOT NULL,
	GroupingId varchar(70),
	CurveDescription varchar(70),
	NominalTermStructure varchar(70) NOT NULL,
	Type varchar(2) NOT NULL,
	Conventions varchar(70),
	Extrapolation varchar(5) COLLATE Latin1_General_CS_AS,
	Calendar varchar(20),
	DayCounter varchar(30),
	Lag varchar(5) NOT NULL,
	Frequency varchar(20) NOT NULL,
	BaseRate decimal(9,6),
	Tolerance decimal(18,14),
	SeasonalityBaseDate datetime,
	SeasonalityFrequency varchar(20)
CONSTRAINT PK_CurveConfigurationInflationCurves PRIMARY KEY CLUSTERED (
	CurveId ASC
))
ALTER TABLE CurveConfigurationInflationCurves WITH CHECK ADD CONSTRAINT FK_CurveConfigurationInflationCurves_Type FOREIGN KEY(Type)
REFERENCES TypesInflationType (value)
ALTER TABLE CurveConfigurationInflationCurves WITH CHECK ADD CONSTRAINT FK_CurveConfigurationInflationCurves_Conventions FOREIGN KEY(Conventions)
REFERENCES ConventionsInflationSwap (Id)
ALTER TABLE CurveConfigurationInflationCurves WITH CHECK ADD CONSTRAINT FK_CurveConfigurationInflationCurves_Extrapolation FOREIGN KEY(Extrapolation)
REFERENCES TypesBool (value)
ALTER TABLE CurveConfigurationInflationCurves WITH CHECK ADD CONSTRAINT FK_CurveConfigurationInflationCurves_Calendar FOREIGN KEY(Calendar)
REFERENCES TypesCalendar (value)
ALTER TABLE CurveConfigurationInflationCurves WITH CHECK ADD CONSTRAINT FK_CurveConfigurationInflationCurves_DayCounter FOREIGN KEY(DayCounter)
REFERENCES TypesDayCounter (value)
ALTER TABLE CurveConfigurationInflationCurves WITH CHECK ADD CONSTRAINT FK_CurveConfigurationInflationCurves_Frequency FOREIGN KEY(Frequency)
REFERENCES TypesFrequencyType (value)
ALTER TABLE CurveConfigurationInflationCurves WITH CHECK ADD CONSTRAINT FK_CurveConfigurationInflationCurves_SeasonalityFrequency FOREIGN KEY(SeasonalityFrequency)
REFERENCES TypesFrequencyType (value)

CREATE TABLE CurveConfigurationSeasonalityFactors (
	CurveId varchar(20) NOT NULL,
	Factor  varchar(70) NOT NULL
CONSTRAINT PK_CurveConfigurationSeasonalityFactors PRIMARY KEY CLUSTERED (
	CurveId ASC,
	Factor ASC
))

CREATE TABLE CurveConfigurationInflationCapFloorPriceSurfaces (
	CurveId varchar(20) NOT NULL,
	GroupingId varchar(70),
	CurveDescription varchar(70) NOT NULL,
	Type varchar(2) NOT NULL,
	StartRate decimal(9,6) NOT NULL,
	ObservationLag varchar(5) NOT NULL,
	Calendar varchar(20) NOT NULL,
	BusinessDayConvention varchar(20) COLLATE Latin1_General_CS_AS NOT NULL,
	DayCounter varchar(30) NOT NULL,
	IndexName varchar(20) NOT NULL,
	IndexCurve varchar(70) NOT NULL,
	IndexInterpolated varchar(5) COLLATE Latin1_General_CS_AS NOT NULL,
	YieldTermStructure varchar(70) NOT NULL,
	CapStrikes varchar(70) NOT NULL,
	FloorStrikes varchar(70) NOT NULL,
	Maturities varchar(70) NOT NULL
CONSTRAINT PK_CurveConfigurationInflationCapFloorPriceSurfaces PRIMARY KEY CLUSTERED (
	CurveId ASC
))
ALTER TABLE CurveConfigurationInflationCapFloorPriceSurfaces WITH CHECK ADD CONSTRAINT FK_CurveConfigurationInflationCapFloorPriceSurfaces_Type FOREIGN KEY(Type)
REFERENCES TypesInflationType (value)
ALTER TABLE CurveConfigurationInflationCapFloorPriceSurfaces WITH CHECK ADD CONSTRAINT FK_CurveConfigurationInflationCapFloorPriceSurfaces_Calendar FOREIGN KEY(Calendar)
REFERENCES TypesCalendar (value)
ALTER TABLE CurveConfigurationInflationCapFloorPriceSurfaces WITH CHECK ADD CONSTRAINT FK_CurveConfigurationInflationCapFloorPriceSurfaces_BusinessDayConvention FOREIGN KEY(BusinessDayConvention)
REFERENCES TypesBusinessDayConvention (value)
ALTER TABLE CurveConfigurationInflationCapFloorPriceSurfaces WITH CHECK ADD CONSTRAINT FK_CurveConfigurationInflationCapFloorPriceSurfaces_DayCounter FOREIGN KEY(DayCounter)
REFERENCES TypesDayCounter (value)
ALTER TABLE CurveConfigurationInflationCapFloorPriceSurfaces WITH CHECK ADD CONSTRAINT FK_CurveConfigurationInflationCapFloorPriceSurfaces_IndexName FOREIGN KEY(IndexName)
REFERENCES TypesIndexName (value)
ALTER TABLE CurveConfigurationInflationCapFloorPriceSurfaces WITH CHECK ADD CONSTRAINT FK_CurveConfigurationInflationCapFloorPriceSurfaces_IndexInterpolated FOREIGN KEY(IndexInterpolated)
REFERENCES TypesBool (value)

CREATE TABLE CurveConfigurationEquityCurves (
	CurveId varchar(20) NOT NULL,
	GroupingId varchar(70),
	CurveDescription varchar(70),
	Currency varchar(7),
	Type varchar(20),
	SpotQuote varchar(70),
	DayCounter varchar(30)
CONSTRAINT PK_CurveConfigurationEquityCurves PRIMARY KEY CLUSTERED (
	CurveId ASC
))
ALTER TABLE CurveConfigurationEquityCurves WITH CHECK ADD CONSTRAINT FK_CurveConfigurationEquityCurves_Currency FOREIGN KEY(Currency)
REFERENCES TypesCurrencyCode (value)
ALTER TABLE CurveConfigurationEquityCurves WITH CHECK ADD CONSTRAINT FK_CurveConfigurationEquityCurves_Type FOREIGN KEY(Type)
REFERENCES TypesEquityType (value)
ALTER TABLE CurveConfigurationEquityCurves WITH CHECK ADD CONSTRAINT FK_CurveConfigurationEquityCurves_DayCounter FOREIGN KEY(DayCounter)
REFERENCES TypesDayCounter (value)

CREATE TABLE CurveConfigurationEquityVolatilities (
	CurveId varchar(20) NOT NULL,
	GroupingId varchar(70),
	CurveDescription varchar(70),
	Currency varchar(7),
	Dimension varchar(5),
	Expiries varchar(70)
CONSTRAINT PK_CurveConfigurationEquityVolatilities PRIMARY KEY CLUSTERED (
	CurveId ASC
))
ALTER TABLE CurveConfigurationEquityVolatilities WITH CHECK ADD CONSTRAINT FK_CurveConfigurationEquityVolatilities_Currency FOREIGN KEY(Currency)
REFERENCES TypesCurrencyCode (value)
ALTER TABLE CurveConfigurationEquityVolatilities WITH CHECK ADD CONSTRAINT FK_CurveConfigurationEquityVolatilities_Dimension FOREIGN KEY(Dimension)
REFERENCES TypesDimensionType (value)

CREATE TABLE CurveConfigurationSecuritySpreads (
	CurveId varchar(20) NOT NULL,
	GroupingId varchar(70),
	CurveDescription varchar(70)
CONSTRAINT PK_CurveConfigurationSecuritySpreads PRIMARY KEY CLUSTERED (
	CurveId ASC
))

-- relates to CurveConfigurationYieldCurve above
CREATE TABLE CurveConfigurationYieldCurveSegments (
	CurveId varchar(20) NOT NULL,
	Seq int NOT NULL,
	Type varchar(30),
	SegmentsType varchar(15),
	Conventions varchar(70),
	ProjectionCurve varchar(20),
	ProjectionCurveLong varchar(20),
	ProjectionCurveShort varchar(20),
	DiscountCurve varchar(20),
	SpotRate varchar(70),
	ProjectionCurveDomestic varchar(20),
	ProjectionCurveForeign varchar(20),
	ReferenceCurve varchar(20)
CONSTRAINT PK_CurveConfigurationYieldCurveSegments PRIMARY KEY CLUSTERED (
	CurveId ASC,
	Type ASC,
	SegmentsType ASC
))
ALTER TABLE CurveConfigurationYieldCurveSegments WITH CHECK ADD CONSTRAINT FK_CurveConfigurationYieldCurveSegments_Type FOREIGN KEY(Type)
REFERENCES TypesSegmentTypeType (value)
ALTER TABLE CurveConfigurationYieldCurveSegments WITH CHECK ADD CONSTRAINT FK_CurveConfigurationYieldCurveSegments_SegmentsType FOREIGN KEY(SegmentsType)
REFERENCES TypesSegmentType (value)
ALTER TABLE CurveConfigurationYieldCurveSegments WITH CHECK ADD CONSTRAINT FK_CurveConfigurationYieldCurveSegments_CurveId FOREIGN KEY(CurveId)
REFERENCES CurveConfigurationYieldCurves (CurveId)
ALTER TABLE CurveConfigurationYieldCurveSegments WITH CHECK ADD CONSTRAINT FK_CurveConfigurationYieldCurveSegments_ProjectionCurve FOREIGN KEY(ProjectionCurve)
REFERENCES CurveConfigurationYieldCurves (CurveId)
ALTER TABLE CurveConfigurationYieldCurveSegments WITH CHECK ADD CONSTRAINT FK_CurveConfigurationYieldCurveSegments_ProjectionCurveLong FOREIGN KEY(ProjectionCurveLong)
REFERENCES CurveConfigurationYieldCurves (CurveId)
ALTER TABLE CurveConfigurationYieldCurveSegments WITH CHECK ADD CONSTRAINT FK_CurveConfigurationYieldCurveSegments_ProjectionCurveShort FOREIGN KEY(ProjectionCurveShort)
REFERENCES CurveConfigurationYieldCurves (CurveId)
ALTER TABLE CurveConfigurationYieldCurveSegments WITH CHECK ADD CONSTRAINT FK_CurveConfigurationYieldCurveSegments_DiscountCurve FOREIGN KEY(DiscountCurve)
REFERENCES CurveConfigurationYieldCurves (CurveId)
ALTER TABLE CurveConfigurationYieldCurveSegments WITH CHECK ADD CONSTRAINT FK_CurveConfigurationYieldCurveSegments_ProjectionCurveDomestic FOREIGN KEY(ProjectionCurveDomestic)
REFERENCES CurveConfigurationYieldCurves (CurveId)
ALTER TABLE CurveConfigurationYieldCurveSegments WITH CHECK ADD CONSTRAINT FK_CurveConfigurationYieldCurveSegments_ProjectionCurveForeign FOREIGN KEY(ProjectionCurveForeign)
REFERENCES CurveConfigurationYieldCurves (CurveId)
ALTER TABLE CurveConfigurationYieldCurveSegments WITH CHECK ADD CONSTRAINT FK_CurveConfigurationYieldCurveSegments_ReferenceCurve FOREIGN KEY(ReferenceCurve)
REFERENCES CurveConfigurationYieldCurves (CurveId)

-- relates to Segments table above, only for Type AverageOIS
CREATE TABLE CurveConfigurationCompositeQuotes (
	CurveId varchar(20) NOT NULL,
	Type varchar(30),
	SpreadQuote varchar(70) NOT NULL,
	RateQuote varchar(70) NOT NULL
CONSTRAINT PK_CurveConfigurationCompositeQuotes PRIMARY KEY CLUSTERED (
	CurveId ASC,
	SpreadQuote ASC,
	RateQuote ASC
))
ALTER TABLE CurveConfigurationCompositeQuotes WITH CHECK ADD CONSTRAINT FK_CurveConfigurationCompositeQuotes_Type FOREIGN KEY(Type)
REFERENCES TypesSegmentTypeType (value)

-- relates to the Segment table above, except AverageOIS
CREATE TABLE CurveConfigurationQuotes (
	CurveId varchar(20) NOT NULL,
	Seq int NOT NULL,
	Type varchar(30),
	Quote varchar(70) NOT NULL
CONSTRAINT PK_CurveConfigurationQuotes PRIMARY KEY CLUSTERED (
	CurveId ASC,
	Quote ASC
))
ALTER TABLE CurveConfigurationQuotes WITH CHECK ADD CONSTRAINT FK_CurveConfigurationQuotes_Type FOREIGN KEY(Type)
REFERENCES TypesSegmentTypeType (value)
