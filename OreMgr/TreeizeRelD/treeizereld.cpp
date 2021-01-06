#include <treeizereld.hpp>
#include <iostream>

// lookup for parent Table Tree REFERENCES (therefore ptr_map), key = row's foreign key into parent (= parent's primary key). For the root table this is "/"
// Reason: boost property tree doesn't have the possibility to iterate through entries spanning the tree.
typedef boost::ptr_map<std::string, pt::ptree> treeMap;
std::map<std::string, treeMap> parentTableTrees;

// create flat XML (without indentation and whitespace) from tables given in table data (header and data) and table control (relations and tags)
// throws error message in case of problems
std::string TreeizeRelD::writeTreeAndCreateXML(const std::vector<std::vector<std::string>>& control,
    const std::vector<std::vector<std::vector<std::string>>>& data, int *result) 
{
    std::string resultString;
    pt::ptree propTree;
    std::string returnStr = TreeizeRelD::writeTree(control, data, propTree);
    *result = 0;
    if (returnStr != "") {
        *result = 1;
        return returnStr;
    }
    std::cout << "createXML..\n";
    returnStr = TreeizeRelD::createXML(propTree, resultString);
    if (returnStr != "") {
        *result = 1;
        return returnStr;
    }
    return resultString;
}

// create flat (not indented) Json from tables given in table data (header and data) and table control (relations and tags)
// throws error message in case of problems
std::string TreeizeRelD::writeTreeAndCreateJSON(const std::vector<std::vector<std::string>>& control,
    const std::vector<std::vector<std::vector<std::string>>>& data, int *result) 
{
    std::string resultString;
    pt::ptree propTree;
    std::string returnStr = TreeizeRelD::writeTree(control, data, propTree);
    *result = 0;
    if (returnStr != "") {
        *result = 1;
        return returnStr;
    }
    returnStr = TreeizeRelD::createJson(propTree, resultString);
    if (returnStr != "") {
        *result = 1;
        return returnStr;
    }
    return resultString;
}

// create flat XML (without indentation and whitespace) from previously (with writeTree) created ptTree
std::string TreeizeRelD::createXML(pt::ptree &ptTree, std::string &resultString) 
{
    std::ostringstream oss;
    try {
        pt::xml_writer_settings<pt::ptree::key_type> settings(' ', 0);
        std::cout << "write_xml_element";
        pt::xml_parser::write_xml_element(oss, pt::ptree::key_type(), ptTree, -1, settings);
        resultString = oss.str();
    } catch (std::exception ex) {
        return std::string("(createXML): ").append(ex.what());
    }
    return "";
}

// create Json from previously (with writeTree) created  ptTree
std::string TreeizeRelD::createJson(pt::ptree &ptTree, std::string &resultString) 
{
    std::ostringstream oss;
    try {
        pt::json_parser::write_json(oss, ptTree, false);        
        resultString = oss.str();
    } catch (std::exception ex) {
        return std::string("(createJson): ").append(ex.what());
    }
    return "";
}

