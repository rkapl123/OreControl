#define BOOST_TEST_MODULE TreeizeRelDTest
#include <TreeizeRelD.hpp>
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

//BOOST_AUTO_TEST_CASE(writeXMLSimpleTableRelation)
//{
//    // control table:                                   parentNode, subnodeOfParent, primaryKey, foreignKey, rootElemRec
//    std::vector<std::vector<std::string>> control = { {"root",      "",              "a",        "",         "rec" },
//                                                      {"root.rec",  "",              "",         "a",        "b" } };
//    // table data[1] has child relation to table data[0] via FK/PK "a"
//    std::vector<std::vector<std::vector<std::string>>> data = { { {"a",     "b","c.d" },
//                                                                {  "dataA1","", "dataCD1" },
//                                                                {  "dataA2","", "dataCD2" } },
//                                                                { {"b.<xmlattr>.attr","b",     "a" },
//                                                                {  "attB1",           "dataB1","dataA1" },
//                                                                {  "attB2",           "dataB2","dataA1" },
//                                                                {  "attB3",           "dataB3","dataA2" },
//                                                                {  "attB4",           "dataB4","dataA2" }, } };
//    // invocation with result (0 success, 1 failure) and resultString is due to SWIG implementation..
//    int result = 0;
//    std::string resultString = TreeizeRelD::writeTreeAndCreateXML(control, data, &result);
//    BOOST_TEST(result == 0);
//    BOOST_TEST(resultString == "<root><rec><a>dataA1</a><b attr=\"attB1\">dataB1</b><b attr=\"attB2\">dataB2</b><c><d>dataCD1</d></c></rec><rec><a>dataA2</a><b attr=\"attB3\">dataB3</b><b attr=\"attB4\">dataB4</b><c><d>dataCD2</d></c></rec></root>");
//}
//
//BOOST_AUTO_TEST_CASE(writeXMLFailSubNodeNotFoundInParent)
//{
//    // control table:                                   parentNode, subnodeOfParent, primaryKey, foreignKey, rootElemRec
//    std::vector<std::vector<std::string>> control = { {"root",      "",              "a",        "",         "rec" },
//                                                      {"root.rec",  "sub",              "",         "a",        "b" } };
//    // table data[1] has child relation to table data[0] via FK/PK "a"
//    std::vector<std::vector<std::vector<std::string>>> data = { { {"a",     "b","c.d" },
//                                                                {  "dataA1","", "dataCD1" },
//                                                                {  "dataA2","", "dataCD2" } },
//                                                                { {"b.<xmlattr>.attr","b",     "a" },
//                                                                {  "attB1",           "dataB1","dataA1" },
//                                                                {  "attB2",           "dataB2","dataA1" },
//                                                                {  "attB3",           "dataB3","dataA2" },
//                                                                {  "attB4",           "dataB4","dataA2" }, } };
//    // sub.b doesn't exist in parent record's header -> error
//    int result = 0;
//    std::string resultString = TreeizeRelD::writeTreeAndCreateXML(control, data, &result);
//    BOOST_TEST(result == 1);
//    BOOST_TEST(resultString == "(writeTree): given subnode + root record element sub.b was not found in header of parent table with parentnode root !");
//}
//
//BOOST_AUTO_TEST_CASE(writeXMLSubNodeFound)
//{
//    // control table:                                   parentNode, subnodeOfParent, primaryKey, foreignKey, rootElemRec
//    std::vector<std::vector<std::string>> control = { {"root",      "",              "a",        "",         "rec" },
//                                                      {"root.rec",  "sub",              "",         "a",        "b" } };
//    // table data[1] has child relation to table data[0] via FK/PK "a"
//    std::vector<std::vector<std::vector<std::string>>> data = { { {"a",     "sub.b","c.d"},
//                                                                {  "dataA1","", "dataCD1"},
//                                                                {  "dataA2","", "dataCD2"} },
//                                                                { {"b.<xmlattr>.attr","b",     "a" },
//                                                                {  "attB1",           "dataB1","dataA1" },
//                                                                {  "attB2",           "dataB2","dataA1" },
//                                                                {  "attB3",           "dataB3","dataA2" },
//                                                                {  "attB4",           "dataB4","dataA2" }, } };
//    // sub.b instead of b -> correct inserting of data in sub.b
//    int result = 0;
//    std::string resultString = TreeizeRelD::writeTreeAndCreateXML(control, data, &result);
//    BOOST_TEST(result == 0);
//    BOOST_TEST(resultString == "<root><rec><a>dataA1</a><sub><b attr=\"attB1\">dataB1</b><b attr=\"attB2\">dataB2</b></sub><c><d>dataCD1</d></c></rec><rec><a>dataA2</a><sub><b attr=\"attB3\">dataB3</b><b attr=\"attB4\">dataB4</b></sub><c><d>dataCD2</d></c></rec></root>");
//}
//
//BOOST_AUTO_TEST_CASE(writeXMLFailrootElemRecEqualPrimKey)
//{
//    // control table:                                   parentNode, subnodeOfParent, primaryKey, foreignKey, rootElemRec
//    std::vector<std::vector<std::string>> control = { {"root",      "",              "a",        "",         "a" },
//                                                      {"root.rec",  "sub",              "",         "a",        "b" } };
//    // table data[1] has child relation to table data[0] via FK/PK "a"
//    std::vector<std::vector<std::vector<std::string>>> data = { { {"a",     "a.b","c.d"},
//                                                                {  "dataA1","", "dataCD1"},
//                                                                {  "dataA2","", "dataCD2"} },
//                                                                { {"b.<xmlattr>.attr","b",     "a" },
//                                                                {  "attB1",           "dataB1","dataA1" },
//                                                                {  "attB2",           "dataB2","dataA1" },
//                                                                {  "attB3",           "dataB3","dataA2" },
//                                                                {  "attB4",           "dataB4","dataA2" }, } };
//    // rootElemRec == primaryKey -> error
//    int result = 0;
//    std::string resultString = TreeizeRelD::writeTreeAndCreateXML(control, data, &result);
//    BOOST_TEST(result == 1);
//    BOOST_TEST(resultString == "(writeTree): rootElemRec must not be identical to primary key (would lead to mixed content elements) !");
//}
//
//BOOST_AUTO_TEST_CASE(writeXMLFailrootElemRecForKeyNotFound)
//{
//    // control table:                                   parentNode, subnodeOfParent, primaryKey, foreignKey, rootElemRec
//    std::vector<std::vector<std::string>> control = { {"root",      "",              "a",        "",         "rec" },
//                                                      {"root.rec",  "sub",              "",         "a",        "b" } };
//    // table data[1] has child relation to table data[0] via FK/PK "a"
//    std::vector<std::vector<std::vector<std::string>>> data = { { {"a",     "sub.b","c.d"},
//                                                                {  "dataA1","", "dataCD1"},
//                                                                {  "dataA2","", "dataCD2"} },
//                                                                { {"b.<xmlattr>.attr","b",     "a" },
//                                                                {  "attB1",           "dataB1","dataA1" },
//                                                                {  "attB2",           "dataB2","dataA1" },
//                                                                {  "attB3",           "dataB3","dataA3" },
//                                                                {  "attB4",           "dataB4","dataA3" }, } };
//    // rootElemRec == primaryKey -> error
//    int result = 0;
//    std::string resultString = TreeizeRelD::writeTreeAndCreateXML(control, data, &result);
//    BOOST_TEST(result == 1);
//    BOOST_TEST(resultString == "(writeTree):  couldn't find any record in parent to insert record with foreign key 'dataA3' into !");
//}
//
//BOOST_AUTO_TEST_CASE(writeXMLSubSubNode)
//{
//    // control table:                                   parentNode, subnodeOfParent, primaryKey, foreignKey, rootElemRec
//    std::vector<std::vector<std::string>> control = { {"root",      "",              "a",        "",         "rec" },
//                                                      {"root.rec",  "sub.subsub",              "",         "a",        "b" } };
//    // table data[1] has child relation to table data[0] via FK/PK "a"
//    std::vector<std::vector<std::vector<std::string>>> data = { { {"a",     "sub.subsub.b","c.d"},
//                                                                {  "dataA1","", "dataCD1"},
//                                                                {  "dataA2","", "dataCD2"} },
//                                                                { {"b.<xmlattr>.attr","b",     "a" },
//                                                                {  "attB1",           "dataB1","dataA1" },
//                                                                {  "attB2",           "dataB2","dataA1" },
//                                                                {  "attB3",           "dataB3","dataA2" },
//                                                                {  "attB4",           "dataB4","dataA2" }, } };
//    // sub.b instead of b -> correct inserting of data in sub.b
//    int result = 0;
//    std::string resultString = TreeizeRelD::writeTreeAndCreateXML(control, data, &result);
//    BOOST_TEST(result == 0);
//    BOOST_TEST(resultString == "<root><rec><a>dataA1</a><sub><subsub><b attr=\"attB1\">dataB1</b><b attr=\"attB2\">dataB2</b></subsub></sub><c><d>dataCD1</d></c></rec><rec><a>dataA2</a><sub><subsub><b attr=\"attB3\">dataB3</b><b attr=\"attB4\">dataB4</b></subsub></sub><c><d>dataCD2</d></c></rec></root>");
//}
//
//BOOST_AUTO_TEST_CASE(writeXMLMissingForeignDataSimple)
//{
//    // control table:                                   parentNode, subnodeOfParent, primaryKey, foreignKey, rootElemRec
//    std::vector<std::vector<std::string>> control = { {"root",      "",              "a",        "",         "rec" },
//                                                      {"root.rec",  "",              "",         "a",        "b" } };
//    // table data[1] has child relation to table data[0] via FK/PK "a"
//    std::vector<std::vector<std::vector<std::string>>> data = { { {"a",     "b","c.d"},
//                                                                {  "dataA1","", "dataCD1"},
//                                                                {  "dataA2","", "dataCD2"} },
//                                                                { {"b.<xmlattr>.attr","b",     "a" },
//                                                                {  "attB1",           "dataB1","dataA1" },
//                                                                {  "attB2",           "dataB2","dataA1" } } };
//    // no data for parent record with primkey "dataA2" -> removed placeholder </b>
//    int result = 0;
//    std::string resultString = TreeizeRelD::writeTreeAndCreateXML(control, data, &result);
//    BOOST_TEST(result == 0);
//    BOOST_TEST(resultString == "<root><rec><a>dataA1</a><b attr=\"attB1\">dataB1</b><b attr=\"attB2\">dataB2</b><c><d>dataCD1</d></c></rec><rec><a>dataA2</a><c><d>dataCD2</d></c></rec></root>");
//}
//
//BOOST_AUTO_TEST_CASE(writeXMLMissingForeignDataSubnode)
//{
//    // control table:                                   parentNode, subnodeOfParent, primaryKey, foreignKey, rootElemRec
//    std::vector<std::vector<std::string>> control = { {"root",      "",              "a",        "",         "rec" },
//                                                      {"root.rec",  "sub",              "",         "a",        "b" } };
//    // table data[1] has child relation to table data[0] via FK/PK "a"
//    std::vector<std::vector<std::vector<std::string>>> data = { { {"a",     "sub.b","c.d"},
//                                                                {  "dataA1","", "dataCD1"},
//                                                                {  "dataA2","", "dataCD2"} },
//                                                                { {"b.<xmlattr>.attr","b",     "a" },
//                                                                {  "attB1",           "dataB1","dataA1" },
//                                                                {  "attB2",           "dataB2","dataA1" } } };
//    // no data for parent record with primkey "dataA2" -> removed placeholder <sub></b>
//    int result = 0;
//    std::string resultString = TreeizeRelD::writeTreeAndCreateXML(control, data, &result);
//    BOOST_TEST(result == 0);
//    BOOST_TEST(resultString == "<root><rec><a>dataA1</a><sub><b attr=\"attB1\">dataB1</b><b attr=\"attB2\">dataB2</b></sub><c><d>dataCD1</d></c></rec><rec><a>dataA2</a><c><d>dataCD2</d></c></rec></root>");
//}

