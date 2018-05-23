#include <treeizereld/treeizereld.hpp>

std::string TreeizeRelD::createXML(const pt::ptree &ptTree) {
    std::ostringstream oss;
    pt::xml_writer_settings<pt::ptree::key_type> settings(' ', 0);
    pt::xml_parser::write_xml_element(oss, pt::ptree::key_type(), ptTree, -1, settings);
    return oss.str();
}

// create Json from 
std::string TreeizeRelD::createJson(const pt::ptree &ptTree) {
    std::ostringstream oss;
    pt::json_parser::write_json(oss, ptTree);
    return oss.str();
}

// write a tree of tables given in table data (header and data) and table control (relations and tags) 
// into property tree ptTree
bool TreeizeRelD::writeTree(const std::vector<std::vector<std::string>> &control,
                   const std::vector<std::vector<std::vector<std::string>>> &data,
                   pt::ptree &ptTree) {
    std::map<std::string, std::map<std::string, pt::ptree>> tableDic;

    // first pass: write all tables, writing record nodes with row data in it
    std::string parentNode; std::string subnodeOfParent; 
    std::string primaryKey; std::string foreignKey; std::string rootElemRec;
    for (int i = 0; i < control.size(); i++) {
        getRelInfo(control[i], parentNode, subnodeOfParent, primaryKey, foreignKey, rootElemRec);
        std::string tableLookup = parentNode + (subnodeOfParent != "" ? "." + subnodeOfParent : "") + "." + rootElemRec;
        // FK map of ptree segments (for each common FK collect all records)
        std::map<std::string, pt::ptree> ptTable;
        if (!writeTable(ptTable, data[i], foreignKey, rootElemRec)) {
            return false;
        }
        tableDic[tableLookup] = ptTable;
    }
    // second pass: collect constructed nodes
    // for each row in control
    // add records if no foreignkey exists
    // if foreignkey exists, look up parentNode / ForeignKey in main tree(foreach parentNode / ForeignKey..) assuming that foreignKey = primaryKey
    // add tableDic[ForeignKeyVal] entries to each looked up parentNode / ForeignKey placing it under parentNode / subnode

    //auto& root = pt.get_child("Element");
    //for (auto& child : root.get_child("Name"))
    //{
    //    if (child.first == "KeyFrame")
    //    {
    //        std::cout << child.second.get<int>("<xmlattr>.time", 0) << " : " << child.second.data() << std::endl;
    //    }
    //}
    return true;
}

// helper function to retrieve info from definition Row in control table to the elements of the row
void TreeizeRelD::getRelInfo(const std::vector<std::string> &defRow,
    std::string &parentNode, std::string &subnodeOfParent,
    std::string &primaryKey, std::string &foreignKey, std::string &rootElemRec) {
    parentNode = defRow[1];
    subnodeOfParent = defRow[2];
    primaryKey = defRow[3];
    foreignKey = defRow[4];
    rootElemRec = defRow[5];
}

// write a subtable given in table into property tree ptTable
bool TreeizeRelD::writeTable(std::map<std::string, pt::ptree> &ptTable, 
    const std::vector<std::vector<std::string>> &table,
    std::string foreignKey, std::string rootElemRec) {
    // iterate data rows, first row is header
    for (int i = 1; i < table.size(); i++) {
        // create root node of record
        pt::ptree ptRecord;
        // produce the record, getting primary key / foreign key values along the way
        std::string rowsFK = "";
        if (!writeRecord(ptRecord, table[i], table[0], foreignKey, rowsFK)) {
            return false;
        }
        // add record to FK table segment
        ptTable[rowsFK].add_child(rootElemRec, ptRecord);
    }
    return true;
}

// write a record given in recordRow (data) into property tree ptRecord, path info given in header
bool TreeizeRelD::writeRecord(pt::ptree &ptRecord, const std::vector<std::string> &recordRow,
    const std::vector<std::string> &header, std::string foreignKey, std::string &rowsFK) {

    boost::log::sources::logger lg;
    // traverse columns of record
    for (int i = 0; i < recordRow.size(); i++) {
        // get current rows foreign key if needed (= given), ignore foreign key column in construction of xml
        if (header[i] == foreignKey) {
            rowsFK = recordRow[i];
        }
        else {
            // construct column
            try {
                ptRecord.put(header[i], recordRow[i]);
            }
            catch (std::exception ex) {
                BOOST_LOG(lg) << ex.what();
                return false;
            }
        }
    }
    return true;
}