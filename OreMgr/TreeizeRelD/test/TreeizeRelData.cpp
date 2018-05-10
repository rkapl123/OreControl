#include "TreeizeRelData.hpp"

using namespace TreeizeRelD;
using namespace boost::unit_test_framework;

namespace testsuite {

void TreeizeRelData::testTreeizeRelData() {

}

test_suite* TreeizeRelData::suite() {
    test_suite* suite = BOOST_TEST_SUITE("TreeizeRelData tests");

    suite->add(BOOST_TEST_CASE(&TreeizeRelData::testTreeizeRelData));

    return suite;
}
} // namespace testsuite
