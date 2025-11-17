---------------------Daily Challanges-----------------------
SELECT 
    s.staff_id,
    s.staff_name,
    s.role,
    s.service,
    COUNT(ss.week) AS weeks_present
FROM staff s
LEFT JOIN staff_schedule ss 
       ON s.staff_id = ss.staff_id
GROUP BY 
    s.staff_id, 
    s.staff_name, 
    s.role, 
    s.service
ORDER BY weeks_present DESC;


----------------------------------------------------
SELECT 
    s.staff_id,
    s.staff_name,
    s.role,
    s.service,
    ss.week,
    ss.present
FROM staff s
LEFT JOIN staff_schedule ss
       ON s.staff_id = ss.staff_id
ORDER BY s.staff_id, ss.week;


---------------------------------------------------

SELECT
    sw.service,
    sw.week,
    s.staff_id,
    s.staff_name,
    s.role
FROM services_weekly sw
LEFT JOIN staff s
       ON sw.service = s.service
ORDER BY sw.service, sw.week;

-------------------------------------------------

SELECT 
    p.patient_id,
    p.name,
    p.age,
    p.arrival_date,
    p.departure_date,
    p.service,
    sw.week,
    sw.patients_request,
    sw.patients_admitted,
    sw.patients_refused,
    sw.patient_satisfaction
FROM patients p
LEFT JOIN services_weekly sw
       ON p.service = sw.service
ORDER BY p.patient_id, sw.week;