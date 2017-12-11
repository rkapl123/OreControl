use ORE

CREATE TABLE ResultsFlows (
	addColumn("ID", string())
        .addColumn("Type", string())
        .addColumn("LegNo", Size())
        .addColumn("PayDate", Date())
        .addColumn("Amount", double(), 4)
        .addColumn("Currency", string())
        .addColumn("Coupon", double(), 10)
        .addColumn("Accrual", double(), 10)
        .addColumn("fixingDate", Date())
        .addColumn("fixingValue", double(), 10);
AnalysisID varchar(30),
TradeID,
TradeType,
LegNo,
PayDate,
Amount,
Currency,
Coupon,
Accrual,
FixingDate,
FixingValue
)

CREATE TABLE ResultsNPV (
	addColumn("TradeId", string())
        .addColumn("TradeType", string())
        .addColumn("Maturity", Date())
        .addColumn("MaturityTime", double(), 6)
        .addColumn("NPV", double(), 6)
        .addColumn("NpvCurrency", string())
        .addColumn("NPV(Base)", double(), 6)
        .addColumn("BaseCurrency", string())
        .addColumn("Notional", double(), 2)
        .addColumn("Notional(Base)", double(), 2);
AnalysisID varchar(30),
TradeID,
TradeType,
Maturity,
MaturityTime,
NPV,
NpvCurrency,
NPVBase,
BaseCurrency,
Notional,
NotionalBase
)

CREATE TABLE ResultsCurves (
AnalysisID varchar(30),
Tenor, varchar(5)
HorizonDate, date
Name, varchar(20)
Value double(), 15)
)

CREATE TABLE ResultsXVA (
	addColumn("TradeId", string())
        .addColumn("NettingSetId", string())
        .addColumn("CVA", double(), 2)
        .addColumn("DVA", double(), 2)
        .addColumn("FBA", double(), 2)
        .addColumn("FCA", double(), 2)
        .addColumn("COLVA", double(), 2)
        .addColumn("MVA", double(), 2)
        .addColumn("CollateralFloor", double(), 2)
        .addColumn("AllocatedCVA", double(), 2)
        .addColumn("AllocatedDVA", double(), 2)
        .addColumn("AllocationMethod", string())
        .addColumn("BaselEPE", double(), 2)
        .addColumn("BaselEEPE", double(), 2);
AnalysisID varchar(30),
TradeID,
NettingSetId,
CVA,
DVA,
FBA,
FCA,
COLVA,
MVA,
CollateralFloor,
AllocatedCVA,
AllocatedDVA,
AllocationMethod,
BaselEPE,
BaselEEPE
)

CREATE TABLE ResultsColVA (
	addColumn("NettingSet", string())
        .addColumn("Date", Date())
        .addColumn("Time", double(), 4)
        .addColumn("CollateralBalance", double(), 4)
        .addColumn("COLVA Increment", double(), 4)
        .addColumn("COLVA", double(), 4)
        .addColumn("CollateralFloor Increment", double(), 4)
        .addColumn("CollateralFloor", double(), 4);
AnalysisID varchar(30),
NettingSet,
HorizonDate,
HorizonTime,
CollateralBalance,
COLVAIncrement,
COLVA,
CollateralFloorIncrement,
CollateralFloor
)

CREATE TABLE ResultsExposureNettingSet (
	addColumn("NettingSet", string())
        .addColumn("Date", Date())
        .addColumn("Time", double(), 6)
        .addColumn("EPE", double(), 2)
        .addColumn("ENE", double(), 2)
        .addColumn("PFE", double(), 2)
        .addColumn("ExpectedCollateral", double(), 2)
        .addColumn("BaselEE", double(), 2)
        .addColumn("BaselEEE", double(), 2);
AnalysisID varchar(30),
NettingSet,
HorizonDate,
HorizonTime,
EPE,
ENE,
PFE,
ExpectedCollateral,
BaselEE,
BaselEEE
)

