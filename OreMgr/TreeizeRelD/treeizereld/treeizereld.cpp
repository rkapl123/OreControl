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
    std::map<std::string, pt::ptree> tableDic;

    // first pass: write all tables, writing record nodes with row data in it
    std::string parentNode; std::string subnodeOfParent; 
    std::string primaryKey; std::string foreignKey; std::string rootElemRec;
    for (int i = 0; i < control.size(); i++) {
        getRelInfo(control[i], parentNode, subnodeOfParent, primaryKey, foreignKey, rootElemRec);
        std::string tableLookup = parentNode + (subnodeOfParent != "" ? "." + subnodeOfParent : "") + "." + rootElemRec;
        pt::ptree ptTable;
        if (!writeTable(ptTable, data[i], primaryKey, foreignKey, rootElemRec)) {
            return false;
        }
        tableDic[tableLookup] = ptTable;
    }
    // second pass: collect constructed nodes

    // find/create parentNode/subnodeOfParent

    // add nodes to each primary key of parentNode/subnodeOfParent
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
bool TreeizeRelD::writeTable(pt::ptree &ptTable, const std::vector<std::vector<std::string>> &table,
    std::string primaryKey, std::string foreignKey, std::string rootElemRec) {
    // iterate data rows, first row is header
    for (int i = 1; i < table.size(); i++) {
        // create root node of record
        pt::ptree ptRecord;
        // produce the record, getting primary key / foreign key values along the way
        std::string rowsFK = ""; std::string rowsPK = "";
        if (!writeRecord(ptRecord, table[i], table[0], primaryKey, rowsPK, foreignKey, rowsFK)) {
            return false;
        }
        // add record to table
        ptTable.add_child(rootElemRec, ptRecord);
    }
    return true;
}

// write a record given in recordRow (data) into property tree ptRecord, path info given in header
bool TreeizeRelD::writeRecord(pt::ptree &ptRecord, const std::vector<std::string> &recordRow,
    const std::vector<std::string> &header, std::string primaryKey, std::string &rowsPK, std::string foreignKey,
    std::string &rowsFK) {

    boost::log::sources::logger lg;
    rowsPK = ""; rowsFK = "";
    // traverse columns of record
    for (int i = 0; i < recordRow.size(); i++) {
        // get current rows foreign key if needed (given), ignore foreign key column in construction of xml
        if (header[i] == foreignKey) {
            rowsFK = recordRow[i];
        }
        else {
            // get primary Key value if needed (given)
            if (header[i] == primaryKey) {
                rowsPK = recordRow[i];
            }
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