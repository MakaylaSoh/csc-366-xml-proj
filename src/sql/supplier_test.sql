DROP DATABASE IF EXISTS supplier_db;
CREATE DATABASE IF NOT EXISTS supplier_db;
USE supplier_db;

CREATE TABLE xml_supplier (
  id INTEGER PRIMARY KEY AUTO_INCREMENT,
  xml_doc TEXT
);

CREATE TABLE xml_order (
  id INTEGER PRIMARY KEY AUTO_INCREMENT,
  total_cost INTEGER, 
  order_time TIME, 
  order_date DATE,
  xml_doc TEXT
);

CREATE TABLE xml_product (
  id INTEGER PRIMARY KEY AUTO_INCREMENT,
  total_cost INTEGER, 
  quantity INTEGER, 
  xml_doc TEXT
);

CREATE TABLE xml_supplier_contract (
  supplier_id INTEGER,
  store_id INTEGER,
  xml_doc TEXT,
  FOREIGN KEY (supplier_id) REFERENCES xml_supplier(id),
  FOREIGN KEY (store_id) REFERENCES xml_store(id)
);



INSERT INTO xml_supplier (xml_doc) VALUES  (
'<supplier_contract id="sc2">
     <supplier id="s2"/>
        <store id="ID2">
            <address>
                <country>Country1</country>
                <state>State1</state>
                <city>City1</city>
                <street>Street1</street>
                <zip>11111</zip>
            </address>
        </store>
</supplier_contract>');

