# ORE DB

ORE DB is
- a collection of sql DDL scripts to create a Database for storing ORE definitions, marketdata and trade data.
- perl scripts to extract given xml files (e.g. examples) or marketdata/fixingdata into sql DML scripts
- cmd scripts (currently windows only) to run the DDL and DML scripts to load ORE data into this database
- In the DDL scripts are XML query Views to extract the data into usable xml text. The logic of this extraction can be seen in [https://rkapl123.github.io/SQLServerXML.html](https://rkapl123.github.io/SQLServerXML.html)
