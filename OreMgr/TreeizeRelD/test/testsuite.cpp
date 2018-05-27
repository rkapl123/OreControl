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

BOOST_AUTO_TEST_CASE(writeTree1)
{
    // control table:                                   parentNode, subnodeOfParent, primaryKey, foreignKey, rootElemRec
    std::vector<std::vector<std::string>> control = { {"root",      "",              "a",        "",         "rec" },
                                                      {"root.rec",  "",              "",         "a",        "b" } };
    // table data[1] has child relation to table data[0] via FK/PK "a"
    std::vector<std::vector<std::vector<std::string>>> data = { { {"a",     "b","c.d" },
                                                                {  "dataA1","", "dataCD1" },
                                                                {  "dataA2","", "dataCD2" } },
                                                                { {"b.<xmlattr>.attr","b",     "a" },
                                                                {  "attB1",           "dataB1","dataA1" },
                                                                {  "attB2",           "dataB2","dataA1" },
                                                                {  "attB3",           "dataB3","dataA2" },
                                                                {  "attB4",           "dataB4","dataA2" }, } };
    pt::ptree testTree;
    BOOST_TEST(TreeizeRelD::writeTree(control, data, testTree) == "");
    std::string resultStr;
    BOOST_TEST(TreeizeRelD::createXML(testTree, resultStr) == "");
    BOOST_TEST(resultStr == "<root><rec><a>dataA1</a><b attr=\"attB1\">dataB1</b><b attr=\"attB2\">dataB2</b><c><d>dataCD1</d></c></rec><rec><a>dataA2</a><b attr=\"attB3\">dataB3</b><b attr=\"attB4\">dataB4</b><c><d>dataCD2</d></c></rec></root>");
}

BOOST_AUTO_TEST_CASE(writeTable)
{
    std::vector<std::vector<std::string>> data = { { "a","b","c.d" },{ "dataA1","dataB1","dataCD1" },{ "dataA2","dataB2","dataCD2" } };
    pt::ptree testTree;
    BOOST_TEST(TreeizeRelD::writeTable(testTree, data, "b", "row") == "");
    std::string resultStr;
    BOOST_TEST(TreeizeRelD::createXML(testTree, resultStr) == "");
    BOOST_TEST(resultStr == "<dataB1><row><a>dataA1</a><c><d>dataCD1</d></c></row></dataB1><dataB2><row><a>dataA2</a><c><d>dataCD2</d></c></row></dataB2>");
}

BOOST_AUTO_TEST_CASE(writeRecord1)
{
    std::vector<std::string> header = { "a","b","c.d" };
    std::vector<std::string> dataRow = { "dataA","dataB","dataCD" };
    pt::ptree testTree; std::string rowsFK;
    BOOST_TEST(TreeizeRelD::writeRecord(testTree, dataRow, header, "b", rowsFK) == "");
    std::string resultStr;
    BOOST_TEST(TreeizeRelD::createXML(testTree, resultStr) == "");
    BOOST_TEST(resultStr == "<a>dataA</a><c><d>dataCD</d></c>");
    BOOST_TEST(rowsFK == "dataB");
}

BOOST_AUTO_TEST_CASE(writeRecord2)
{
    std::vector<std::string> header = { "a.<xmlattr>.attr","b","c.d" };
    std::vector<std::string> dataRow = { "dataA","dataB","dataCD" };
    pt::ptree testTree; std::string rowsFK;
    BOOST_TEST(TreeizeRelD::writeRecord(testTree, dataRow, header, "", rowsFK) == "");
    std::string resultStr;
    BOOST_TEST(TreeizeRelD::createXML(testTree, resultStr) == "");
    BOOST_TEST(resultStr == "<a attr=\"dataA\"/><b>dataB</b><c><d>dataCD</d></c>");
    BOOST_TEST(rowsFK == "");
}