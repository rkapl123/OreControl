#include <treeizereld.hpp>

std::string TreeizeRelD::writeTreeAndCreateXML(const std::vector<std::vector<std::string>>& control,
    const std::vector<std::vector<std::vector<std::string>>>& data) {

    pt::ptree propTree;
    std::string returnStr = TreeizeRelD::writeTree(control, data, propTree);
    if (returnStr != "") {
        throw(returnStr);
    }
    std::string resultStr;
    returnStr = TreeizeRelD::createXML(propTree, resultStr);
    if (returnStr != "") {
        throw(returnStr);
    }
    return resultStr;
}

std::string TreeizeRelD::writeTreeAndCreateJSON(const std::vector<std::vector<std::string>>& control,
    const std::vector<std::vector<std::vector<std::string>>>& data) {

    pt::ptree propTree;
    std::string returnStr = TreeizeRelD::writeTree(control, data, propTree);
    if (returnStr != "") {
        throw(returnStr);
    }
    std::string resultStr;
    returnStr = TreeizeRelD::createJson(propTree, resultStr);
    if (returnStr != "") {
        throw(returnStr);
    }
    return resultStr;
}

std::string TreeizeRelD::createXML(const pt::ptree &ptTree, std::string &resultString) {
    std::ostringstream oss;
    try {
        pt::xml_writer_settings<pt::ptree::key_type> settings(' ', 0);
        pt::xml_parser::write_xml_element(oss, pt::ptree::key_type(), ptTree, -1, settings);
        resultString = oss.str();
    } catch (std::exception ex) {
        return std::string("(createXML): ").append(ex.what());
    }
    return "";
}

std::string TreeizeRelD::createJson(const pt::ptree &ptTree, std::string &resultString) {
    std::ostringstream oss;
    try {
        pt::json_parser::write_json(oss, ptTree, false);        
        resultString = oss.str();
    } catch (std::exception ex) {
        return std::string("(createJson): ").append(ex.what());
    }
    return "";
}

std::string TreeizeRelD::writeTree(const std::vector<std::vector<std::string>> &control,
                   const std::vector<std::vector<std::vector<std::string>>> &data,
                   pt::ptree &ptTree) {
    std::map<std::string, pt::ptree> tableDic;
    std::map<std::string, std::string> primKeyDic;
    std::map<std::string, std::string> rootNodeDic;
    if (control.size() != data.size()) { return "(writeTree): control table rows need to be same as amount of data tables passed !"; }
    if (control[0].size() != 5) { return "(writeTree): control table columns need to be 5 !"; }
    // first pass: write all tables, writing record nodes with row data in it
    std::string parentNode; std::string subnodeOfParent; 
    std::string primaryKey; std::string foreignKey; std::string rootElemRec;
    for (int i = 0; i < control.size(); i++) {
        getRelInfo(control[i], parentNode, subnodeOfParent, primaryKey, foreignKey, rootElemRec);
        if (parentNode == "") { return "(writeTree): parentNode (control table column 1) must not be empty !"; }
        if (rootElemRec == "") { return "(writeTree): rootElemRec (control table column 5) must not be empty !"; }
        std::string tableLookup = parentNode + (subnodeOfParent != "" ? "." + subnodeOfParent : "") + "." + rootElemRec;
        // FK map of ptree segments (for each common FK collect all records)
        pt::ptree ptFKTable;
        std::string errmsg = writeTable(ptFKTable, data[i], foreignKey, rootElemRec);
        if (errmsg != "") { return errmsg; }
        tableDic[tableLookup] = ptFKTable;
        primKeyDic[parentNode + "." + rootElemRec] = primaryKey;
        rootNodeDic[parentNode + "." + rootElemRec] = parentNode;
    }
    // second pass: collect constructed nodes
    for (int i = 0; i < control.size(); i++) {
        getRelInfo(control[i], parentNode, subnodeOfParent, primaryKey, foreignKey, rootElemRec);
        std::string subRootNode = parentNode + (subnodeOfParent != "" ? "." + subnodeOfParent : "");
        std::string tableLookup = subRootNode + "." + rootElemRec;
        // simpley add child records if no foreignkey exists
        if (foreignKey == "") {
            for (auto &&foreignKeyPair : tableDic[tableLookup]) {
                std::string rowsFK = foreignKeyPair.first;
                ptTree.add_child(subRootNode, foreignKeyPair.second);
            }
        } else {
            // insert all foreign key collections into parent, where appropriate
            for (auto &&foreignKeyPair : tableDic[tableLookup]) {
                for (auto &&parentPair : ptTree.get_child(rootNodeDic[parentNode])) {
                    std::string rowsFK = foreignKeyPair.first;
                    auto &&parentsPKNode = parentPair.second.get_child(primKeyDic[parentNode]);
                    // found a matching foreign key in primary tables key node
                    if (parentsPKNode.get_value<std::string>("") == rowsFK) {
                        std::string subnodeFRec = (subnodeOfParent == "" ? "" : subnodeOfParent + ".") + rootElemRec;
                        //find the Key placeholder for the FK entries in the parent table
                        auto FKnode = parentPair.second.to_iterator(parentPair.second.find(subnodeFRec));
                        // insert the foreign key entries
                        parentPair.second.insert(FKnode, foreignKeyPair.second.begin(), foreignKeyPair.second.end());
                        // now get rid of the placeholder
                        parentPair.second.erase(FKnode);
                        break; // finished with inserting foreign keys here, break to next foreign key ...
                    }
                }
            }
        }
    }
    return "";
}

