#include <treeizereld/treeizereld.hpp>

void TreeizeRelD::debug_settings::load(const std::string &filename)
{
    // Parse the XML into the property tree.
    pt::read_xml(filename, tree);

    // Use the throwing version of get to find the debug filename.
    // If the path cannot be resolved, an exception is thrown.
    m_file = tree.get<std::string>("debug.filename");

    // Use the default-value version of get to find the debug level.
    // Note that the default value is used to deduce the target type.
    m_level = tree.get("debug.level", 0);

    // Use get_child to find the node containing the modules, and iterate over
    // its children. If the path cannot be resolved, get_child throws.
    // A C++11 for-range loop would also work.
    BOOST_FOREACH(pt::ptree::value_type &v, tree.get_child("debug.modules")) {
        // The data function is used to access the data stored in a node.
        m_modules.insert(v.second.data());
    }

}

void TreeizeRelD::debug_settings::save(const std::string &filename)
{
    // Put the simple values into the tree. The integer is automatically
    // converted to a string. Note that the "debug" node is automatically
    // created if it doesn't exist.
    //tree.put("debug.filename", m_file);
    //tree.put("debug.level", m_level);

    // Add all the modules. Unlike put, which overwrites existing nodes, add
    // adds a new node at the lowest level, so the "modules" node will have
    // multiple "module" children.
    //BOOST_FOREACH(const std::string &name, m_modules)
        //tree.add("debug.modules.module", name);

    // Write property tree to XML file
    pt::write_xml(filename, tree);
}
