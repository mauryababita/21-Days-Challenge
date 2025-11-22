-----------Daily Challages-------------------------
select
    t.service,
    t.total_admitted,
    ROUND(t.total_admitted - a.avg_total_admitted, 2) AS admission_difference,
    CASE
       when t.total_admitted > a.avg_total_admitted then 'Above Average'
        when t.total_admitted = a.avg_total_admitted then 'Average'
        ELSE 'Below Average'
    END AS rank_indicator
from
    (
        select service, SUM(patients_admitted) AS total_admitted
       from services_weekly
        group by service
    ) t,
    (
        select AVG(total_admitted) AS avg_total_admitted
        from (
            select SUM(patients_admitted) AS total_admitted
            from services_weekly
            group by service
        ) x
    ) a
order by t.total_admitted desc;


---------------------Practice---------------------------------
1--
SELECT 
    p.patient_id,
    p.name,
    p.service,
    p.satisfaction AS patient_satisfaction,
    s.avg_service_satisfaction
FROM patients p
JOIN (
    SELECT 
        service,
        AVG(patient_satisfaction) AS avg_service_satisfaction
    FROM services_weekly
    GROUP BY service
) s
ON p.service = s.service;

2------
SELECT 
    st.service,
    st.total_admitted,
    st.total_refused,
    st.avg_satisfaction
FROM (
    SELECT 
        service,
        SUM(patients_admitted) AS total_admitted,
        SUM(patients_refused) AS total_refused,
        ROUND(AVG(patient_satisfaction), 2) AS avg_satisfaction
    FROM services_weekly
    GROUP BY service
) st;

3---
SELECT 
    s.staff_id,
    s.staff_name,
    s.role,
    s.service,
    sc.total_patients
FROM staff s
LEFT JOIN (
    SELECT 
        service,
        SUM(patients_admitted) AS total_patients
    FROM services_weekly
    GROUP BY service
) sc
ON s.service = sc.service
ORDER BY total_patients DESC NULLS LAST;

