#include "TreeizeRelDTest.hpp"

using namespace TreeizeRelD;
using namespace boost::unit_test_framework;

namespace testsuite {

void TreeizeRelDTest::testTreeizeRelData() {
    try
    {
        debug_settings ds;
        ds.load("test.xml");
        ds.save("debug_settings_out.xml");
        std::cout << "Success\n";
    }
    catch (std::exception &e)
    {
        std::cout << "Error: " << e.what() << "\n";
    }
}

test_suite* TreeizeRelDTest::suite() {
    test_suite* suite = BOOST_TEST_SUITE("TreeizeRelDTest");

    suite->add(BOOST_TEST_CASE(&TreeizeRelDTest::testTreeizeRelData));

    return suite;
}
} // namespace testsuite
