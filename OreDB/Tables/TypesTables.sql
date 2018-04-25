use ORE

CREATE TABLE TypesAmortizationType(
	value varchar(30) NOT NULL,
CONSTRAINT PK_TypesAmortizationType PRIMARY KEY CLUSTERED (
	value ASC
));

-- COLLATION Latin1_General_CS_AS is needed for case sensitive values (true, TRUE, false, FALSE)
CREATE TABLE TypesBool(
	value varchar(5) NOT NULL,
CONSTRAINT PK_TypesBool PRIMARY KEY CLUSTERED (
	value ASC
));

-- COLLATION Latin1_General_CS_AS is needed for case sensitive values (Following, FOLLOWING..)
CREATE TABLE TypesBusinessDayConvention(
	value varchar(20) NOT NULL,
CONSTRAINT PK_TypesBusinessDayConvention PRIMARY KEY CLUSTERED (
	value ASC
));

CREATE TABLE TypesCalendar(
	value varchar(20) NOT NULL,
CONSTRAINT PK_TypesCalendar PRIMARY KEY CLUSTERED (
	value ASC
));

CREATE TABLE TypesCalibrationTypeType (
	value varchar(10)  NOT NULL,
CONSTRAINT PK_TypesCalibrationTypeType PRIMARY KEY CLUSTERED (
	value ASC
));

CREATE TABLE TypesCdsType(
	value varchar(20)  NOT NULL,
CONSTRAINT PK_TypesCdsType PRIMARY KEY CLUSTERED (
	value ASC
));

CREATE TABLE TypesCompounding(
	value varchar(30)  NOT NULL,
CONSTRAINT PK_TypesCompounding PRIMARY KEY CLUSTERED (
	value ASC
));

CREATE TABLE TypesCurrencyCode(
	value varchar(7) NOT NULL,
CONSTRAINT PK_TypesCurrencyCode PRIMARY KEY CLUSTERED (
	value ASC
));

CREATE TABLE TypesCurrencyPair(
	value varchar(7) NOT NULL,
CONSTRAINT PK_TypesCurrencyPair PRIMARY KEY CLUSTERED (
	value ASC
));

CREATE TABLE TypesCurveType (
	value varchar(20)  NOT NULL,
CONSTRAINT PK_TypesCurveType PRIMARY KEY CLUSTERED (
	value ASC
));

CREATE TABLE TypesCsaType (
	value varchar(10)  NOT NULL,
CONSTRAINT PK_TypesCsaType PRIMARY KEY CLUSTERED (
	value ASC
));

CREATE TABLE TypesDayCounter(
	value varchar(30) NOT NULL,
CONSTRAINT PK_TypesDayCounter PRIMARY KEY CLUSTERED (
	value ASC
));

CREATE TABLE TypesDefaultCurveType(
	value varchar(20) NOT NULL,
CONSTRAINT PK_TypesDefaultCurveType PRIMARY KEY CLUSTERED (
	value ASC
));

CREATE TABLE TypesDateRule(
	value varchar(20) NOT NULL,
CONSTRAINT PK_TypesDateRule PRIMARY KEY CLUSTERED (
	value ASC
));

CREATE TABLE TypesDimensionType(
	value varchar(5) NOT NULL,
CONSTRAINT PK_TypesDimensionType PRIMARY KEY CLUSTERED (
	value ASC
));

CREATE TABLE TypesDiscretizationType (
	value varchar(10) NOT NULL,
CONSTRAINT PK_TypesDiscretizationType PRIMARY KEY CLUSTERED (
	value ASC
));

CREATE TABLE TypesEquityType(
	value varchar(20) NOT NULL,
CONSTRAINT PK_TypesEquityType PRIMARY KEY CLUSTERED (
	value ASC
));

CREATE TABLE TypesExtrapolationType(
	value varchar(10) NOT NULL,
CONSTRAINT PK_TypesExtrapolationType PRIMARY KEY CLUSTERED (
	value ASC
));

CREATE TABLE TypesFrequencyType(
	value varchar(20) NOT NULL,
CONSTRAINT PK_TypesFrequencyType PRIMARY KEY CLUSTERED (
	value ASC
));

CREATE TABLE TypesFactors (
	value varchar(20) NOT NULL,
CONSTRAINT PK_TypesFactors PRIMARY KEY CLUSTERED (
	value ASC
));

CREATE TABLE TypesIndexName(
	value varchar(30) NOT NULL,
CONSTRAINT PK_TypesIndexName PRIMARY KEY CLUSTERED (
	value ASC
));

