-- Find all shifts an employee is scheduled to work in a week. 
-- employee_id = 1
-- between 03-11-2024 and 03-18-2024
SELECT * from work_instance 
where employee_id = 1 and date <= '03-18-2024' and date >='03-11-2024'

-- For each day, calculate if an employee has worked the number of hours they were scheudled to work
-- date = 03-11-2024

WITH T1 AS (
    SELECT employee_id, SUM(total_hours) AS hoursScheduled from scheduled_work_shift 
    where employee_id =1 and date = '03-11-2024'
    GROUP BY employee_id
), 
SELECT T1.hoursScheduled, SUM(total_hours) AS from actual_work_shift
where employee_id = 1 and date = '03-11-2024'
GROUP BY employee_id

-- For each store, find all employees scheduled to work that day
-- date = 03-11-2024
SELECT stores.id, e.firstname, e.lastname from stores
JOIN employee e on store_id = id 
JOIN work_instance w on employee_id = e.id
WHERE work_instance.date = "03-11-2024"

-- For an employee, find how much money they made in a week
WITH T1 AS(
SELECT employee_id, SUM(hours_worked) AS hours_in_week from work_instance 
JOIN employee e on employee_id = e.id
where employee_id = 1 and date <= '03-18-2024' and date >='03-11-2024'
GROUP BY employee_id
)
SELECT T1.employee_id, (T1.hours_in_week  * e.hourly_rate) as moneyMade
JOIN employee e on e.id = T1.employee_id