DROP DATABASE IF EXISTS test_db;
CREATE DATABASE IF NOT EXISTS test_db;
USE test_db;

CREATE TABLE xml_store (
  id INTEGER PRIMARY KEY AUTO_INCREMENT,
  xml_doc TEXT
);

CREATE TABLE xml_purchase (
  id INTEGER PRIMARY KEY AUTO_INCREMENT,
  store_id INTEGER,
  xml_doc TEXT,
  FOREIGN KEY (store_id) REFERENCES xml_store(id)
);

CREATE TABLE xml_rewards_account (
  id INTEGER PRIMARY KEY AUTO_INCREMENT,
  purchase_id INTEGER,
  xml_doc TEXT,
  FOREIGN KEY (purchase_id) REFERENCES xml_purchase(id)
);

CREATE TABLE xml_supplier (
  id INTEGER PRIMARY KEY AUTO_INCREMENT,
  xml_doc TEXT
);


INSERT INTO xml_store (xml_doc) VALUES (
'<store>
  <address>
    <country>country1</country>
    <state>state1</state>
    <city>city1</city>
    <street>street1</street>
    <zip>11111</zip>
  </address>
  <employee>
    <firstname>firstname1</firstname>
    <lastname>lastname1</lastname>
    <position>manager</position>
    <bank>
      <account_number>1</account_number>
      <name_on_account>firstname1 lastname1</name_on_account>
      <bank_name>bank1</bank_name>
    </bank>
    <birthday>2002-09-12</birthday>
    <hourly_rate>20.25</hourly_rate>
    <scheduled_work_shift>
      <date>2024-03-01</date>
      <clock_in_time>09:15</clock_in_time>
      <clock_out_time>18:30</clock_out_time>
      <total_hours>09.25</total_hours>
    </scheduled_work_shift>
    <scheduled_work_shift>
      <date>2024-03-02</date>
      <clock_in_time>9:00</clock_in_time>
      <clock_out_time>18:00</clock_out_time>
      <total_hours>09.00</total_hours>
    </scheduled_work_shift>
    <scheduled_work_shift>
      <date>2024-03-03</date>
      <clock_in_time>09:00</clock_in_time>
      <clock_out_time>19:00</clock_out_time>
      <total_hours>10.00</total_hours>
    </scheduled_work_shift>
  </employee>
  <employee>
    <firstname>firstname2</firstname>
    <lastname>lastname2</lastname>
    <position>crew</position>
    <bank>
      <account_number>2</account_number>
      <name_on_account>firstname2 lastname2</name_on_account>
      <bank_name>bank2</bank_name>
    </bank>
    <birthday>2001-07-30</birthday>
    <hourly_rate>16.50</hourly_rate>
    <scheduled_work_shift>
      <date>2024-03-02</date>
      <clock_in_time>07:00</clock_in_time>
      <clock_out_time>12:30</clock_out_time>
      <total_hours>05.50</total_hours>
    </scheduled_work_shift>
    <scheduled_work_shift>
      <date>2024-03-03</date>
      <clock_in_time>07:00</clock_in_time>
      <clock_out_time>01:00</clock_out_time>
      <total_hours>06.00</total_hours>
    </scheduled_work_shift>
    <scheduled_work_shift>
      <date>2024-03-04</date>
      <clock_in_time>16:00</clock_in_time>
      <clock_out_time>21:00</clock_out_time>
      <total_hours>05.00</total_hours>
    </scheduled_work_shift>
  </employee>
  <employee>
    <firstname>firstname3</firstname>
    <lastname>lastname3</lastname>
    <position>crew</position>
    <bank>
      <account_number>3</account_number>
      <name_on_account>firstname3 lastname3</name_on_account>
      <bank_name>bank3</bank_name>
    </bank>
    <birthday>1997-01-14</birthday>
    <hourly_rate>16.72</hourly_rate>
    <scheduled_work_shift>
      <date>2024-03-02</date>
      <clock_in_time>16:00</clock_in_time>
      <clock_out_time>21:00</clock_out_time>
      <total_hours>05.00</total_hours>
    </scheduled_work_shift>
    <scheduled_work_shift>
      <date>2024-03-03</date>
      <clock_in_time>16:00</clock_in_time>
      <clock_out_time>21:00</clock_out_time>
      <total_hours>05.00</total_hours>
    </scheduled_work_shift>
    <scheduled_work_shift>
      <date>2024-03-03</date>
      <clock_in_time>16:00</clock_in_time>
      <clock_out_time>21:00</clock_out_time>
      <total_hours>05.00</total_hours>
    </scheduled_work_shift>
  </employee>
  <order>
    <total_cost>60.00</total_cost>
    <order_time>02:00</order_time>
    <order_date>2024-04-04</order_date>
    <product>
      <item_name>12oz Coke Bottle</item_name>
      <supplier_name>Coca Cola</supplier_name>
      <quantity>50</quantity>
      <unit_price>0.99</unit_price>
    </product>
  </order>
    <order>
    <total_cost>60.00</total_cost>
    <order_time>06:00</order_time>
    <order_date>2024-03-04</order_date>
    <product>
      <item_name>Frozen Minibons</item_name>
      <supplier_name>Cinnabon</supplier_name>
      <quantity>100</quantity>
      <unit_price>2.50</unit_price>
    </product>
  </order>
</store>');


INSERT INTO xml_store (xml_doc) VALUES (
'<?xml version="1.0"?>
<store>
  <address>
    <country>country1</country>
    <state>state2</state>
    <city>city2</city>
    <street>street2</street>
    <zip>22222</zip>
  </address>
  <employee>
    <firstname>firstname4</firstname>
    <lastname>lastname4</lastname>
    <position>manager</position>
    <bank>
      <account_number>4</account_number>
      <name_on_account>firstname4 lastname4</name_on_account>
      <bank_name>bank4</bank_name>
    </bank>
    <birthday>1999-10-11</birthday>
    <hourly_rate>21.00</hourly_rate>
    <scheduled_work_shift>
      <date>2024-03-01</date>
      <clock_in_time>07:00</clock_in_time>
      <clock_out_time>16:30</clock_out_time>
      <total_hours>09:30</total_hours>
    </scheduled_work_shift>
  </employee>
  <employee>
    <firstname>firstname5</firstname>
    <lastname>lastname5</lastname>
    <position>crew</position>
    <bank>
      <account_number>5</account_number>
      <name_on_account>firstname5 lastname5</name_on_account>
      <bank_name>bank5</bank_name>
    </bank>
    <birthday>1995-04-17</birthday>
    <hourly_rate>17.20</hourly_rate>
    <scheduled_work_shift>
      <date>2024-03-02</date>
      <clock_in_time>07:00</clock_in_time>
      <clock_out_time>12:30</clock_out_time>
      <total_hours>05.50</total_hours>
    </scheduled_work_shift>
    <scheduled_work_shift>
      <date>2024-03-03</date>
      <clock_in_time>07:00</clock_in_time>
      <clock_out_time>01:00</clock_out_time>
      <total_hours>06.00</total_hours>
    </scheduled_work_shift>
    <scheduled_work_shift>
      <date>2024-03-04</date>
      <clock_in_time>16:00</clock_in_time>
      <clock_out_time>21:00</clock_out_time>
      <total_hours>05.00</total_hours>
    </scheduled_work_shift>
  </employee>
  <employee>
    <firstname>firstname6</firstname>
    <lastname>lastname6</lastname>
    <position>crew</position>
    <bank>
      <account_number>6</account_number>
      <name_on_account>firstname6 lastname6</name_on_account>
      <bank_name>bank2</bank_name>
    </bank>
    <birthday>1997-01-14</birthday>
    <hourly_rate>16.72</hourly_rate>
    <scheduled_work_shift>
      <date>2024-03-02</date>
      <clock_in_time>16:00</clock_in_time>
      <clock_out_time>21:00</clock_out_time>
      <total_hours>05.00</total_hours>
    </scheduled_work_shift>
    <scheduled_work_shift>
      <date>2024-03-03</date>
      <clock_in_time>16:00</clock_in_time>
      <clock_out_time>21:00</clock_out_time>
      <total_hours>05.00</total_hours>
    </scheduled_work_shift>
    <scheduled_work_shift>
      <date>2024-03-03</date>
      <clock_in_time>16:00</clock_in_time>
      <clock_out_time>21:00</clock_out_time>
      <total_hours>05.00</total_hours>
    </scheduled_work_shift>
  </employee>
  <order>
    <total_cost>60.00</total_cost>
    <order_time>02:00</order_time>
    <order_date>2024-04-04</order_date>
    <product>
      <item_name>12oz Coke Bottle</item_name>
      <supplier_name>Coca Cola</supplier_name>
      <quantity>50</quantity>
      <unit_price>0.99</unit_price>
    </product>
  </order>
    <order>
    <total_cost>60.00</total_cost>
    <order_time>06:00</order_time>
    <order_date>2024-03-04</order_date>
    <product>
      <item_name>Frozen Minibons</item_name>
      <supplier_name>Cinnabon</supplier_name>
      <quantity>100</quantity>
      <unit_price>2.50</unit_price>
    </product>
  </order>
</store>');

INSERT INTO xml_purchase (store_id, xml_doc) VALUES  (1,
'<?xml version="1.0"?>
<purchase>
  <customer>
    <payment_method>credit</payment_method>
    <card_number>*****1111</card_number>
  </customer>
  <order>
    <total_cost>15.97</total_cost>
    <order_time>12:22</order_time>
    <order_date>2024-03-17</order_date>
    <product>
      <item_name>apples</item_name>
      <supplier_name>supplier1</supplier_name>
      <quantity>5</quantity>
      <unit_price>2.99</unit_price>
    </product>
    <product>
      <item_name>bread</item_name>
      <supplier_name>supplier1</supplier_name>
      <quantity>1</quantity>
      <unit_price>3.25</unit_price>
    </product>
    <product>
      <item_name>peanut butter</item_name>
      <supplier_name>supplier2</supplier_name>
      <quantity>1</quantity>
      <unit_price>4.50</unit_price>
    </product>
    <product>
      <item_name>jam</item_name>
      <supplier_name>supplier3</supplier_name>
      <quantity>1</quantity>
      <unit_price>3.75</unit_price>
    </product>
  </order>
</purchase>');


INSERT INTO xml_purchase (store_id, xml_doc) VALUES  (1,
'<?xml version="1.0"?>
<purchase>
  <customer>
    <payment_method>debit</payment_method>
    <card_number>*****2222</card_number>
  </customer>
  <order>
    <total_cost>14.69</total_cost>
    <order_time>12:22</order_time>
    <order_date>2024-03-17</order_date>
    <product>
      <item_name>chicken</item_name>
      <supplier_name>supplier4</supplier_name>
      <quantity>2</quantity>
      <unit_price>2.30</unit_price>
    </product>
    <product>
      <item_name>ice cream</item_name>
      <supplier_name>supplier4</supplier_name>
      <quantity>1</quantity>
      <unit_price>4.89</unit_price>
    </product>
    <product>
      <item_name>peanut butter</item_name>
      <supplier_name>supplier5</supplier_name>
      <quantity>1</quantity>
      <unit_price>4.50</unit_price>
    </product>
  </order>
</purchase>');


INSERT INTO xml_purchase (store_id, xml_doc) VALUES  (2,
'<?xml version="1.0"?>
<purchase>
  <customer>
    <payment_method>debit</payment_method>
    <card_number>*****3333</card_number>
  </customer>
  <order>
    <total_cost>22.39</total_cost>
    <order_time>12:22</order_time>
    <order_date>2024-03-17</order_date>
    <product>
      <item_name>coffee</item_name>
      <supplier_name>supplier6</supplier_name>
      <quantity>1</quantity>
      <unit_price>4.15</unit_price>
    </product>
    <product>
      <item_name>cookies</item_name>
      <supplier_name>supplier6</supplier_name>
      <quantity>1</quantity>
      <unit_price>3.99</unit_price>
    </product>
    <product>
      <item_name>cheese</item_name>
      <supplier_name>supplier2</supplier_name>
      <quantity>1</quantity>
      <unit_price>4.50</unit_price>
    </product>
    <product>
      <item_name>yogurt</item_name>
      <supplier_name>supplier2</supplier_name>
      <quantity>1</quantity>
      <unit_price>9.75</unit_price>
    </product>
  </order>
</purchase>');


INSERT INTO xml_rewards_account (purchase_id, xml_doc) VALUES  (1,
'<?xml version="1.0"?>
<rewards_account>
  <account_number>1</account_number>
  <phone_number>(111)111-1111</phone_number>
  <name_on_account>name1</name_on_account>
  <total_points>10</total_points>
</rewards_account>');


INSERT INTO xml_rewards_account (purchase_id, xml_doc) VALUES  (2,
'<?xml version="1.0"?>
<rewards_account>
  <account_number>2</account_number>
  <phone_number>(222)222-2222</phone_number>
  <name_on_account>name2</name_on_account>
  <total_points>11</total_points>
</rewards_account>');


INSERT INTO xml_rewards_account (purchase_id, xml_doc) VALUES  (3,
'<?xml version="1.0"?>
<rewards_account>
  <account_number>3</account_number>
  <phone_number>(333)333-3333</phone_number>
  <name_on_account>name1</name_on_account>
  <total_points>10</total_points>
</rewards_account>');


INSERT INTO xml_supplier (xml_doc) VALUES  (
'<?xml version="1.0"?>
<supplier>
  <name>Coca Cola</name>
  <address>
    <country>country1</country>
    <state>state1</state>
    <city>city1</city>
    <street>street1</street>
    <zip>11111</zip>
  </address>
  <contract>
    <start_date>2023-01-01</start_date>
    <end_date>2025-01-01</end_date>
    <details>Discount on drinks.</details>
  </contract>
</supplier>');

INSERT INTO xml_supplier (xml_doc) VALUES  (
'<?xml version="1.0"?>
<supplier>
  <name>Cinnabon</name>
  <address>
    <country>country1</country>
    <state>state2</state>
    <city>city2</city>
    <street>street2</street>
    <zip>22222</zip>
  </address>
  <contract>
    <start_date>2022-06-15</start_date>
    <end_date>2024-06-14</end_date>
    <details>Negotiation on seasonal items.</details>
  </contract>
</supplier>');
-- 1: Find the total money spent by a store on order between two given dates
SELECT
        SUM(ExtractValue(xml_doc, "//store/order/total_cost[../order_date > '2024-03-01' and ../order_date < '2024-03-10']")) AS total_cost
FROM
    xml_store;

-- Hypothetical SQL:
-- SELECT SUM(price) FROM SupplierContractProduct scp, SupplierContract sc, Store s
-- WHERE scp.supplier_contract = sc.id AND sc.store = s.id AND scp.deliverytime BETWEEN date1 AND date2;


-- 2: Find all suppliers to a specific store

SELECT id, ExtractValue(xml_doc, "//store/order/product/supplier_name") as suppliers
FROM xml_store
WHERE id = 1; 

-- Hypothetical SQL:

-- select su.id from suppliers, SupplierContract sc, Store s
-- where  su.id = sc.supplier and sc.store = s.id and s.id = [storeid]


--3: Find the product that made the most money for a store on a given day
SELECT (ExtractValue(xml_doc, "//purchase/order/product/quantity * //purchase/order/product/unit_price"))
FROM xml_purchase;

--This query proved impossible to execute in XPath, as it requires simultaneously getting two disparate values out of the tree,
-- which cannot be done in our limited exploration.

-- Hypothetical SQL:

-- with a as (select * from order where date = [date]),
-- b as (select * from product, a where order = a.order_id),
-- c as (select SUM(price) as total from b group by product.id),
-- d as (select MAX(total) as bigTotal from c)
-- select product.id from c, d where total = bigTotal


--4: Find the sum of the prices of the store’s supply contracts.

SELECT (ExtractValue(xml_doc, "sum(//store/order/total_cost)")) AS total_cost
FROM
    xml_store
WHERE id = 1
-- Hypothetical SQL:
-- SELECT SUM(price) FROM SupplierContractProduct scp, SupplierContract sc, Store s
-- WHERE scp.supplier_contract = sc.id AND sc.store = s.id AND s.id = [storeid];
