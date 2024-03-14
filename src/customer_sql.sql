-- Information Need: Customers are able to purchase more than one item per order
-- SQL Query to Demonstrate Need:
    -- For all orders with more than 1 item purchase (ex: purchasing coffee AND cake), return the order id, and number of items in the order. 
SELECT order_id, COUNT(DISTINCT product_id) AS NumberOfItems
FROM orders
GROUP BY order_id
HAVING COUNT(DISTINCT product_id) > 1;


-- Information Need: Each customer can create an account associated with their phone number to earn rewards with future purchases
-- SQL Query to Demonstrate Need:
    -- For all customers who have rewards accounts with more than 10 points, return their first name, account number, and total number of points 
SELECT firstname, account_num, total_points
FROM rewards_account
WHERE total_points > 10;


-- Information Need: Customers are able to access all their previous order histories through their card number OR phone number if they have a rewards account. 
-- SQL Query to Demonstrate Need:
    -- For customer with phone number (111)-111-1111, output all their previous orders from Jan 1st, 2023 to Jan 8th 2023. Return the order date, total amount spent on order. Order by order date. 
SELECT order_date, order_total
FROM orderHistory 
JOIN rewards_account ON rewards_account.cid = orderHistory.cid
WHERE (rewards_account.phone_number = '(111)-111-1111') AND ('01-01-2023' <= order_date <= '01-08-2023')
ORDER BY order_date;


-- Information Need: Customers are able to have a running total of points earned till date with the purchases they've made. This only applies to customers with rewards accounts. 
-- SQL Query to Demonstrate Need:
    -- Return the firstname, lastname, account number, and running total
SELECT c.firstname, c.lastname, ra.account_num, SUM(o.points_earned) OVER (o.id) AS RunningTotalPoints
FROM orders o
JOIN customers c ON o.cid = c.id
JOIN rewards_account ra ON c.id = ra.customer_id
ORDER BY RunningTotalPoints;



