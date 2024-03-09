DROP DATABASE IF EXISTS customer_db;
CREATE DATABASE IF NOT EXISTS customer_db;
USE customer_db;

CREATE TABLE xml_rewards_account (
  id INTEGER PRIMARY KEY AUTO_INCREMENT,
  xml_doc TEXT
);


CREATE TABLE xml_customer (
  id INTEGER PRIMARY KEY AUTO_INCREMENT,
  xml_doc TEXT,
  FOREIGN KEY (store_id) REFERENCES xml_store(id),
  FOREIGN KEY (bank_id) REFERENCES xml_bank(id)
);


INSERT INTO xml_rewards_account (xml_doc) VALUES  (
'<?xml version="1.0"?>
<rewards>
  <account_number>
    <name_on_account>name1</name_on_account>
    <total_points>10</total_points>
  </account_number>
</rewards>');


INSERT INTO xml_customer (xml_doc) VALUES  (
'<?xml version="1.0"?>
<customer>
    <first_name>name1</first_name>
    <last_name>10</lastt_name>
</customer>');