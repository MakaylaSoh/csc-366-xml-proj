-- 1) Find all stores that have deliveries scheduled on a given day of the week.
-- selecting for Monday
SELECT DISTINCT p.store_id
FROM xml_purchase p
WHERE ExtractValue(p.xml_doc, "count(purchase[supplier]/order[order_date = '2024-03-04'])") > 0;
-- We filtered for a specific date rather than a given day of the week because the XPath support for querying a 
-- specific day of the week was very complex. 

-- 2) For each store, find the supplier from which the store buys the most products.  
-- 3) Find the product on which the supplier makes the greatest profit across all contracts. 
-- 4) For each product, find which store spends the most money on the product. 