BOOST_AUTO_TEST_CASE(writeXMLThreeNestedTables)
{
    // control table:                                   parentNode, subnodeOfParent, primaryKey, foreignKey, rootElemRec
    std::vector<std::vector<std::string>> control = { {"root",      "",              "a",        "",         "rec" },
                                                      {"root.rec",  "sub",              "b",         "a",        "bRec" },
                                                      {"root.rec.sub.bRec",  "subsub",              "",         "b",        "s" } };
    // table data[1] has relation to table data[0] via FK/PK "a"
    // table data[2] has relation to table data[1] via FK/PK "b"
    std::vector<std::vector<std::vector<std::string>>> data = { { {"a",     "sub.bRec","c.d"},
                                                                {  "dataA1","", "dataCD1"},
                                                                {  "dataA2","", "dataCD2"}, },
                                                                { {"b.<xmlattr>.attr","b",     "a",    "subsub.s"},
                                                                {  "attB1",           "dataB1","dataA1", ""},
                                                                {  "attB2",           "dataB2","dataA1", ""},
                                                                {  "attB3",           "dataB3","dataA2", ""},
                                                                {  "attB4",           "dataB4","dataA2", ""}, },
                                                                { {"s","b"},
                                                                {  "s1",           "dataB1" },
                                                                {  "s2",           "dataB1" },
                                                                {  "s3",           "dataB2" },
                                                                {  "s4",           "dataB2" },
                                                                {  "s5",           "dataB2" },
                                                                {  "s6",           "dataB3" }, } };
    int result = 0;
    std::string resultString = TreeizeRelD::writeTreeAndCreateXML(control, data, &result);
    BOOST_TEST(result == 0);
    BOOST_TEST(resultString == "<root><rec><a>dataA1</a><sub><bRec><b attr=\"attB1\">dataB1</b><subsub><s>s1</s><s>s2</s></subsub></bRec><bRec><b attr=\"attB2\">dataB2</b><subsub><s>s3</s><s>s4</s><s>s5</s></subsub></bRec></sub><c><d>dataCD1</d></c></rec><rec><a>dataA2</a><sub><bRec><b attr=\"attB3\">dataB3</b><subsub><s>s6</s></subsub></bRec><bRec><b attr=\"attB4\">dataB4</b></bRec></sub><c><d>dataCD2</d></c></rec></root>");
}

