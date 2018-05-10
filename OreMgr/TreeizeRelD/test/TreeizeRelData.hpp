
#pragma once

#include <treeizeRelD/treeizeRelD.hpp>

#include <boost/test/unit_test.hpp>

namespace testsuite {
//! Test treeizeRelD functions
/*!
  
 */
class TreeizeRelData {
public:
    //! Test storing and retrieving a few artificial data points
    static void testTreeizeRelData();
    static boost::unit_test_framework::test_suite* suite();
};
} // namespace testsuite
