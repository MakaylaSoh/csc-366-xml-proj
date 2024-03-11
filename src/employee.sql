-- -- First names of all employees for each store
SELECT 
    xml_store.id, 
    ExtractValue(xml_doc, '/store/employee/firstname') AS firstname
FROM xml_store

-- For an employee, 'firstname1', find all scheduled work shifts
SELECT ExtractValue(xml_doc, '/store[1]/employee[1]/firstname[1]') AS names, 
       ExtractValue(xml_doc, '/store[1]/employee[1]/scheduled_work_shift/date') AS dates
FROM xml_store

-- For an employee, find the amount of hours worked 
SELECT ExtractValue(xml_doc, '/store/employee[1]/firstname[1]') AS names, 
    SUM(ExtractValue(xml_doc, '/store/employee[1]/scheduled_work_shift/total_hours')) AS total_hours
FROM xml_store
GROUP BY xml_store.id

-- For an employee, find the salary per hour
SELECT ExtractValue(xml_doc, '/store/employee[1]/firstname[1]') AS names, 
    ExtractValue(xml_doc, '/store/employee[1]/hourly_rate') AS hourly_rate
FROM xml_store
GROUP BY xml_store.id














