/*! \file testsuite.cpp
    \brief wrapper calling all individual test cases
    \ingroup
*/

#include <iomanip>
#include <iostream>
using namespace std;

// Boost
#include <boost/make_shared.hpp>
#include <boost/timer.hpp>
using namespace boost;

// Boost.Test
#include <boost/test/parameterized_test.hpp>
#include <boost/test/test_tools.hpp>
#include <boost/test/unit_test.hpp>
using boost::unit_test::test_suite;

#include <oret/oret.hpp>

#ifdef BOOST_MSVC
#define BOOST_LIB_NAME boost_date_time
#include <boost/config/auto_link.hpp>
#define BOOST_LIB_NAME boost_serialization
#include <boost/config/auto_link.hpp>
#define BOOST_LIB_NAME boost_regex
#include <boost/config/auto_link.hpp>
#define BOOST_LIB_NAME boost_system
#include <boost/config/auto_link.hpp>
#define BOOST_LIB_NAME boost_filesystem
#include <boost/config/auto_link.hpp>
#endif

// Lib test suites
#include "TreeizeRelData.hpp"


namespace {

boost::timer t;

void startTimer() { t.restart(); }
void stopTimer() {
    double seconds = t.elapsed();
    int hours = int(seconds / 3600);
    seconds -= hours * 3600;
    int minutes = int(seconds / 60);
    seconds -= minutes * 60;
    std::cout << endl << " TreeizeRelData tests completed in ";
    if (hours > 0)
        cout << hours << " h ";
    if (hours > 0 || minutes > 0)
        cout << minutes << " m ";
    cout << fixed << setprecision(0) << seconds << " s" << endl << endl;
}
} // namespace

test_suite* init_unit_test_suite(int, char* []) {

    // Get command line arguments
    int argc = boost::unit_test::framework::master_test_suite().argc;
    char** argv = boost::unit_test::framework::master_test_suite().argv;
    // Set up test logging
    ore::test::setupTestLogging(argc, argv);

    test_suite* test = BOOST_TEST_SUITE("TreeizeRelDataTestSuite");

    test->add(BOOST_TEST_CASE(startTimer));
    test->add(testsuite::TreeizeRelData::suite());

    test->add(BOOST_TEST_CASE(stopTimer));

    return test;
}
