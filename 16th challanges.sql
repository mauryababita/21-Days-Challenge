-----------Daily Challanges----------------
select 
    p.patient_id,
    p.name,
    p.service,
    p.satisfaction AS patient_satisfaction
from patients p
where p.service IN (
        select service
        from services_weekly
        group by service
        HAVING SUM(patients_refused) > 0
    )
AND p.service IN (
        select service
        from services_weekly
        group by service
        HAVING AVG(patient_satisfaction) <
               (select AVG(patient_satisfaction) 
                from services_weekly)
    )
order by p.service, p.name;



----------------------------------------------
1--
SELECT 
    p.patient_id,
    p.name,
    p.service
FROM patients p
WHERE p.service IN (
    SELECT service
    FROM staff
    GROUP BY service
    HAVING COUNT(*) > (
        SELECT AVG(staff_count)
        FROM (
            SELECT service, COUNT(*) AS staff_count
            FROM staff
            GROUP BY service
        ) x
    )
)
ORDER BY p.service, p.name;

2-----
SELECT DISTINCT
    s.staff_id,
    s.staff_name,
    s.role,
    s.service
FROM staff s
WHERE s.service IN (
    SELECT service
    FROM services_weekly
    WHERE patient_satisfaction < 70
);


3-----
SELECT 
    p.patient_id,
    p.name,
    p.service
FROM patients p
WHERE p.service IN (
    SELECT service
    FROM services_weekly
    GROUP BY service
    HAVING SUM(patients_admitted) > 1000
)
ORDER BY p.service, p.name;


