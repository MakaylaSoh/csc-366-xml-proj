-- QUERY 1: Find employees in role X that are paid significantly more than the average amount of pay for role X.
-- "significantly more" meaning $10
WITH average AS
(SELECT employee.id as emp_id, employee.position, avg_hourly_pay, hourly_pay
FROM 
    (SELECT position, avg(hourly_pay) as avg_hourly_pay
    FROM employee
    GROUP BY position) as avg_pay
JOIN employee ON avg_pay.position = employee.position)
SELECT *
FROM average
WHERE hourly_pay - avg_hourly_pay > 10;

-- QUERY 2: Find all employees that worked overtime in the last 6 months.
SELECT WEEK(shift_day) as week_shift, emp_id, SUM(total_hours) as total_hours
FROM work_shift
GROUP BY WEEK(shift_day), emp_id
HAVING total_hours > 40;

-- QUERY 3: In each location, find the average profit (sales - supply cost).
WITH purchases AS
(SELECT store_id, order_type, SUM(total_cost) AS total
FROM purchase
GROUP BY store_id, order_type)
SELECT p1.store_id, p1.total AS cost, p2.total AS sales, p2.total - p1.total AS Profit
FROM purchases AS p1,
JOIN purchases AS p2 ON p1.store_id=p2.store_id AND p1.order_type='delivery' AND p2.order_type="customer";

-- QUERY 4: Find the amount of hours for employees under the age of 16 that exceeds the maximum hours during school in session (20).
SELECT WEEK(shift_day) as week_shift, emp_id, SUM(total_hours) as total_hours
FROM employee
JOIN work_shift ON work_shift.emp_id = employee.id
WHERE TIMESTAMPDIFF(YEAR, birthday, NOW()) <= 16
GROUP BY WEEK(shift_day), emp_id;
HAVING total_hours > 20;