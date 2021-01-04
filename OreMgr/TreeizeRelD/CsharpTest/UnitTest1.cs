using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using System.Collections.Generic;

namespace CsharpTest
{
    [TestClass]
    public class UnitTest1
    {
        //[TestMethod]
        //public void TestXML()
        //{
        //    // control table:  parentNode, subnodeOfParent, primaryKey, foreignKey, rootElemRec
        //    StrTable control = new StrTable(new List<StrVector> { 
        //        new StrVector(new string[]{ "root", "", "a", "", "rec" }), 
        //        new StrVector(new string[]{ "root.rec", "", "", "a", "b" }) 
        //    });
        //    // table data[1] has child relation to table data[0] via FK/PK "a"
        //    StrTableCollection data = new StrTableCollection(new List<StrTable>
        //    {
        //        new StrTable(new List<StrVector> { new StrVector(new string[]{ "a","b","c.d" }),
        //                                           new StrVector(new string[]{ "dataA1","", "dataCD1" }),
        //                                           new StrVector(new string[]{ "dataA2","", "dataCD2" }) }),
        //        new StrTable(new List<StrVector> { new StrVector(new string[]{ "b.<xmlattr>.attr","b","a" }),
        //                                           new StrVector(new string[]{ "attB1", "dataB1","dataA1" }),
        //                                           new StrVector(new string[]{ "attB2", "dataB2","dataA1" }),
        //                                           new StrVector(new string[]{ "attB3", "dataB3","dataA2" }),
        //                                           new StrVector(new string[]{ "attB4", "dataB4","dataA2" }) })
        //    });
        //    int result = 0;
        //    String resultString = TreeizeRelD.writeTreeAndCreateXML(control, data, ref result);
        //    Assert.AreEqual(result, 0);
        //    Assert.AreEqual(resultString, "<root><rec><a>dataA1</a><b attr=\"attB1\">dataB1</b><b attr=\"attB2\">dataB2</b><c><d>dataCD1</d></c></rec><rec><a>dataA2</a><b attr=\"attB3\">dataB3</b><b attr=\"attB4\">dataB4</b><c><d>dataCD2</d></c></rec></root>");
        //}
        //[TestMethod]
        //public void TestJSON()
        //{
        //    // control table:  parentNode, subnodeOfParent, primaryKey, foreignKey, rootElemRec
        //    StrTable control = new StrTable(new List<StrVector> {
        //        new StrVector(new string[]{ "root", "", "a", "", "rec" }),
        //        new StrVector(new string[]{ "root.rec", "", "", "a", "b" })
        //    });
        //    // table data[1] has child relation to table data[0] via FK/PK "a"
        //    StrTableCollection data = new StrTableCollection(new List<StrTable>
        //    {
        //        new StrTable(new List<StrVector> { new StrVector(new string[]{ "a","b","c.d" }),
        //                                           new StrVector(new string[]{ "dataA1","", "dataCD1" }),
        //                                           new StrVector(new string[]{ "dataA2","", "dataCD2" }) }),
        //        new StrTable(new List<StrVector> { new StrVector(new string[]{ "bat","b","a" }),
        //                                           new StrVector(new string[]{ "attB1", "dataB1","dataA1" }),
        //                                           new StrVector(new string[]{ "attB2", "dataB2","dataA1" }),
        //                                           new StrVector(new string[]{ "attB3", "dataB3","dataA2" }),
        //                                           new StrVector(new string[]{ "attB4", "dataB4","dataA2" }) })
        //    });
        //    // avoided attribute creation as this is not allowed in JSON, attributes are normal children...
        //    int result = 0;
        //    String resultString = TreeizeRelD.writeTreeAndCreateJSON(control, data, ref result);
        //    Assert.AreEqual(result, 0);
        //    Assert.AreEqual(resultString, "{\"root\":{\"rec\":{\"a\":\"dataA1\",\"bat\":\"attB1\",\"b\":\"dataB1\",\"b\":\"dataB2\",\"c\":{\"d\":\"dataCD1\"}},\"rec\":{\"a\":\"dataA2\",\"bat\":\"attB3\",\"b\":\"dataB3\",\"b\":\"dataB4\",\"c\":{\"d\":\"dataCD2\"}}}}\n");
        //}
        //[TestMethod]
        //public void TestJSONFail()
        //{
        //    // control table:  parentNode, subnodeOfParent, primaryKey, foreignKey, rootElemRec
        //    StrTable control = new StrTable(new List<StrVector> {
        //        new StrVector(new string[]{ "root", "", "a", "", "rec" }),
        //        new StrVector(new string[]{ "root.rec", "", "", "a", "b" })
        //    });
        //    // table data[1] has child relation to table data[0] via FK/PK "a"
        //    StrTableCollection data = new StrTableCollection(new List<StrTable>
        //    {
        //        new StrTable(new List<StrVector> { new StrVector(new string[]{ "a","b","c.d" }),
        //                                           new StrVector(new string[]{ "dataA1","", "dataCD1" }),
        //                                           new StrVector(new string[]{ "dataA2","", "dataCD2" }) }),
        //        new StrTable(new List<StrVector> { new StrVector(new string[]{ "b.<xmlattr>.attr", "b","a" }),
        //                                           new StrVector(new string[]{ "attB1", "dataB1","dataA1" }),
        //                                           new StrVector(new string[]{ "attB2", "dataB2","dataA1" }),
        //                                           new StrVector(new string[]{ "attB3", "dataB3","dataA2" }),
        //                                           new StrVector(new string[]{ "attB4", "dataB4","dataA2" }) })
        //    });
        //    // attribute creation used in JSON leads to exception, with details being returned by writeTreeAndCreateJSON as return value...
        //    int result = 0;
        //    String resultString = TreeizeRelD.writeTreeAndCreateJSON(control, data, ref result);
        //    Assert.AreEqual(result, 1);
        //    Assert.AreEqual(resultString, "(createJson): <unspecified file>: ptree contains data that cannot be represented in JSON format");
        // }
    }
}
