-- queries for the supplier information needs for the xml 

-- 1) Find all stores that have deliveries scheduled on a given day of the week.
-- selecting for Monday
SELECT DISTINCT p.store_id
FROM xml_purchase p
WHERE ExtractValue(p.xml_doc, "count(purchase[supplier]/order[order_date = '2024-03-04'])") > 0;
-- We filtered for a specific date rather than a given day of the week because the XPath support for querying a 
-- specific day of the week was very complex. 

-- 2) For each store, find the supplier from which the store buys the most products.  
SELECT DISTINCT p.store_id, MAX(ExtractValue(p.xml_doc, "count(purchase[supplier]/order/product)"))
FROM xml_purchase p
WHERE ExtractValue(p.xml_doc, "count(purchase[supplier]/order/product)") > 0
GROUP BY p.store_id

-- 3) Find the product on which the supplier makes the greatest revenue across all contracts. 
-- We realized that it would be extremely difficult to write an XPath query to extract this information, since the data
-- would have to be calculated using all of the transaction data. This would be made easier if we made a summary 
-- structure that holds more general information summarizing the transactions for each supplier, such as monthly
-- totals or counts for the number of each type of product purchased. 

-- 4) For each product, find which store spends the most money on the product. 
-- This query presented a similar issue to Query #3. It is extremely difficult to extract this information using an 
-- XPath query since all of the information is in transaction data, and it would be made easier with a summary 
-- structure similar to the one described above. Our current XML structure does not support querying this information
-- in a simple way. 