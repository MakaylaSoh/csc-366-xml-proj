-- QUERY 1: Find employees in role X that are paid significantly more than the average amount of pay for role X.
-- Not implemented. Employees are nested within store. THus comparing each employee is very difficult. Multiple employee information for each store is returned as a string (with the employee info concatenated together).
-- Modified query 1: Find the average pay for "crew" and "manager" positions.

-- Finding average pay rate the for crew
SELECT ExtractValue(xml_doc, 'sum(/store/employee/position[text()="crew"]/../hourly_rate)') / ExtractValue(xml_doc, 'count(/store/employee/position[text()="crew"]/../hourly_rate)') as AvgRate
FROM xml_store;

-- Finding average pay rate the for manager
SELECT ExtractValue(xml_doc, 'sum(/store/employee/position[text()="manager"]/../hourly_rate)') / ExtractValue(xml_doc, 'count(/store/employee/position[text()="manager"]/../hourly_rate)') as AvgRate
FROM xml_store;

-- QUERY 2: Find all employees that worked overtime in the last 6 months.
-- Not implemented. Attempting to sum the total_hours of employees results using 'sum(/store/employee/actual_work_shift/total_hours)' results in the sum of all the employee work hours. However, since each employee is nested within the store elements, accessing the employee informatoin results in the data for all the employees being represented as a string and concatenated together.
-- Modified query: Find the number of schedueled work shifts and the number of actual worked shifts for the whole store
SELECT ExtractValue(xml_doc, 'count(/store/employee/scheduled_work_shift)') as NumScheduled, ExtractValue(xml_doc, 'count(/store/employee/actual_work_shift)') as NumWorked
FROM xml_store;

-- QUERY 3: In each location, find the average profit (sales - supply cost).
--Not implemented. To sum the total cost for each store is difficult since there may be multiple purchases per store. Further, each purchase may be for a store-supplier or store-customer. This makes extracting the correct data pretty difficult.
-- Modified query: Find the total_cost for each purchase.
SELECT ExtractValue(xml_doc, 'sum(/purchase/*/total_cost)')
FROM xml_purchase

-- QUERY 4: Find the amount of hours for employees under the age of 16 that exceeds the maximum hours during school in session and school out of session.
-- Not implemented. Finding each employees birthday is hard because each employee is nested within a store, and there can be multiple employees per store. So accessing the employees within the store returns a string of multilple employees' birthdays concatenated together. 
-- The query below returns a string of all the employees' birthdays concatenated together
SELECT ExtractValue(xml_doc, '/store/employee/birthday')
FROM xml_store