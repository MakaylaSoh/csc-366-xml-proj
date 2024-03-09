# csc-366-xml-proj

## Getting Started
1. Clone repo
2. Install mysql 
3. Install xmllint

## DTD Files
Write .dtd files to define the format of custom xml entities.
Write .xml files that use the .dtd files to make our custom entities.

Use xmllint to test that the .dtd and .xml files are valid. You can test on the command line using:
```
xmllint --noout --dtdvalid [path_to_dtd_file] [path_to_xml_file]
```

Example:
```
xmllint --noout --dtdvalid ./src/dtd/store.dtd ./src/store_test.xml
```

## MYSQL files
Write .sql files that contain the mysql statements to create, insert, update, select, etc tables.
These tables should represent hold the entities for the project, and hold xml elements defined in the .dtd files.

Test the SQL statements by running mysql.

The below statement should start an interactive mysql session.
```
> sudo mysql
```

In the interactive environment, run a .sql file using:
```
mysql> source [path_to_mysql_file]
```

In the interactive environment, you can directly run SQL statements. Some useful commands:
```
show databases;
use [my_database]; -- uses specific database, so you can select from that database's tables
select * from [my_table_in_my_database]; -- show all elements in table
```