void TreeizeRelD::getRelInfo(const std::vector<std::string> &defRow,
    std::string &parentNode, std::string &subnodeOfParent,
    std::string &primaryKey, std::string &foreignKey, std::string &rootElemRec) {
    parentNode = defRow[0];
    subnodeOfParent = defRow[1];
    primaryKey = defRow[2];
    foreignKey = defRow[3];
    rootElemRec = defRow[4];
}

std::string TreeizeRelD::writeTable(pt::ptree &ptFKTable, const std::vector<std::vector<std::string>> &table,
    std::string foreignKey, std::string rootElemRec) {
    // iterate data rows, first row is header
    for (int i = 1; i < table.size(); i++) {
        // create root node of record, might be the contained in columns !
        pt::ptree ptRecord;
        // produce the record, getting primary key / foreign key values along the way
        std::string rowsFK;
        std::string errmsg = writeRecord(ptRecord, table[i], table[0], foreignKey, rowsFK);
        if (errmsg != "") { return errmsg; }
        std::string rowsFKExt = (rowsFK == "" ? "/" : rowsFK);
        // add record to FK table segment
        try {
            if (ptRecord.get_child_optional(rootElemRec)) { // rootElemRec contained in columns
                if (ptFKTable.get_child_optional(rowsFKExt)) {
                    ptFKTable.get_child(rowsFKExt).push_back(std::make_pair(rootElemRec, ptRecord.back().second));
                }
                else {
                    ptFKTable.add_child(rowsFKExt, ptRecord);
                }
            }
            else { // rootElemRec not contained in columns
                ptFKTable.add_child(rowsFKExt + "." + rootElemRec, ptRecord);
            }
        } catch (std::exception ex) {
            return std::string("(writeTable): ").append(ex.what());
        }
    }
    return "";
}

std::string TreeizeRelD::writeRecord(pt::ptree &ptRecord, const std::vector<std::string> &recordRow,
    const std::vector<std::string> &header, std::string foreignKey, std::string &rowsFK) {

    rowsFK = "";
    // traverse columns of record
    for (int i = 0; i < recordRow.size(); i++) {
        // get current rows foreign key if needed (= given), ignore foreign key column in construction of xml
        if (header[i] == foreignKey) {
            rowsFK = recordRow[i];
        } else {
            // construct column
            try {
                ptRecord.put(header[i], recordRow[i]);
            } catch (std::exception ex) {
                return std::string("(writeRecord): ").append(ex.what());
            }
        }
    }
    return "";
}