#define BOOST_TEST_MODULE TreeizeRelDTest
#include <treeizeRelD/TreeizeRelD.hpp>
using namespace std;

// Boost.Test
#include <boost/test/included/unit_test.hpp>
using boost::unit_test::test_suite;

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

BOOST_AUTO_TEST_CASE(writeTree)
{
    // table data[1] has child relation to table data[0] via FK/PK "a"
    std::vector<std::vector<std::vector<std::string>>> data = { { { "a","b","c.d" },
                                                                { "dataA1","","dataCD1" },
                                                                { "dataA2","","dataCD2" } },
                                                                { { "b.<xmlattr>.attr","b","a" },
                                                                { "attB1","dataB1","dataA1" },
                                                                { "attB2","dataB2","dataA1" },
                                                                { "attB3","dataB3","dataA2" },
                                                                { "attB4","dataB4","dataA2" }, } };
    pt::ptree testTree;
    bool dummy = TreeizeRelD::writeTable(testTree, data[0], "a", "", "p_row");
    dummy = TreeizeRelD::writeTable(testTree, data[1], "", "a", "a");
    BOOST_TEST_MESSAGE("tree:") << TreeizeRelD::createXML(testTree);
}

BOOST_AUTO_TEST_CASE(writeTable)
{
    std::vector<std::vector<std::string>> data = { { "a","b","c.d" },{ "dataA1","dataB1","dataCD1" },{ "dataA2","dataB2","dataCD2" } };
    pt::ptree testTree;
    bool dummy = TreeizeRelD::writeTable(testTree, data, "", "b", "row");
    BOOST_TEST(TreeizeRelD::createXML(testTree) == "<row><a>dataA1</a><c><d>dataCD1</d></c></row><row><a>dataA2</a><c><d>dataCD2</d></c></row>");
}

BOOST_AUTO_TEST_CASE(writeRecord)
{
    std::vector<std::string> header = { "a","b","c.d" };
    std::vector<std::string> dataRow = { "dataA","dataB","dataCD" };

    pt::ptree testTree;
    std::string rowsFK; std::string rowsPK;
    bool dummy = TreeizeRelD::writeRecord(testTree, dataRow, header, "", rowsPK, "b", rowsFK);
    BOOST_TEST(TreeizeRelD::createXML(testTree) == "<a>dataA</a><c><d>dataCD</d></c>");
    BOOST_TEST(rowsPK == "");
    BOOST_TEST(rowsFK == "dataB");

    testTree = pt::ptree();
    header = { "a.<xmlattr>.attr","b","c.d" };
    dataRow = { "dataA","dataB","dataCD" };
    dummy = TreeizeRelD::writeRecord(testTree, dataRow, header, "a.<xmlattr>.attr", rowsPK, "", rowsFK);
    BOOST_TEST(TreeizeRelD::createXML(testTree) == "<a attr=\"dataA\"/><b>dataB</b><c><d>dataCD</d></c>");
    BOOST_TEST(rowsPK == "dataA");
    BOOST_TEST(rowsFK == "");
}
