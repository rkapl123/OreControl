use ORE;

CREATE TABLE MdatMarketDataDefinitions (
	QuoteId int not null,
	Quote varchar(100) not null,
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
CONSTRAINT PK_MarketDataDefinitions PRIMARY KEY CLUSTERED
(
	QuoteId ASC
));
ALTER TABLE MdatMarketDataDefinitions ADD CONSTRAINT FK_MdatMarketDataDefinitions_Currency FOREIGN KEY(Currency)
REFERENCES TypesCurrencyCode (value);
ALTER TABLE MdatMarketDataDefinitions ADD CONSTRAINT FK_MdatMarketDataDefinitions_UnitCurrency FOREIGN KEY(UnitCurrency)
REFERENCES TypesCurrencyCode (value);
ALTER TABLE MdatMarketDataDefinitions ADD CONSTRAINT FK_MdatMarketDataDefinitions_TargetCurrency FOREIGN KEY(TargetCurrency)
REFERENCES TypesCurrencyCode (value);
ALTER TABLE MdatMarketDataDefinitions ADD CONSTRAINT FK_MdatMarketDataDefinitions_FlatCurrency FOREIGN KEY(FlatCurrency)
REFERENCES TypesCurrencyCode (value);
CREATE UNIQUE INDEX IX_MdatMarketDataDefinitions_Quote ON MdatMarketDataDefinitions (Quote); 

CREATE TABLE MdatMarketData (
	QuoteId int not null,
	QuoteDate date not null,
	QuoteValue decimal(18,6) not null,
CONSTRAINT PK_MdatMarketData PRIMARY KEY CLUSTERED 
(
	QuoteId ASC,
	QuoteDate ASC
));
ALTER TABLE MdatMarketData ADD CONSTRAINT FK_MdatMarketData_QuoteId FOREIGN KEY(QuoteId)
REFERENCES MdatMarketDataDefinitions (QuoteId);


CREATE TABLE MdatFixingDataDefinitions (
	IndexId int not null,
	Currency varchar(7),
	IndexName varchar(30),
	IsCMS int,
	Source varchar(10),
	ForeignCurrency varchar(7),
	DomesticCurrency varchar(7),
	Tenor varchar(10),
	Name varchar(10),
	FixingIndex varchar(200),
CONSTRAINT PK_MdatFixingDataDefinitions PRIMARY KEY CLUSTERED 
(
	IndexId ASC
));
ALTER TABLE MdatFixingDataDefinitions ADD CONSTRAINT FK_MdatFixingDataDefinitions_Currency FOREIGN KEY(Currency)
REFERENCES TypesCurrencyCode (value);
ALTER TABLE MdatFixingDataDefinitions ADD CONSTRAINT FK_MdatFixingDataDefinitions_ForeignCurrency FOREIGN KEY(ForeignCurrency)
REFERENCES TypesCurrencyCode (value);
ALTER TABLE MdatFixingDataDefinitions ADD CONSTRAINT FK_MdatFixingDataDefinitions_DomesticCurrency FOREIGN KEY(DomesticCurrency)
REFERENCES TypesCurrencyCode (value);


CREATE TABLE MdatFixingData (
	IndexId int not null,
	FixingDate datetime not null,
	IndexValue decimal(18,6) not null,
CONSTRAINT PK_MdatFixingData PRIMARY KEY CLUSTERED
(
	IndexId ASC,
	FixingDate ASC
));
ALTER TABLE MdatFixingData ADD CONSTRAINT FK_MdatFixingData_IndexId FOREIGN KEY(IndexId)
REFERENCES MdatFixingDataDefinitions (IndexId);

CREATE TABLE MdatCovarianceData (
	QuoteId1 varchar(100) not null,
	QuoteId2 varchar(100) not null,
	QuoteValue decimal(18,6) not null,
CONSTRAINT PK_MdatCovarianceDataData PRIMARY KEY CLUSTERED 
(
	QuoteId1 ASC,
	QuoteId2 ASC
));
