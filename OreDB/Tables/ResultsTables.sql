use ORE;

CREATE TABLE ResultsFlows (
	AnalysisID varchar(30) not null,
	AnalysisDate datetime not null,
	TradeID varchar(40) not null,
	TradeType varchar(30) not null,
	CashflowNo int not null,
	LegNo int not null,
	PayDate datetime not null,
	FlowType varchar(30) not null,
	Amount decimal(18,4) null,
	Currency varchar(3) null,
	Coupon decimal(18,9) null,
	Accrual decimal(18,4) null,
	FixingDate datetime null,
	FixingValue decimal(18,9) null,
	Notional decimal(18,4) null
);

CREATE TABLE ResultsNPV (
	AnalysisID varchar(30) not null,
	AnalysisDate datetime not null,
	TradeID varchar(40) not null,
	TradeType varchar(30) not null,
	Maturity datetime null,
	MaturityTime decimal(18,9) null,
	NPV decimal(18,4) null,
	NpvCurrency varchar(3) null,
	NPVBase decimal(18,4) null,
	BaseCurrency varchar(3) null,
	Notional decimal(18,4) null,
	NotionalBase decimal(18,4) null,
	NettingSetId varchar(30) null,
	CounterParty varchar(30) null
);

CREATE TABLE ResultsCurves (
	AnalysisID varchar(30) not null,
	AnalysisDate datetime not null,
	Tenor varchar(10) null,
	HorizonDate datetime null,
	Name varchar(20) null,
	Value decimal(18,9) null
);

CREATE TABLE ResultsXVA (
	AnalysisID varchar(30) not null,
	AnalysisDate datetime not null,
	TradeID varchar(40) null,
	NettingSetId varchar(30) null,
	CVA decimal(18,4) null,
	DVA decimal(18,4) null,
	FBA decimal(18,4) null,
	FCA decimal(18,4) null,
	FBAexOwn decimal(18,4) null,
	FCAexOwn decimal(18,4) null,
	FBAexAll decimal(18,4) null,
	FCAexAll decimal(18,4) null,
	COLVA decimal(18,4) null,
	MVA decimal(18,4) null,
	KVACCR decimal(18,4) null,
	CollateralFloor decimal(18,4) null,
	AllocatedCVA decimal(18,4) null,
	AllocatedDVA decimal(18,4) null,
	AllocationMethod  varchar(10) null,
	BaselEPE decimal(18,4) null,
	BaselEEPE decimal(18,4) null
);

CREATE TABLE ResultsColVA (
	AnalysisID varchar(30) not null,
	AnalysisDate datetime not null,
	NettingSetId varchar(30) null,
	HorizonDate datetime null,
	HorizonTime decimal(18,6) null,
	CollateralBalance decimal(18,4) null,
	COLVAIncrement decimal(18,4) null,
	COLVA decimal(18,4) null,
	CollateralFloorIncrement decimal(18,4) null,
	CollateralFloor decimal(18,4) null
);

CREATE TABLE ResultsExposureNettingSet (
	AnalysisID varchar(30) not null,
	AnalysisDate datetime not null,
	NettingSetId varchar(30) null,
	HorizonDate datetime null,
	HorizonTime decimal(18,6) null,
	EPE decimal(18,4) null,
	ENE decimal(18,4) null,
	PFE decimal(18,4) null,
	ExpectedCollateral decimal(18,4) null,
	BaselEE decimal(18,4) null,
	BaselEEE decimal(18,4) null
);

CREATE TABLE ResultsExposureTrade (
	AnalysisID varchar(30) not null,
	AnalysisDate datetime not null,
	TradeID varchar(40) null,
	HorizonDate datetime null,
	HorizonTime decimal(18,6) null,
	EPE decimal(18,4) null,
	ENE decimal(18,4) null,
	AllocatedEPE decimal(18,4) null,
	AllocatedENE decimal(18,4) null,
	PFE decimal(18,4) null,
	BaselEE decimal(18,4) null,
	BaselEEE decimal(18,4) null
);

CREATE TABLE ResultsCube (
	AnalysisID varchar(30) not null,
	AnalysisDate datetime not null,
	NetOrRaw varchar(3) null,
	ID varchar(40) null,
	NettingSet varchar(10) null,
	DateIndex int null,
	HorizonDate datetime null,
	Sample int null,
	Depth int null,
	Value decimal(18,4) null
);

CREATE TABLE ResultsStresstest (
	AnalysisID varchar(30) not null,
	AnalysisDate datetime not null,
	TradeId varchar(40) null,
	ScenarioLabel varchar(20) null,
	BaseNPV decimal(18,4) null,
	ScenarioNPV decimal(18,4) null,
	Sensitivity decimal(18,4) null
);

CREATE TABLE ResultsSensitivity (
	AnalysisID varchar(30) not null,
	AnalysisDate datetime not null,
	TradeId varchar(40) null,
	Factor varchar(30) null,
	ShiftSize decimal(18,4) null,
	BaseNPV decimal(18,4) null,
	DeltaTimesShift decimal(18,4) null,
	GammaTimesShiftSquare decimal(18,4) null
);

CREATE TABLE ResultsScenario (
	AnalysisID varchar(30) not null,
	AnalysisDate datetime not null,
	TradeId varchar(40) null,
	Factor varchar(30) null,
	UpDown varchar(5) null,
	BaseNPV decimal(18,4) null,
	ScenarioNPV decimal(18,4) null,
	Difference decimal(18,4) null
);

CREATE TABLE ResultsCrossGamma (
	AnalysisID varchar(30) not null,
	AnalysisDate datetime not null,
	TradeId varchar(40) null,
	Factor1 varchar(20) null,
	ShiftSize1 decimal(18,4) null,
	Factor2 varchar(20) null,
	ShiftSize2 decimal(18,4) null,
	BaseNPV decimal(18,4) null,
	CrossGammaTimesShiftSquare decimal(18,4) null
);

CREATE TABLE ResultsDimEvolution (
	AnalysisID varchar(30) not null,
	AnalysisDate datetime not null,
	TimeStep int null,
	HorizonDate datetime null,
	DaysInPeriod int null,
	ZeroOrderDIM decimal(18,4) null,
	AverageDIM decimal(18,4) null,
	AverageFLOW decimal(18,4) null,
	SimpleDIM decimal(18,4) null
);

CREATE TABLE ResultsDimRegression (
	AnalysisID varchar(30) not null,
	AnalysisDate datetime not null,
	Sample int null,
	RegressorName varchar(30) null,
	RegressorValue decimal(18,4) null,
	RegressionDIM decimal(18,4) null,
	LocalDIM decimal(18,4) null,
	ExpectedDIM decimal(18,4) null,
	ZeroOrderDIM decimal(18,4) null,
	DeltaNPV decimal(18,4) null,
	SimpleDIM decimal(18,4) null
);
