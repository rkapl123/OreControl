# Overview

In enhancement of the official ORE Data flow (from the userguide), OREControl modules fit in as follows:

![Image of screenshot1](https://raw.githubusercontent.com/rkapl123/OREControl/master/docs/overview.png)


# ORE Addin

Excel-DNA based Add-in for managing ORE and ORE-DB from Excel, starting ORE with data/configuration in Excel and ORE-Database
and storing results into ORE-Database or Excel.

For details see [OREAddin](OREAddin.md)


# ORE-DB

ORE-DB creates a (currently only MSSQL Server) Database using Table and XML View definitions for storing Opensource risk engine Data and
converts existing ORE XML Files to insert statements, which can be imported into the database.

For details see [OREDB](OREDB.md)

# ORE Mgr

OREMgr provides a SWIG Interface to ORE and a .NET DLL wrapper (for ORE Addin and other applications)

For details see [OREMgr](OREMgr.md)
