use ORE

CREATE TABLE MarketDataDefinitions (
	QuoteId int not null,
	InstrumentType varchar(30) not null,
	QuoteType varchar(30) not null,
	Currency varchar(7),
	UnitCurrency varchar(7),
	TargetCurrency varchar(7),
	CurveId varchar(30),
	DayCounter varchar(10),
	Tenor varchar(10),
	ZeroDate datetime,
	DiscountDate datetime,
	ForwardStart varchar(10),
	Term varchar(10),
	Expiry varchar(10),
	ExpiryDate datetime,
	StrikeType varchar(10),
	Contract varchar(10),
	FlatTenor varchar(10),
	FlatCurrency varchar(7),
	Issuer varchar(10),
	Seniority varchar(10),
	SecurityID varchar(10),
	Rating varchar(10),
	IndexTenor varchar(10),
	Atm int,
	Relative int,
	Dimension varchar(10),
	Name varchar(30),
	Maturity varchar(10),
	MaturityDate datetime,
	IndexName varchar(30),
	CapFloor varchar(1),
	StrikeRate decimal(18,6),
	CorrFactType varchar(10),
	CorrFactMonth varchar(10),
	Quote varchar(200)
CONSTRAINT PK_MarketDataDefinitions PRIMARY KEY CLUSTERED
(
	QuoteId ASC
))
ALTER TABLE MarketDataDefinitions WITH CHECK ADD CONSTRAINT FK_MarketDataDefinitions_Currency FOREIGN KEY(Currency)
REFERENCES TypesCurrencyCode (value)
ALTER TABLE MarketDataDefinitions WITH CHECK ADD CONSTRAINT FK_MarketDataDefinitions_UnitCurrency FOREIGN KEY(UnitCurrency)
REFERENCES TypesCurrencyCode (value)
ALTER TABLE MarketDataDefinitions WITH CHECK ADD CONSTRAINT FK_MarketDataDefinitions_TargetCurrency FOREIGN KEY(TargetCurrency)
REFERENCES TypesCurrencyCode (value)
ALTER TABLE MarketDataDefinitions WITH CHECK ADD CONSTRAINT FK_MarketDataDefinitions_FlatCurrency FOREIGN KEY(FlatCurrency)
REFERENCES TypesCurrencyCode (value)

CREATE TABLE MarketData (
	QuoteId int not null,
	QuoteDate date not null,
	QuoteValue decimal(18,6) not null

CONSTRAINT PK_MarketData PRIMARY KEY CLUSTERED 
(
	QuoteId ASC,
	QuoteDate ASC
))
ALTER TABLE MarketData WITH CHECK ADD CONSTRAINT FK_MarketData_QuoteId FOREIGN KEY(QuoteId)
REFERENCES MarketDataDefinitions (QuoteId)

CREATE TABLE FixingDataDefinitions (
	IndexId int not null,
	Currency varchar(7),
	IndexName varchar(30),
	IsCMS int,
	Source varchar(10),
	ForeignCurrency varchar(7),
	DomesticCurrency varchar(7),
	Tenor varchar(10),
	Name varchar(10),
	FixingIndex varchar(200)

CONSTRAINT PK_FixingDataDefinitions PRIMARY KEY CLUSTERED 
(
	IndexId ASC
))
ALTER TABLE FixingDataDefinitions WITH CHECK ADD CONSTRAINT FK_FixingDataDefinitions_Currency FOREIGN KEY(Currency)
REFERENCES TypesCurrencyCode (value)
ALTER TABLE FixingDataDefinitions WITH CHECK ADD CONSTRAINT FK_FixingDataDefinitions_ForeignCurrency FOREIGN KEY(ForeignCurrency)
REFERENCES TypesCurrencyCode (value)
ALTER TABLE FixingDataDefinitions WITH CHECK ADD CONSTRAINT FK_FixingDataDefinitions_DomesticCurrency FOREIGN KEY(DomesticCurrency)
REFERENCES TypesCurrencyCode (value)

CREATE TABLE FixingData (
	IndexId int not null,
	FixingDate datetime not null,
	IndexValue decimal(18,6) not null

CONSTRAINT PK_FixingData PRIMARY KEY CLUSTERED 
(
	IndexId ASC,
	FixingDate ASC
))

CREATE TABLE CovarianceData (
	QuoteId1 varchar(100) not null,
	QuoteId2 varchar(100) not null,
	QuoteValue decimal(18,6) not null

CONSTRAINT PK_CovarianceDataData PRIMARY KEY CLUSTERED 
(
	QuoteId1 ASC,
	QuoteId2 ASC
))
