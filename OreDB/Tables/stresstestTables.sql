use ORE

CREATE TABLE Stresstest (
	Id varchar(40) not null,
	GroupingId varchar(70)
CONSTRAINT PK_Stresstest PRIMARY KEY CLUSTERED 
(
	Id ASC
))

CREATE TABLE StresstestDiscountCurve (
	StresstestId varchar(40) not null,
	ccy varchar(7) not null,
	ShiftType varchar(8),
	ShiftTenors varchar(100),
	Shifts varchar(200)
CONSTRAINT PK_StresstestDiscountCurve PRIMARY KEY CLUSTERED 
(
	StresstestId ASC,
	ccy ASC
))
ALTER TABLE StresstestDiscountCurve WITH CHECK ADD CONSTRAINT FK_StresstestDiscountCurve_StresstestId FOREIGN KEY(StresstestId)
REFERENCES Stresstest (Id)
ALTER TABLE StresstestDiscountCurve WITH CHECK ADD CONSTRAINT FK_StresstestDiscountCurve_ShiftType FOREIGN KEY(ShiftType)
REFERENCES TypesShiftType (value)
ALTER TABLE StresstestDiscountCurve WITH CHECK ADD CONSTRAINT FK_StresstestDiscountCurve_ccy FOREIGN KEY(ccy)
REFERENCES TypesCurrencyCode (value)

CREATE TABLE StresstestIndexCurve (
	StresstestId varchar(40) not null,
	IndexName varchar(30) not null,
	ShiftType varchar(8),
	ShiftTenors varchar(100),
	Shifts varchar(200)
CONSTRAINT PK_StresstestIndexCurve PRIMARY KEY CLUSTERED 
(
	StresstestId ASC,
	IndexName ASC
))
ALTER TABLE StresstestIndexCurve WITH CHECK ADD CONSTRAINT FK_StresstestIndexCurve_StresstestId FOREIGN KEY(StresstestId)
REFERENCES Stresstest (Id)
ALTER TABLE StresstestIndexCurve WITH CHECK ADD CONSTRAINT FK_StresstestIndexCurve_ShiftType FOREIGN KEY(ShiftType)
REFERENCES TypesShiftType (value)
ALTER TABLE StresstestIndexCurve WITH CHECK ADD CONSTRAINT FK_StresstestIndexCurve_IndexName FOREIGN KEY(IndexName)
REFERENCES TypesIndexName (value)

CREATE TABLE StresstestYieldCurve (
	StresstestId varchar(40) not null,
	Name varchar(20) not null,
	ShiftType varchar(8),
	ShiftTenors varchar(100),
	Shifts varchar(200)
CONSTRAINT PK_StresstestYieldCurve PRIMARY KEY CLUSTERED 
(
	StresstestId ASC,
	Name ASC
))
ALTER TABLE StresstestYieldCurve WITH CHECK ADD CONSTRAINT FK_StresstestYieldCurve_StresstestId FOREIGN KEY(StresstestId)
REFERENCES Stresstest (Id)
ALTER TABLE StresstestYieldCurve WITH CHECK ADD CONSTRAINT FK_StresstestYieldCurve_ShiftType FOREIGN KEY(ShiftType)
REFERENCES TypesShiftType (value)
ALTER TABLE StresstestYieldCurve WITH CHECK ADD CONSTRAINT FK_StresstestYieldCurve_Name FOREIGN KEY(Name)
REFERENCES CurveConfigurationYieldCurves (CurveId)

CREATE TABLE StresstestFxSpot (
	StresstestId varchar(40) not null,
	ccypair varchar(7) not null,
	ShiftType varchar(8),
	ShiftSize decimal(18,5)
CONSTRAINT PK_StresstestFxSpot PRIMARY KEY CLUSTERED 
(
	StresstestId ASC,
	ccypair ASC
))
ALTER TABLE StresstestFxSpot WITH CHECK ADD CONSTRAINT FK_StresstestFxSpot_StresstestId FOREIGN KEY(StresstestId)
REFERENCES Stresstest (Id)
ALTER TABLE StresstestFxSpot WITH CHECK ADD CONSTRAINT FK_StresstestFxSpot_ShiftType FOREIGN KEY(ShiftType)
REFERENCES TypesShiftType (value)