CREATE TABLE ResultsExposureTrade (
	addColumn("TradeId", string())
        .addColumn("Date", Date())
        .addColumn("Time", double(), 6)
        .addColumn("EPE", double())
        .addColumn("ENE", double())
        .addColumn("AllocatedEPE", double())
        .addColumn("AllocatedENE", double())
        .addColumn("PFE", double())
        .addColumn("BaselEE", double())
        .addColumn("BaselEEE", double());
AnalysisID varchar(30),
TradeId,
HorizonDate,
HorizonTime,
EPE,
ENE,
AllocatedEPE,
AllocatedENE,
PFE,
BaselEE,
BaselEEE
)

CREATE TABLE ResultsCube (

AnalysisID varchar(30),
NetOrRaw varchar(3),
	"%s,%s,%lu,%s,%lu,%lu,%.4f\n";
ID,
NettingSet,
DateIndex,
HorizonDate,
Sample,
Depth,
Value
)

CREATE TABLE ResultsStresstest (
	    report->addColumn("TradeId", string());
    report->addColumn("ScenarioLabel", string());
    report->addColumn("Base NPV", double(), 2);
    report->addColumn("Scenario NPV", double(), 2);
    report->addColumn("Sensitivity", double(), 2);
AnalysisID varchar(30),
TradeId,
ScenarioLabel,
BaseNPV,
ScenarioNPV,
Sensitivity
)

CREATE TABLE ResultsSensitivity (
	    report->addColumn("TradeId", string());
    report->addColumn("Factor", string());
    report->addColumn("ShiftSize", double(), 6);
    report->addColumn("Base NPV", double(), 2);
    report->addColumn("Delta*Shift", double(), 2);
    report->addColumn("Gamma*Shift^2", double(), 2);
AnalysisID varchar(30),
TradeId,
Factor,
ShiftSize,
BaseNPV,
DeltaTimesShift,
GammaTimesShiftSquare
)

CREATE TABLE ResultsScenario (
	    report->addColumn("TradeId", string());
    report->addColumn("Factor", string());
    report->addColumn("Up/Down", string());
    report->addColumn("Base NPV", double(), 2);
    report->addColumn("Scenario NPV", double(), 2);
    report->addColumn("Difference", double(), 2);
AnalysisID varchar(30),
TradeId,
Factor,
UpDown,
BaseNPV,
ScenarioNPV,
Difference
)

CREATE TABLE ResultsCrossGamma (
	    report->addColumn("TradeId", string());
    report->addColumn("Factor 1", string());
    report->addColumn("ShiftSize1", double(), 6);
    report->addColumn("Factor 2", string());
    report->addColumn("ShiftSize2", double(), 6);
    report->addColumn("Base NPV", double(), 2);
    report->addColumn("CrossGamma*Shift^2", double(), 2);
AnalysisID varchar(30),
TradeId,
Factor1,
ShiftSize1,
Factor2,
ShiftSize2,
BaseNPV,
CrossGammaTimesShiftSquare
)

CREATE TABLE ResultsDimEvolution (
	addColumn("TimeStep", Size())
        .addColumn("Date", Date())
        .addColumn("DaysInPeriod", Size())
        .addColumn("ZeroOrderDIM", Real(), 6)
        .addColumn("AverageDIM", Real(), 6)
        .addColumn("AverageFLOW", Real(), 6)
        .addColumn("SimpleDIM", Real(), 6);
AnalysisID varchar(30),
TimeStep,
HorizonDate,
DaysInPeriod,
ZeroOrderDIM,
AverageDIM,
AverageFLOW,
SimpleDIM
)

CREATE TABLE ResultsDimRegression (
	regReport->addColumn("Sample", Size());
	addColumn("RegressionDIM", Real(), 6)
            .addColumn("LocalDIM", Real(), 6)
            .addColumn("ExpectedDIM", Real(), 6)
            .addColumn("ZeroOrderDIM", Real(), 6)
            .addColumn("DeltaNPV", Real(), 6)
            .addColumn("SimpleDIM", Real(), 6);
AnalysisID varchar(30),
Sample,
RegressorName,
RegressorValue,
RegressionDIM,
LocalDIM,
ExpectedDIM,
ZeroOrderDIM,
DeltaNPV,
SimpleDIM
)