// write a relation property tree of all tables given in data (first row table header, rest: table data) using definitions from control (relation information and nodes) 
// into property tree ptTree
std::string TreeizeRelD::writeTree(const std::vector<std::vector<std::string>> &control,
                   const std::vector<std::vector<std::vector<std::string>>> &data,
                   pt::ptree &ptTree)
{

    std::map<std::string, pt::ptree> tables; // tree representation of all records grouped by their foreign key (key of map). this is created by function writeTable
    std::map<std::string, std::string> primKeys; // primary keys lookup (having the parentnode name + the own root element recordnode name as lookup values)
    std::map<std::string, std::string> rootNodes; // root node lookup (same key as primary keys lookup)
    std::map<std::string, std::string> subNodes; // subnode lookup (same key as primary keys lookup)
    std::map<std::string, bool> parentRecordEmpty; // lookup map of flags whether subrecord node (placeholder!) in parent record node was left empty (needs to be removed in the end)

    // sanity checks on control table
    if (control.size() != data.size()) { return "(writeTree): control table rows need to be same as amount of data tables passed !"; }
    if (control[0].size() != 5) { return "(writeTree): control table columns need to be 5 !"; }
    
    // first pass: write all tables separately into tableDic, containing record nodes with row data in it
    // relation and node info variables, see getRelationInfo for details
    std::string parentNode; std::string subnodeOfParent; std::string primaryKeyName; std::string foreignKeyName; std::string rootElemRec;
    
    for (size_t i = 0; i < control.size(); i++) { // get control information for each table 
        // fetch table's control information into relation and node info variables
        getRelationInfo(control[i], parentNode, subnodeOfParent, primaryKeyName, foreignKeyName, rootElemRec);
        // minimum requirements: parentNode and rootElemRec must exist
        if (parentNode == "") { return "(writeTree): parentNode (control table column 1) must not be empty !"; }
        if (rootElemRec == "") { return "(writeTree): rootElemRec (control table column 5) must not be empty !"; }
        // check for special case when rootElemRec is primary key, which is forbidden as it leads to mixed content elements !!
        if (rootElemRec == primaryKeyName) { return "(writeTree): rootElemRec must not be identical to primary key (would lead to mixed content elements) !"; }
        // construct lookup key from sub table's parent node, optionally subnode of parent where subtable is to be placed and root element of record in subtable
        std::string tableLookup = parentNode + (subnodeOfParent != "" ? "." + subnodeOfParent : "") + "." + rootElemRec;
        // (FK) map of ptree segments (for each common FK collect all records, if no FK given, just collect records under "/" -> root table)
        pt::ptree ptFKTable;
        std::string errmsg = writeTable(ptFKTable, data[i], foreignKeyName, rootElemRec);
        if (errmsg != "") { return errmsg; }
        // add ptree representation of subtable to tables lookup
        tables[tableLookup] = ptFKTable;
        // add primary key to primary keys lookup (having the parentnode name + the own root element recordnode name as lookup values)
        primKeys[tableLookup] = primaryKeyName;
        // add parentnode name to rootnodes lookup (having the parentnode name + the own root element recordnode name as lookup values)
        rootNodes[tableLookup] = parentNode;
        // add subnode (if existing) to subnode lookup dictionary. insert "." in front to add to the rootNodes path in lookupNode
        subNodes[tableLookup] = (subnodeOfParent != "" ? "." + subnodeOfParent : "");
    }
    
    // second pass: collect constructed nodes. assumption: parent tables are inserted BEFORE subtables
    for (size_t i = 0; i < control.size(); i++) { // get control information for each table 
        getRelationInfo(control[i], parentNode, subnodeOfParent, primaryKeyName, foreignKeyName, rootElemRec);
        std::string subRootNode = parentNode + (subnodeOfParent != "" ? "." + subnodeOfParent : "");
        std::string tableLookup = subRootNode + "." + rootElemRec;
        // simply add records if no foreign key name exists (usually the top (root) table)
        if (foreignKeyName == "") {
            for (std::pair<std::string, pt::ptree> && keyPair : tables[tableLookup]) {
                // add foreign key collection of table to final tree (ptTree.add_child) and add returned reference to this added collection in parent Table Tree lookup [keyPair.first = rows foreign key] 
                // Reason: boost property tree doesn't have the possibility to iterate through entries spanning the tree.
                parentTableTrees[subRootNode].insert(keyPair.first, &ptTree.add_child(subRootNode, keyPair.second));
            }
        } else {
            // check whether any parent records (root nodes) could be found (if not, indicates an error)
            std::string lookupNode = rootNodes[parentNode] + subNodes[parentNode];
            if (!ptTree.get_child_optional(lookupNode)) {
                return "(writeTree): no given rootnode of parent " + lookupNode + " was found in tree, check parentNodes header columns !";
            }
            if (primKeys[parentNode] == "") {
                return "(writeTree): no primary key of parent " + lookupNode + " given, check primaryKey column there !";
            }
            // property path of record including subnode: if there should be intermediate subnode(s) in the parent, insert them before root element of record
            std::string subnodeFRec = (subnodeOfParent == "" ? rootElemRec : subnodeOfParent + "." + rootElemRec);
            // insert all foreign key collections into parent tables. records are grouped by their FK (rowsFK).
            for (std::pair<std::string, pt::ptree> && foreignKeyPair : tables[tableLookup]) {
                // rowsFK is the lookup key into the parent table
                std::string rowsFK = foreignKeyPair.first;
                pt::ptree foreignRecordset = foreignKeyPair.second;
                // get all the root nodes of the parent's records to search for the correct parent node
                bool foundPrimaryKey = false;

                // iterate through all parent key record collections referred to by subtables parentNode (rootnode + optional subnode)
                for (treeMap::value_type && parentKeysPair : parentTableTrees.find(lookupNode)->second) {
                    // iterate through all records (ptrees) in key collection
                    for (pt::ptree::iterator parentRecPair = parentKeysPair.second->begin(); parentRecPair != parentKeysPair.second->end(); ++parentRecPair) {
                        // important here: assign a reference to parentRecPtree (pointer!), otherwise a copy is created!
                        pt::ptree &parentRecPtree = parentRecPair->second;
                        // check whether any primary keys could be found in parent records' rootnode (if not, indicates an error)
                        if (!parentRecPtree.get_child_optional(primKeys[parentNode])) {
                            return "(writeTree): given primary key node of parent " + primKeys[parentNode] + " was not found in header of parent table with parentnode " + rootNodes[parentNode] + " !";
                        }
                        // now get the primary key node in the parent records' rootnode
                        pt::ptree parentsPKNode = parentRecPtree.get_child(primKeys[parentNode]);
                        // iterator of FK entries in the parent table: find the key placeholder for the FK entries (if not, indicates an error)
                        if (!parentRecPtree.get_child_optional(subnodeFRec)) {
                            return "(writeTree): given subnode + root record element " + subnodeFRec + " was not found in header of parent table with parentnode " + rootNodes[parentNode] + " !";
                        }
                        std::string primKey = parentsPKNode.get_value<std::string>("");
                        // only initialize parentRecordEmpty items once
                        if (parentRecordEmpty.find(parentNode + primKey) == parentRecordEmpty.end()) {
                            parentRecordEmpty[parentNode + primKey] = true;
                        }

                        // get the value of the parents primary key node and check if a matching foreign key is found there .. get_value<std::string>("") gets the value with default return of ""
                        if (primKey == rowsFK) {
                            foundPrimaryKey = true;
                            parentRecordEmpty[parentNode + primKey] = false;
                            // in case of single node descendancy - insert the actual foreign key record entries from the foreign recordset at the placeholder and remove the placeholder
                            if (subnodeOfParent == "") {
                                try {
                                    pt::ptree::iterator FKplaceholder = parentRecPtree.to_iterator(parentRecPair->second.find(subnodeFRec));
                                    parentRecPtree.insert(FKplaceholder, foreignRecordset.begin(), foreignRecordset.end());
                                    // pass reference to inserted tree for parentTableTree lookup
                                    parentTableTrees[subRootNode].insert(rowsFK, &parentRecPair->second.get_child(subnodeFRec));
                                    parentRecPtree.erase(FKplaceholder);
                                }
                                catch (std::exception ex) {
                                    return "(writeTree): problem replacing subnode of parent " + subnodeFRec + ": " + ex.what();
                                }
                                // or - in case of multiple node descendancy - just put the foreign recordset as a child
                            }
                            else {
                                // pass reference to inserted tree for parentTableTree lookup
                                parentTableTrees[subRootNode].insert(rowsFK, &parentRecPtree.put_child(subnodeOfParent, foreignRecordset));
                            }
                            // don't leave loop here as there might be empty parent subtable records (placeholders) afterwards, which wouldn't get removed then.
                            //break; 
                        }
                    }
                }
                // add reference to inserted tree to rowsFK collection in parent Table Tree lookup [key = rows foreign key] 
                
                // after having iterated all records of parent tables, check if no primary key has been found
                if (!foundPrimaryKey) {
                    return "(writeTree): couldn't find any record in parent to insert record with foreign key '" + rowsFK  + "' into !";
                }
            }
            // after inserting all foreign key collections in parent, remove any left (empty) foreign key placeholders in parent records
            for (treeMap::value_type&& parentKeysPair : parentTableTrees.find(lookupNode)->second) {
                // iterate through all records (ptrees) in key collection
                for (pt::ptree::iterator parentRecPair = parentKeysPair.second->begin(); parentRecPair != parentKeysPair.second->end(); ++parentRecPair) {
                    pt::ptree parentsPKNode = parentRecPair->second.get_child(primKeys[parentNode]);
                    std::string primKey = parentsPKNode.get_value<std::string>("");
                    if (parentRecordEmpty[parentNode + primKey]) {
                        // in case of multiple node descendancy - skip subnodeOfParent
                        subnodeFRec = (subnodeOfParent == "" ? subnodeFRec : subnodeOfParent);
                        pt::ptree::iterator FKplaceholder = parentRecPair->second.to_iterator(parentRecPair->second.find(subnodeFRec));
                        parentRecPair->second.erase(FKplaceholder);
                    }
                }
            }
        }
    }
    return "";
}

