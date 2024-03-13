-- For all customers who have rewards accounts with more than 10 points, return their first name, account number, and total number of points 
SELECT firstname, account_num, total_points
FROM rewards_account
WHERE total_points > 10;


-- For customer JOHN DOE, output all their previous orders from Jan 1st, 2023 to Jan 8th 2023. Return the order date, total amount spent on order, a running total that aggregates sum of each order. Order by order date. 
SELECT order_date, order_total, SUM(order_total) OVER (order by order_id) as RunningTotalPoint
FROM orderHistory 
JOIN customers ON customers.id = orderHistory.cid
WHERE (customer.firstname = "JOHN" and customer.lastname = "DOE") AND ('01-01-2023' <= order_date <= '01-08-2023')
ORDER BY order_date;


-- Find how many times customer JOHN DOE has placed an order that contains any form of ice cream as one of the order items. Note this can apply to any order placed in the year 2023. 
SELECT COUNT(DISTINCT o.order_id) AS TotalIceCreamOrders
FROM orders o
JOIN customers c ON o.cid = c.id
JOIN products p ON o.order_id = p.order_id
WHERE (c.firstname = 'JOHN' AND c.lastname = 'DOE')
        AND (p.item_name LIKE '%ice cream%')
            AND YEAR(o.order_date) = 2023;


-- Find the total amount spent on ice-cream, cake, and coffee orders by customers in 2023. Output the item name along with total spent. Order by total spent from highest to lowest. 
SELECT oi.item_name AS Category, SUM(o.order_total) AS TotalSpent
FROM orders o
JOIN products p ON o.order_id = p.order_id
JOIN customers c ON o.cid = c.id
WHERE (p.item_name LIKE '%ice cream%' 
        OR p.item_name LIKE '%cake%' 
            OR p.item_name LIKE '%coffee%')
                AND YEAR(o.order_date) = 2023
GROUP BY p.item_name
ORDER BY TotalSpent DESC;




