DROP DATABASE IF EXISTS customer_db;
CREATE DATABASE IF NOT EXISTS customer_db;
USE customer_db;

CREATE TABLE xml_rewards_account (
  id INTEGER PRIMARY KEY AUTO_INCREMENT,
  xml_doc TEXT
);


CREATE TABLE xml_customer (
  id INTEGER PRIMARY KEY AUTO_INCREMENT,
  rewards_account_id INTEGER,
  xml_doc TEXT,
  FOREIGN KEY (rewards_account_id) REFERENCES xml_rewards_account(id)
);


INSERT INTO xml_rewards_account (xml_doc) VALUES  (
'<?xml version="1.0"?>
<rewards_account>
  <account_number>1</account_number>
  <name_on_account>name1</name_on_account>
  <total_points>10</total_points>
</rewards_account>');


INSERT INTO xml_customer (rewards_account_id, xml_doc) VALUES  (1,
'<?xml version="1.0"?>
<customer>
    <first_name>name1</first_name>
    <last_name>10</lastt_name>
</customer>');