// helper function to retrieve relation and node information from definition Row (given in defRow) in control table:
// parentNode .. parent node name of table data (records, being placed inside rootElemRec nodes),
// subnodeOfParent .. optional subnode name inside parent where table data is to be placed (otherwise records are placed directly under parentNode), 
// primaryKeyName .. primary key name of table, 
// foreignKeyName .. foreign key name (only in sub tables), 
// rootElemRec ..root element node name of records
void TreeizeRelD::getRelationInfo(const std::vector<std::string> &defRow,
    std::string &parentNode, std::string &subnodeOfParent,
    std::string &primaryKeyName, std::string & foreignKeyName, std::string &rootElemRec) 
{
    parentNode = defRow[0];
    subnodeOfParent = defRow[1];
    primaryKeyName = defRow[2];
    foreignKeyName = defRow[3];
    rootElemRec = defRow[4];
}

// write a subtable given in table into property tree ptFKTable
// if foreignKeyName is given (non empty), matches of foreignKeyName with a header field (first row of table) 
// are used to group all data with the same foreign key beneath that foreign key value
std::string TreeizeRelD::writeTable(pt::ptree &ptFKTable, const std::vector<std::vector<std::string>> &table,
    std::string foreignKeyName, std::string rootElemRec) 
{
    // iterate data rows, first row is header
    for (size_t i = 1; i < table.size(); i++) {
        // tree of the record in the (sub) table
        pt::ptree ptRecord;
        // produce the record, getting primary key / foreign key values along the way
        std::string rowsFK;
        std::string errmsg = writeRecord(ptRecord, table[i], table[0], foreignKeyName, rowsFK);
        if (errmsg != "") { return errmsg; }
        // if foreign key was not found (being in a parent table), use "/" to create foreign key "less" records
        std::string rowsFKExt = (rowsFK == "" ? "/" : rowsFK);
        // add record to FK table segment, abusing foreign key value as the root node for the record for intermediate storage in separate structure
        // the records are taken in the second pass of writeTree and put into the correct place
        try {
            if (ptRecord.get_child_optional(rootElemRec)) { // record contains rootElemRec, so add record to rowsFKExt
                if (ptFKTable.get_child_optional(rowsFKExt)) { // rowsFK already contained in Table, so add record to existing rowsFK bracket
                    // ptRecord.back().second removes the surrounding element
                    ptFKTable.get_child(rowsFKExt).push_back(std::make_pair(rootElemRec, ptRecord.back().second));
                }
                else {
                    ptFKTable.add_child(rowsFKExt, ptRecord);
                }
            }
            else { // rootElemRec not contained in columns, add record with rowsFK + rootElemRec
                ptFKTable.add_child(rowsFKExt + "." + rootElemRec, ptRecord);
            }
        } catch (std::exception ex) {
            return std::string("(writeTable): ").append(ex.what());
        }
    }
    return "";
}

// write a record given in recordRow (data) into property tree ptRecord, path info given in header
// if foreignKey matches a header field, the corresponding value is returned in rowsFK 
// and the column value is ignored for inclusion in the property tree
std::string TreeizeRelD::writeRecord(pt::ptree &ptRecord, const std::vector<std::string> &recordRow,
    const std::vector<std::string> &header, std::string foreignKey, std::string &rowsFK) 
{
    rowsFK = "";
    // traverse columns of record
    for (size_t i = 0; i < recordRow.size(); i++) {
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