CREATE TABLE TypesIndependentAmountType (
	value varchar(10) NOT NULL,
CONSTRAINT PK_TypesIndependentAmountType PRIMARY KEY CLUSTERED (
	value ASC
));

CREATE TABLE TypesInflationType(
	value varchar(2) NOT NULL,
CONSTRAINT PK_TypesInflationType PRIMARY KEY CLUSTERED (
	value ASC
));

CREATE TABLE TypesInterpolationVariableType(
	value varchar(20) NOT NULL,
CONSTRAINT PK_TypesInterpolationVariableType PRIMARY KEY CLUSTERED (
	value ASC
));

CREATE TABLE TypesInterpolationMethodType(
	value varchar(20) NOT NULL,
CONSTRAINT PK_TypesInterpolationMethodType PRIMARY KEY CLUSTERED (
	value ASC
));

CREATE TABLE TypesLegType (
	value varchar(20) NOT NULL,
CONSTRAINT PK_TypesLegType PRIMARY KEY CLUSTERED (
	value ASC
));

CREATE TABLE TypesLongShort(
	value varchar(5) NOT NULL,
CONSTRAINT PK_TypesLongShort PRIMARY KEY CLUSTERED (
	value ASC
));

CREATE TABLE TypesOptionStyle (
	value varchar(10) NOT NULL,
CONSTRAINT PK_TypesOptionStyle PRIMARY KEY CLUSTERED (
	value ASC
));

CREATE TABLE TypesOptionSettlement (
	value varchar(10) NOT NULL,
CONSTRAINT PK_TypesOptionSettlement PRIMARY KEY CLUSTERED (
	value ASC
));

CREATE TABLE TypesOptionType (
	value varchar(10) NOT NULL,
CONSTRAINT PK_TypesOptionType PRIMARY KEY CLUSTERED (
	value ASC
));

CREATE TABLE TypesOreTradeType (
	value varchar(30) NOT NULL,
CONSTRAINT PK_TypesOreTradeType PRIMARY KEY CLUSTERED (
	value ASC
));

CREATE TABLE TypesParamTypeType (
	value varchar(10) NOT NULL,
CONSTRAINT PK_TypesParamTypeType PRIMARY KEY CLUSTERED (
	value ASC
));

CREATE TABLE TypesParties (
	value varchar(30) NOT NULL,
CONSTRAINT PK_TypesParties PRIMARY KEY CLUSTERED (
	value ASC
));

CREATE TABLE TypesSegmentType (
	value varchar(15) NOT NULL,
CONSTRAINT PK_TypesSegmentType PRIMARY KEY CLUSTERED (
	value ASC
));

CREATE TABLE TypesSegmentTypeType (
	value varchar(30) NOT NULL,
CONSTRAINT PK_TypesSegmentTypeType PRIMARY KEY CLUSTERED (
	value ASC
));

CREATE TABLE TypesSequenceType (
	value varchar(30) NOT NULL,
CONSTRAINT PK_TypesSequenceType PRIMARY KEY CLUSTERED (
	value ASC
));

CREATE TABLE TypesShiftType (
	value varchar(8) NOT NULL,
CONSTRAINT PK_TypesShiftType PRIMARY KEY CLUSTERED (
	value ASC
));

CREATE TABLE TypesSubPeriodsCouponType(
	value varchar(20) NOT NULL,
CONSTRAINT PK_TypesSubPeriodsCouponType PRIMARY KEY CLUSTERED (
	value ASC
));

CREATE TABLE TypesTimeDecayType (
	value varchar(20) NOT NULL,
CONSTRAINT PK_TypesTimeDecayType PRIMARY KEY CLUSTERED (
	value ASC
));

CREATE TABLE TypesTradeActionType (
	value varchar(20) NOT NULL,
CONSTRAINT PK_TypesTradeActionType PRIMARY KEY CLUSTERED (
	value ASC
));

CREATE TABLE TypesTradeActionOwner (
	value varchar(20) NOT NULL,
CONSTRAINT PK_TypesTradeActionOwner PRIMARY KEY CLUSTERED (
	value ASC
));

CREATE TABLE TypesVolatilityType(
	value varchar(20) NOT NULL,
CONSTRAINT PK_TypesVolatilityType PRIMARY KEY CLUSTERED (
	value ASC
));

CREATE TABLE TypesVolatilityTypeType (
	value varchar(10) NOT NULL,
CONSTRAINT PK_TypesVolatilityReversionTypeType PRIMARY KEY CLUSTERED (
	value ASC
));

CREATE TABLE TypesYcInterpolation (
	value varchar(10) NOT NULL,
CONSTRAINT PK_TypesYcInterpolation PRIMARY KEY CLUSTERED (
	value ASC
));