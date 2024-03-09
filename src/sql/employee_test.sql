DROP DATABASE IF EXISTS company_db;
CREATE DATABASE IF NOT EXISTS company_db;
USE company_db;

CREATE TABLE xml_store (
  id INTEGER PRIMARY KEY AUTO_INCREMENT,
  xml_doc TEXT
);

CREATE TABLE xml_bank (
  id INTEGER PRIMARY KEY AUTO_INCREMENT,
  xml_doc TEXT
);

CREATE TABLE xml_employee (
  id INTEGER PRIMARY KEY AUTO_INCREMENT,
  store_id INTEGER,
  bank_id INTEGER,
  xml_doc TEXT,
  FOREIGN KEY (store_id) REFERENCES xml_store(id),
  FOREIGN KEY (bank_id) REFERENCES xml_bank(id)
);



INSERT INTO xml_store (xml_doc) VALUES  (
'<?xml version="1.0"?>
<store>
  <address>
    <country>country1</country>
    <state>state1</state>
    <city>city1</city>
    <street>street1</street>
    <zip>11111</zip>
  </address>
</store>');