#ifdef BOOST_MSVC
#  include <treeizereld/auto_link.hpp>
#endif

#include <boost/property_tree/ptree.hpp>
#include <boost/property_tree/xml_parser.hpp>
#include <boost/foreach.hpp>
#include <string>
#include <set>
#include <exception>
#include <iostream>
namespace pt = boost::property_tree;
namespace TreeizeRelD {

struct debug_settings
{
    std::string m_file;               // log filename
    int m_level;                      // debug level
    std::set<std::string> m_modules;  // modules where logging is enabled
    pt::ptree tree;
    void load(const std::string &filename);
    void save(const std::string &filename);
};
}