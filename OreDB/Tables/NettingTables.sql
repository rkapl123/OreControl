use ORE;

CREATE TABLE NettingSet (
	NettingSetId varchar(30) NOT NULL,
	GroupingId varchar(70) NOT NULL,
	Counterparty varchar(30) NOT NULL,
	ActiveCSAFlag varchar(5) NOT NULL,
CONSTRAINT PK_NettingSet PRIMARY KEY CLUSTERED 
(
	NettingSetId ASC
));
ALTER TABLE NettingSet ADD CONSTRAINT FK_NettingSet_ActiveCSAFlag FOREIGN KEY(ActiveCSAFlag)
REFERENCES TypesBool (value);
ALTER TABLE NettingSet ADD CONSTRAINT FK_NettingSet_Counterparty FOREIGN KEY(Counterparty)
REFERENCES TypesParties (value);

CREATE TABLE NettingCSADetails (
	NettingSetId varchar(30) NOT NULL,
	Bilateral varchar(10),
	CSACurrency varchar(7),
	IndexName varchar(30),
	ThresholdPay decimal(18,3),
	ThresholdReceive decimal(18,3),
	MinimumTransferAmountPay decimal(18,3),
	MinimumTransferAmountReceive decimal(18,3),
	IndependentAmountHeld decimal(18,3),
	IndependentAmountType varchar(10),
	CallFrequency varchar(5),
	PostFrequency varchar(5),
	MarginPeriodOfRisk varchar(5),
	CollateralCompoundingSpreadReceive decimal(9,6),
	CollateralCompoundingSpreadPay decimal(9,6),
CONSTRAINT PK_NettingCSADetails PRIMARY KEY CLUSTERED 
(
	NettingSetId ASC
));
ALTER TABLE NettingCSADetails ADD CONSTRAINT FK_NettingCSADetails_NettingSetId FOREIGN KEY(NettingSetId)
REFERENCES NettingSet (NettingSetId);
ALTER TABLE NettingCSADetails ADD CONSTRAINT FK_NettingCSADetails_Bilateral FOREIGN KEY(Bilateral)
REFERENCES TypesCSAType (value);
ALTER TABLE NettingCSADetails ADD CONSTRAINT FK_NettingCSADetails_CSACurrency FOREIGN KEY(CSACurrency)
REFERENCES TypesCurrencyCode (value);
ALTER TABLE NettingCSADetails ADD CONSTRAINT FK_NettingCSADetails_IndexName FOREIGN KEY(IndexName)
REFERENCES TypesIndexName (value);
ALTER TABLE NettingCSADetails ADD CONSTRAINT FK_NettingCSADetails_IndependentAmountType FOREIGN KEY(IndependentAmountType)
REFERENCES TypesIndependentAmountType (value);
ALTER TABLE NettingCSADetails ADD CONSTRAINT CK_NettingCSADetails_ThresholdPay CHECK (ThresholdPay>=0);
ALTER TABLE NettingCSADetails ADD CONSTRAINT CK_NettingCSADetails_ThresholdReceive CHECK (ThresholdReceive>=0);
ALTER TABLE NettingCSADetails ADD CONSTRAINT CK_NettingCSADetails_MinimumTransferAmountPay CHECK (MinimumTransferAmountPay>=0);
ALTER TABLE NettingCSADetails ADD CONSTRAINT CK_NettingCSADetails_MinimumTransferAmountReceive CHECK (MinimumTransferAmountReceive>=0);

CREATE TABLE NettingEligibleCollateralsCurrencies (
	NettingSetId varchar(30) NOT NULL,
	Currency varchar(7) NOT NULL,
CONSTRAINT PK_NettingEligibleCollateralsCurrencies PRIMARY KEY CLUSTERED 
(
	NettingSetId ASC,
	Currency ASC
));
ALTER TABLE NettingEligibleCollateralsCurrencies ADD CONSTRAINT FK_NettingEligibleCollateralsCurrencies_NettingSetId FOREIGN KEY(NettingSetId)
REFERENCES NettingSet (NettingSetId);
ALTER TABLE NettingEligibleCollateralsCurrencies ADD CONSTRAINT FK_NettingEligibleCollateralsCurrencies_Currency FOREIGN KEY(Currency)
REFERENCES TypesCurrencyCode (value);
