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

CREATE TABLE xml_work_shift (
  id INTEGER PRIMARY KEY AUTO_INCREMENT,
  employee_id INTEGER,
  xml_doc TEXT,
  FOREIGN KEY (employee_id) REFERENCES xml_employee(id)
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


INSERT INTO xml_bank (xml_doc) VALUES  (
'<?xml version="1.0"?>
<bank>
  <account_number>1</account_number>
  <name_on_account>firstname1 lastname1</name_on_account>
  <bank_name>Bank Name 1</bank_name>
</bank>');


INSERT INTO xml_employee (store_id, bank_id, xml_doc) VALUES  (1, 1,
'<?xml version="1.0"?>
<employee> 
    <firstname>first1</firstname>
    <lastname>last1</lastname>
    <position>manager</position>
    <store>
        <address>
            <country>Country1</country>
            <state>State1</state>
            <city>City1</city>
            <street>Street1</street>
            <zip>11111</zip>
        </address>
    </store>
    <bank>
        <account_number></account_number>
        <name_on_account></name_on_account>
        <bank_name></bank_name>
    </bank>
    <birthday>2002-09-12</birthday> 
    <hourly_rate>20</hourly_rate>
</employee>');


INSERT INTO xml_work_shift (employee_id, xml_doc) VALUES  (1,
'<?xml version="1.0"?>
<xml_work_shift>
  <date>2024-04-16</date>
  <clock_in_time>09:00</clock_out_time>
  <clock_out_time>17:30</clock_out_time>
  <total_hours>08:30</total_hours>
</xml_work_shift>');