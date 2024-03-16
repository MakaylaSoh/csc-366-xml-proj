-- Information Need: Customers are able to purchase more than one item per order
-- Able to complete
SELECT  
    xml_purchase.id,
    ExtractValue(xml_doc, '/purchase/order/product/item_name') AS ItemsPurchased
FROM xml_purchase
WHERE ExtractValue(xml_doc, '/purchase/customer') IS NOT NULL AND LENGTH(ExtractValue(xml_doc, '/purchase/customer/card_number')) = 9;


-- Information Need: Each customer can create an account associated with their phone number to earn rewards with future purchases
-- Able to complete
SELECT 
    ExtractValue(xml_doc, '/purchase/customer/rewards_account/name_on_account') AS customerName,
    ExtractValue(xml_doc, '/purchase/customer/rewards_account/phone_number') AS phoneNumber, 
    SUM(CAST(ExtractValue(xml_doc, '/purchase/customer/rewards_account/total_points') AS UNSIGNED)) AS totalPoints
FROM xml_purchase
WHERE ExtractValue(xml_doc, '/purchase/customer') IS NOT NULL AND LENGTH(ExtractValue(xml_doc, '/purchase/customer/card_number')) = 9
GROUP BY customerName, phoneNumber;


-- Information Need: Customers are able to access all their previous order histories through their card number OR phone number if they have a rewards account. 
-- Able to complete
SELECT 
    xml_purchase.id AS purchaseId,
    ExtractValue(xml_doc, '/purchase/order/order_date') AS DatePurchased, 
    ExtractValue(xml_doc, '/purchase/order/total_cost') AS OrderCost,
    ExtractValue(xml_doc, '/purchase/customer/card_number') AS CardUsed,
    ExtractValue(xml_doc, '/purchase/order/product/item_name') as ItemsPurchased
FROM xml_purchase
WHERE (ExtractValue(xml_doc, '/purchase/customer/card_number') = '*****3333') | (ExtractValue(xml_doc, '/purchase/customer/rewards_account/phone_number') = '(333)333-3333')
GROUP BY purchaseId;


-- Information Need: Customers are able to have a running total of points earned till date with the purchases they've made. This only applies to customers with rewards accounts. 
-- Able to complete
SELECT 
    xml_purchase.id AS purchaseId,
    ExtractValue(xml_doc, '/purchase/order/order_date') AS DatePurchased, 
    ExtractValue(xml_doc, '/purchase/order/total_cost') AS OrderCost,
    ExtractValue(xml_doc, '/purchase/customer/rewards_account/total_points') AS PointsPerPurchase,
    SUM(ExtractValue(xml_doc, '/purchase/customer/rewards_account/total_points')) OVER (order by xml_purchase.id) as RunningTotalPoints
FROM xml_purchase
WHERE (ExtractValue(xml_doc, '/purchase/customer/card_number') = '*****3333') | (ExtractValue(xml_doc, '/purchase/customer/rewards_account/phone_number') = '(333)333-3333')
GROUP BY purchaseId;














