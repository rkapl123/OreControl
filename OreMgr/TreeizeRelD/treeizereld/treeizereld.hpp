#pragma once
#ifdef BOOST_MSVC
#  include <treeizereld/auto_link.hpp>
#endif

#include <boost/property_tree/ptree.hpp>
#include <boost/property_tree/xml_parser.hpp>
#include <boost/property_tree/json_parser.hpp>
#include <boost/log/common.hpp>
#include <boost/log/sources/logger.hpp>
#include <boost/foreach.hpp>
#include <string>
#include <map>
#include <exception>

namespace pt = boost::property_tree;
namespace TreeizeRelD {

    bool writeTree(const std::vector<std::vector<std::string>> &control,
        const std::vector<std::vector<std::vector<std::string>>> &data,
        pt::ptree &ptTree);

    std::string createXML(const pt::ptree &ptTree);

    std::string createJson(const pt::ptree &ptTree);

    void getRelInfo(const std::vector<std::string> &defRow,
        std::string &parentNode, std::string &subnodeOfParent,
        std::string &primaryKey, std::string &foreignKey, std::string &rootElemRec);

    bool writeTable(pt::ptree &ptTable, const std::vector<std::vector<std::string>> &table,
        std::string primaryKey, std::string foreignKey, std::string rootElemRec);

    bool writeRecord(pt::ptree &ptRecord, const std::vector<std::string> &recordRow,
        const std::vector<std::string> &header, std::string primaryKey, std::string &rowsPK, std::string foreignKey,
        std::string &rowsFK);
}