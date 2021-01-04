%module TreeizeRelD
%include stl.i
%include "typemaps.i"
%apply int *INOUT { int *result };

namespace boost {
namespace property_tree {
}
}

%{
#include "treeizereld.hpp"
%}

/* Parse the header file to generate wrappers, ignoring below methods */
%ignore createXML(pt::ptree &ptTree, std::string &resultString);
%ignore createJson(pt::ptree &ptTree, std::string &resultString);
%ignore writeTree(const std::vector<std::vector<std::string>> &control,
        const std::vector<std::vector<std::vector<std::string>>> &data,
        pt::ptree &ptTree);
%ignore getRelationInfo(const std::vector<std::string> &defRow,
        std::string &parentNode, std::string &subnodeOfParent,
        std::string &primaryKey, std::string &foreignKey, std::string &rootElemRec);
%ignore writeTable(pt::ptree &ptFKTable, const std::vector<std::vector<std::string>> &table,
        std::string foreignKey, std::string rootElemRec);
%ignore writeRecord(pt::ptree &ptRecord, const std::vector<std::string> &recordRow,
        const std::vector<std::string> &header, std::string foreignKey, std::string &rowsFK);

%include "treeizereld.hpp"

namespace std {
    %template(StrVector) vector<string>;
    %template(StrTable) vector<vector<string>>;
    %template(StrTableCollection) vector<vector<vector<string>>>;
}