CREATE TABLE StresstestFxVolatility (
	StresstestId varchar(40) not null,
	ccypair varchar(7) not null,
	ShiftType varchar(8),
	ShiftExpiries varchar(100),
	Shifts varchar(200)
CONSTRAINT PK_StresstestFxVolatility PRIMARY KEY CLUSTERED 
(
	StresstestId ASC,
	ccypair ASC
))
ALTER TABLE StresstestFxVolatility WITH CHECK ADD CONSTRAINT FK_StresstestFxVolatility_StresstestId FOREIGN KEY(StresstestId)
REFERENCES Stresstest (Id)
ALTER TABLE StresstestFxVolatility WITH CHECK ADD CONSTRAINT FK_StresstestFxVolatility_ccypair FOREIGN KEY(ccypair)
REFERENCES TypesCurrencyPair (value)
ALTER TABLE StresstestFxVolatility WITH CHECK ADD CONSTRAINT FK_StresstestFxVolatility_ShiftType FOREIGN KEY(ShiftType)
REFERENCES TypesShiftType (value)

CREATE TABLE StresstestSwaptionVolatility (
	StresstestId varchar(40) not null,
	ccy varchar(7) not null,
	ShiftType varchar(8),
	ShiftExpiries varchar(100),
	ShiftTerms varchar(100)
CONSTRAINT PK_StresstestSwaptionVolatility PRIMARY KEY CLUSTERED
(
	StresstestId ASC,
	ccy ASC
))
ALTER TABLE StresstestSwaptionVolatility WITH CHECK ADD CONSTRAINT FK_StresstestSwaptionVolatility_StresstestId FOREIGN KEY(StresstestId)
REFERENCES Stresstest (Id)
ALTER TABLE StresstestSwaptionVolatility WITH CHECK ADD CONSTRAINT FK_StresstestSwaptionVolatility_ShiftType FOREIGN KEY(ShiftType)
REFERENCES TypesShiftType (value)

CREATE TABLE StresstestCapFloorVolatility (
	StresstestId varchar(40) not null,
	ccy varchar(7) not null,
	ShiftType varchar(8),
	ShiftExpiries varchar(100),
	Shifts varchar(200)
CONSTRAINT PK_StresstestCapFloorVolatility PRIMARY KEY CLUSTERED 
(
	StresstestId ASC,
	ccy ASC
))
ALTER TABLE StresstestCapFloorVolatility WITH CHECK ADD CONSTRAINT FK_StresstestCapFloorVolatility_StresstestId FOREIGN KEY(StresstestId)
REFERENCES Stresstest (Id)
ALTER TABLE StresstestCapFloorVolatility WITH CHECK ADD CONSTRAINT FK_StresstestCapFloorVolatility_ShiftType FOREIGN KEY(ShiftType)
REFERENCES TypesShiftType (value)
ALTER TABLE StresstestCapFloorVolatility WITH CHECK ADD CONSTRAINT FK_StresstestCapFloorVolatility_ccy FOREIGN KEY(ccy)
REFERENCES TypesCurrencyCode (value)

-- relates to StresstestSwaptionVolatility
CREATE TABLE StresstestSwaptionShift (
	StresstestId varchar(40) not null,
	ccy varchar(7) not null,
	expiry varchar(7) not null,
	term varchar(7) not null,
	Shift decimal(18,5) not null
CONSTRAINT PK_StresstestSwaptionShift PRIMARY KEY CLUSTERED 
(
	StresstestId ASC,
	ccy ASC,
	expiry ASC,
	term ASC
))
ALTER TABLE StresstestSwaptionShift WITH CHECK ADD CONSTRAINT FK_StresstestSwaptionShift_StresstestId FOREIGN KEY(StresstestId, ccy)
REFERENCES StresstestSwaptionVolatility (StresstestId, ccy)

