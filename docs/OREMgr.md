# ORE Mgr

## TreeizeRelD (Treeize Relational Data)

TreeizeRelD was inspired by a javascript tool to treeize data (into JSON): [https://github.com/kwhitley/treeize](https://github.com/kwhitley/treeize) and is implemented using boost::property_tree.

The idea of both is to create a tree from a given set of related data tables (using the relational concept of primary and foreign keys).

The public API has two functions, one for creating XML and one for creating JSON:

```c++
    std::string writeTreeAndCreateXML(const std::vector<std::vector<std::string>>& control, const std::vector<std::vector<std::vector<std::string>>>& data, int *result);
```
returns a flat XML (without indentation and whitespace) created from tables given in the table collection data (tables consist of 1 header row and multiple data rows) using table control for definition (relations and tags).
result = 1 in case of problems (the error message/exception is returned instead of the XML)

```c++
    std::string writeTreeAndCreateJSON(const std::vector<std::vector<std::string>>& control, const std::vector<std::vector<std::vector<std::string>>>& data, int *result);
```
returns a flat (not indented) JSON created from tables as above.
result = 1 in case of problems (the error message/exception is returned instead of the JSON)

The control table is set up as follows:
For each table passed in data (data table), a row with parentNode, subnodeOfParent, primaryKey, foreignKey and rootElemRec (in this order) needs to be provided in a control table.

- The parentNode is the name of the node under which the given table is to be placed (for the top parent table this is the top root element, for sub tables, the row root name of it's parent tables record). 
- The optional subnodeOfParent can be given, if the data is not to be put directly beneath the row root name of the parent (=parentNode), but one or more nodes below. Beware that the full node name (i.e. subnodeOfParent.rootElemRec has to be present in the parent tables header row)
- The primaryKey (in subtables optional) is the header row name (see below) that gives the primary key information of the parent table.
- The foreignKey (in parent tables optional) is the header row name that denotes the relational link to the primary key in the sub table
- The rootElemRec is the header row name that is supposed to be the root element of the records in the parent/sub table.

The data has to contain a header row, which denotes the path information of the desired structure using boost property tree notation (subtags are separated with dots, XML attributes are denoted using <xmlattr>.name). 
XML Attribute notation is not allowed for `writeTreeAndCreateJSON` (leads to an exception being thrown)

### Following XML representation of a simple 2 table nested structure is created with the control and data tables below:

```xml
<root>
	<rec>
		<a>dataA1</a>
		<b attr="attB1">dataB1</b>
		<b attr="attB2">dataB2</b>
		<c>
			<d>dataCD1</d>
		</c>
	</rec>
	<rec>
		<a>dataA2</a>
		<b attr="attB3">dataB3</b>
		<b attr="attB4">dataB4</b>
		<c>
			<d>dataCD2</d>
		</c>
	</rec>
</root>
```

#### control table  

|parentNode|subnodeOfParent|primaryKey|foreignKey|rootElemRec|
|root||a||rec|
|root.rec|||a|b|

#### data tables
table data[1] has child relation to table data[0] via FK/PK "a"

- data[0]:  

|a|b|c.d|
|dataA1||dataCD1|
|dataA2||dataCD2|

- data[1]:  

|b.<xmlattr>.attr|b|a|
|attB1|dataB1|dataA1|
|attB2|dataB2|dataA1|
|attB3|dataB3|dataA2|
|attB4|dataB4|dataA2|

### Following XML representation of a 2 table nested structure with subrecords being placed under subnodes is created with the control and data tables below:

```xml
<root>
	<rec>
		<a>dataA1</a>
		<sub>
			<subsub>
				<b attr="attB1">dataB1</b>
				<b attr="attB2">dataB2</b>
			<subsub>
		</sub>
		<c>
			<d>dataCD1</d>
		</c>
	</rec>
	<rec>
		<a>dataA2</a>
		<sub>
			<subsub>
				<b attr="attB3">dataB3</b>
				<b attr="attB4">dataB4</b>
			</subsub>
		</sub>
		<c>
			<d>dataCD2</d>
		</c>
	</rec>
</root>
```

#### control table  

|parentNode|subnodeOfParent|primaryKey|foreignKey|rootElemRec|
|root||a||rec|
|root.rec|sub.subsub||a|b|

#### data tables
table data[1] has child relation to table data[0] via FK/PK "a"

- data[0]:  

|a|sub.subsub.b|c.d|
|dataA1||dataCD1|
|dataA2||dataCD2|

- data[1]:  

|b.<xmlattr>.attr|b|a|
|attB1|dataB1|dataA1|
|attB2|dataB2|dataA1|
|attB3|dataB3|dataA2|
|attB4|dataB4|dataA2|


### Following XML representation of a 3 table nested structure with subrecords being placed under subnodes is created with the control and data tables below:

```xml
<root>
	<rec>
		<a>dataA1</a>
		<sub>
			<bRec>
				<b attr=\"attB1">dataB1</b>
				<subsub>
					<s>s1</s>
					<s>s2</s>
				</subsub>
			</bRec>
			<bRec>
				<b attr="attB2">dataB2</b>
				<subsub>
					<s>s3</s>
					<s>s4</s>
					<s>s5</s>
				</subsub>
			</bRec>
		</sub>
		<c>
			<d>dataCD1</d>
		</c>
	</rec>
	<rec>
		<a>dataA2</a>
		<sub>
			<bRec>
				<b attr="attB3">dataB3</b>
				<subsub>
					<s>s6</s>
				</subsub>
			</bRec>
			<bRec>
				<b attr="attB4">dataB4</b>
			</bRec>
		</sub>
		<c>
			<d>dataCD2</d>
		</c>
	</rec>
</root>
```

#### control table  

|parentNode|subnodeOfParent|primaryKey|foreignKey|rootElemRec|
|root||a||rec|
|root.rec|sub|b|a|bRec|
|root.rec.sub.bRec|subsub||b|s|

#### data tables  

subtable data[1] (being in node sub) has child relation to table data[0] via FK/PK "a"

- data[0]:  

|a|sub.bRec|c.d|
|dataA1||dataCD1|
|dataA2||dataCD2|

subtable data[2] (being in node subsub) has child relation to table data[2] via FK/PK "b"
- data[1]:  

|b.<xmlattr>.attr|b|a|subsub.s|
|attB1|dataB1|dataA1||
|attB2|dataB2|dataA1||
|attB3|dataB3|dataA2||
|attB4|dataB4|dataA2||

- data[2]:  

|s|b|
|s1|dataB1|
|s2|dataB1|
|s3|dataB2|
|s4|dataB2|
|s5|dataB2|
|s6|dataB3|
