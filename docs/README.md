# Overview

In enhancement of the official ORE Data flow (from the userguide), OREControl modules fit in as follows:

![Image of screenshot1](https://raw.githubusercontent.com/rkapl123/OREControl/master/docs/overview.png)


# ORE Addin

Excel-DNA based Add-in for managing ORE and ORE-DB from Excel, starting ORE with data/configuration in Excel and ORE-Database
and storing results into ORE-Database or Excel.

For details see [OREAddin](OREAddin.md)


# ORE-DB

ORE-DB creates a Database (currently only MS SQL Server and MYSQL are supported) using Table and XML View definitions (only MS SQL Server))
for storing Opensource risk engine Data. Additional scripts convert existing ORE XML Files to insert statements, which can be imported into the database.

For details see [OREDB](OREDB.md)

