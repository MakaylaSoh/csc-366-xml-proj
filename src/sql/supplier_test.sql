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

INSERT INTO xml_order (xml_doc) VALUES  (
'<order> 
    <order_time>2020-01-08T05:01:04</order_time>
    <order_date>2020-01-08</order_date> 
</order>');

INSERT INTO xml_supplier_contract (supplier_id, store_id, xml_doc) VALUES (1, 1) (
'<supplier_contract>
     <supplier/>
        <store id>
            <address>
                <country>Country1</country>
                <state>State1</state>
                <city>City1</city>
                <street>Street1</street>
                <zip>11111</zip>
            </address>
        </store>
</supplier_contract>');

INSERT INTO xml_product (xml_doc) VALUES  (
'<product>
  <total_cost>18</total_cost>
  <quantity>2</quantity>
</product>');
