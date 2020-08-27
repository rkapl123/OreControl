using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using System.Collections.Generic;

namespace CsharpTest
{
    [TestClass]
    public class UnitTest1
    {
        [TestMethod]
        public void TestMethod1()
        {
            // control table:  parentNode, subnodeOfParent, primaryKey, foreignKey, rootElemRec
            
            StrTable control = new StrTable(new List<StrVector> { 
                new StrVector(new string[]{ "root", "", "a", "", "rec" }), 
                new StrVector(new string[]{ "root.rec", "", "", "a", "b" }) 
            });
            StrTableCollection data = new StrTableCollection(new List<StrTable>
            {
                new StrTable(new List<StrVector> { new StrVector(new string[]{ "a","b","c.d" }),
                                                   new StrVector(new string[]{ "dataA1","", "dataCD1" }),
                                                   new StrVector(new string[]{ "dataA2","", "dataCD2" }) }),
                new StrTable(new List<StrVector> { new StrVector(new string[]{ "b.<xmlattr>.attr","b","a" }),
                                                   new StrVector(new string[]{ "attB1", "dataB1","dataA1" }),
                                                   new StrVector(new string[]{ "attB2", "dataB2","dataA1" }),
                                                   new StrVector(new string[]{ "attB3", "dataB3","dataA2" }),
                                                   new StrVector(new string[]{ "attB4", "dataB4","dataA2" }) })
            });
            // table data[1] has child relation to table data[0] via FK/PK "a"
            Assert.AreEqual(TreeizeRelD.writeTreeAndCreateXML(control, data), "<root><rec><a>dataA1</a><b attr=\"attB1\">dataB1</b><b attr=\"attB2\">dataB2</b><c><d>dataCD1</d></c></rec><rec><a>dataA2</a><b attr=\"attB3\">dataB3</b><b attr=\"attB4\">dataB4</b><c><d>dataCD2</d></c></rec></root>");
        }
    }
}
