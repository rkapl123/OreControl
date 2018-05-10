%module oreappSwigWrapper
%include stl.i
%include oredata.i

%{
#include "../../../Engine/OREAnalytics/orea/app/oreapp.hpp"
%}

/* Parse the header file to generate wrappers, ignoring below methods */
%ignore OREApp(boost::shared_ptr<Parameters> params, std::ostream& out);
%ignore OREApp(boost::shared_ptr<Parameters> params);
%ignore run();
%ignore readSetup();
%ignore setupLog();
%ignore getConventions();
%ignore getMarketParameters();
%ignore buildMarket();
%ignore buildEngineFactory(const boost::shared_ptr<Market>& market, const string& groupName = "setup");
%ignore buildTradeFactory();
%ignore buildPortfolio(const boost::shared_ptr<EngineFactory>& factory);
%ignore generateNPVCube();
%ignore initAggregationScenarioData();
%ignore initCube();
%ignore buildNPVCube();
%ignore getSimMarketData();
%ignore getScenarioGeneratorData();
%ignore buildScenarioGenerator(boost::shared_ptr<Market> market,
                               boost::shared_ptr<ScenarioSimMarketParameters> simMarketData,
                               boost::shared_ptr<ScenarioGeneratorData> sgd);
%ignore loadScenarioData();
%ignore loadCube();
%ignore runPostProcessor();
%ignore runSensitivityAnalysis();
%ignore runStressTest();
%ignore runParametricVar();
%ignore writeInitialReports();
%ignore writeXVAReports();
%ignore writeDIMReport();
%ignore writeCube();
%ignore writeScenarioData();
%ignore writeBaseScenario();
%ignore initNettingSetManager();
%ignore writeAdditionalReports();
%include "../../../Engine/OREAnalytics/orea/app/oreapp.hpp"

namespace std {
    %template(DoubleVector) vector<double>;
    %template(StrVector) vector<string>;
}