//BOOST_AUTO_TEST_CASE(writeJSONFail)
//{
//    // control table:                                   parentNode, subnodeOfParent, primaryKey, foreignKey, rootElemRec
//    std::vector<std::vector<std::string>> control = { {"root",      "",              "a",        "",         "rec" },
//                                                      {"root.rec",  "sub",              "",         "a",        "b" } };
//    // table data[1] has child relation to table data[0] via FK/PK "a"
//    std::vector<std::vector<std::vector<std::string>>> data = { { {"a",     "sub.b","c.d"},
//                                                                {  "dataA1","", "dataCD1"},
//                                                                {  "dataA2","", "dataCD2"} },
//                                                                { {"b.<xmlattr>.attr","b",     "a" },
//                                                                {  "attB1",           "dataB1","dataA1" },
//                                                                {  "attB2",           "dataB2","dataA1" },
//                                                                {  "attB3",           "dataB3","dataA2" },
//                                                                {  "attB4",           "dataB4","dataA2" }, } };
//    // JSON creation doesn't allow attributes...
//    int result = 0;
//    std::string resultString = TreeizeRelD::writeTreeAndCreateJSON(control, data, &result);
//    BOOST_TEST(result == 1);
//    BOOST_TEST(resultString == "(createJson): <unspecified file>: ptree contains data that cannot be represented in JSON format");
//}
//
//BOOST_AUTO_TEST_CASE(writeJSONOK)
//{
//    // control table:                                   parentNode, subnodeOfParent, primaryKey, foreignKey, rootElemRec
//    std::vector<std::vector<std::string>> control = { {"root",      "",              "a",        "",         "rec" },
//                                                      {"root.rec",  "",              "",         "a",        "b" } };
//    // table data[1] has child relation to table data[0] via FK/PK "a"
//    std::vector<std::vector<std::vector<std::string>>> data = { { {"a",     "b","c.d" },
//                                                                {  "dataA1","", "dataCD1" },
//                                                                {  "dataA2","", "dataCD2" } },
//                                                                { {"bat","b",     "a" },
//                                                                {  "attB1",           "dataB1","dataA1" },
//                                                                {  "attB2",           "dataB2","dataA1" },
//                                                                {  "attB3",           "dataB3","dataA2" },
//                                                                {  "attB4",           "dataB4","dataA2" }, } };
//    // avoided attribute creation as this is not allowed in JSON, attributes are normal children...
//    // invocation with result (0 success, 1 failure) and resultString is due to SWIG implementation..
//    int result = 0;
//    std::string resultString = TreeizeRelD::writeTreeAndCreateJSON(control, data, &result);
//    BOOST_TEST(result == 0);  
//    BOOST_TEST(resultString == "{\"root\":{\"rec\":{\"a\":\"dataA1\",\"bat\":\"attB1\",\"b\":\"dataB1\",\"b\":\"dataB2\",\"c\":{\"d\":\"dataCD1\"}},\"rec\":{\"a\":\"dataA2\",\"bat\":\"attB3\",\"b\":\"dataB3\",\"b\":\"dataB4\",\"c\":{\"d\":\"dataCD2\"}}}}\n");
//}
//
//BOOST_AUTO_TEST_CASE(writeTreeAndCreateXMLSeparated)
//{
//    // control table:                                   parentNode, subnodeOfParent, primaryKey, foreignKey, rootElemRec
//    std::vector<std::vector<std::string>> control = { {"root",      "",              "a",        "",         "rec" },
//                                                      {"root.rec",  "",              "",         "a",        "b" } };
//    // table data[1] has child relation to table data[0] via FK/PK "a"
//    std::vector<std::vector<std::vector<std::string>>> data = { { {"a",     "b","c.d" },
//                                                                {  "dataA1","", "dataCD1" },
//                                                                {  "dataA2","", "dataCD2" } },
//                                                                { {"b.<xmlattr>.attr","b",     "a" },
//                                                                {  "attB1",           "dataB1","dataA1" },
//                                                                {  "attB2",           "dataB2","dataA1" },
//                                                                {  "attB3",           "dataB3","dataA2" },
//                                                                {  "attB4",           "dataB4","dataA2" }, } };
//    pt::ptree testTree;
//    BOOST_TEST(TreeizeRelD::writeTree(control, data, testTree) == "");
//    std::string resultStr;
//    BOOST_TEST(TreeizeRelD::createXML(testTree, resultStr) == "");
//    BOOST_TEST(resultStr == "<root><rec><a>dataA1</a><b attr=\"attB1\">dataB1</b><b attr=\"attB2\">dataB2</b><c><d>dataCD1</d></c></rec><rec><a>dataA2</a><b attr=\"attB3\">dataB3</b><b attr=\"attB4\">dataB4</b><c><d>dataCD2</d></c></rec></root>");
//}
//
//BOOST_AUTO_TEST_CASE(writeTable)
//{
//    std::vector<std::vector<std::string>> data = { { "a","b","c.d" },{ "dataA1","dataB1","dataCD1" },{ "dataA2","dataB2","dataCD2" } };
//    pt::ptree testTree;
//    BOOST_TEST(TreeizeRelD::writeTable(testTree, data, "b", "row") == "");
//    std::string resultStr;
//    BOOST_TEST(TreeizeRelD::createXML(testTree, resultStr) == "");
//    BOOST_TEST(resultStr == "<dataB1><row><a>dataA1</a><c><d>dataCD1</d></c></row></dataB1><dataB2><row><a>dataA2</a><c><d>dataCD2</d></c></row></dataB2>");
//}
//
//BOOST_AUTO_TEST_CASE(writeRecord1)
//{
//    std::vector<std::string> header = { "a","b","c.d" };
//    std::vector<std::string> dataRow = { "dataA","dataB","dataCD" };
//    pt::ptree testTree; std::string rowsFK;
//    BOOST_TEST(TreeizeRelD::writeRecord(testTree, dataRow, header, "b", rowsFK) == "");
//    std::string resultStr;
//    BOOST_TEST(TreeizeRelD::createXML(testTree, resultStr) == "");
//    BOOST_TEST(resultStr == "<a>dataA</a><c><d>dataCD</d></c>");
//    BOOST_TEST(rowsFK == "dataB");
//}
//
//BOOST_AUTO_TEST_CASE(writeRecord2)
//{
//    std::vector<std::string> header = { "a.<xmlattr>.attr","b","c.d" };
//    std::vector<std::string> dataRow = { "dataA","dataB","dataCD" };
//    pt::ptree testTree; std::string rowsFK;
//    BOOST_TEST(TreeizeRelD::writeRecord(testTree, dataRow, header, "", rowsFK) == "");
//    std::string resultStr;
//    BOOST_TEST(TreeizeRelD::createXML(testTree, resultStr) == "");
//    BOOST_TEST(resultStr == "<a attr=\"dataA\"/><b>dataB</b><c><d>dataCD</d></c>");
//    BOOST_TEST(rowsFK == "");
//}