# csc-366-xml-proj

## Getting Started
1. Clone repo
2. Install xmllint

Write .dtd files to define the format of custom xml entities.
Write .xml files that use the .dtd files to make our custom entities.

Use xmllint to test that the .dtd and .xml files are valid. You can test on the command line using:
```
xmllint --noout --dtdvalid [path_to_dtd_file] [path_to_xml_file]
```

Example:
```
xmllint --noout --dtdvalid ./src/dtd/employee.dtd ./src/test.xml
```
