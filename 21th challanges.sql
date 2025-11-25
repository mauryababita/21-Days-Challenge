--------------Daily Challanges-------------------------
WITH Svc_Stats AS (
    SELECT service, 
           SUM(patients_admitted) as total_adm, 
           SUM(patients_refused) as total_ref, 
           AVG(patient_satisfaction) as avg_sat
    FROM services_weekly GROUP BY service
),
Staff_Stats AS (
    SELECT service, 
           COUNT(DISTINCT staff_id) as distinct_staff,
           AVG(present::INT) as attendance_rate
    FROM staff_schedule GROUP BY service
),
Patient_Stats AS (
    SELECT service, 
           AVG(age) as avg_patient_age
    FROM patients GROUP BY service
)
SELECT 
    s.service,
    s.total_adm,
    s.total_ref,
    ROUND(s.avg_sat, 2) AS satisfaction,
    COALESCE(st.distinct_staff, 0) AS staff_count,
    ROUND(COALESCE(st.attendance_rate, 0), 2) AS avg_weeks_present,
    ROUND(COALESCE(p.avg_patient_age, 0), 1) AS avg_age,
    (s.total_adm * 0.6 + s.avg_sat * 10) AS perf_score 
FROM Svc_Stats s
LEFT JOIN Staff_Stats st ON s.service = st.service
LEFT JOIN Patient_Stats p ON s.service = p.service
ORDER BY perf_score DESC;

--------------Practices-----------------------------------
1--
WITH service_stats AS (
    SELECT 
        service,
        SUM(patients_admitted) AS total_admitted,
        SUM(patients_refused) AS total_refused,
        ROUND(AVG(patient_satisfaction), 2) AS avg_satisfaction
    FROM services_weekly
    GROUP BY service
)
SELECT 
    service,
    total_admitted,
    total_refused,
    avg_satisfaction
FROM service_stats
ORDER BY total_admitted DESC;

2---
WITH 
service_avgs AS (
    SELECT 
        service,
        ROUND(AVG(patient_satisfaction), 2) AS avg_satisfaction
    FROM services_weekly
    GROUP BY service
),
overall_avg AS (
    SELECT AVG(avg_satisfaction) AS hospital_avg
    FROM service_avgs
),
above_avg_services AS (
    SELECT 
        s.service,
        s.avg_satisfaction
    FROM service_avgs s, overall_avg o
    WHERE s.avg_satisfaction > o.hospital_avg
)
SELECT 
    a.service,
    sw.total_admitted
FROM above_avg_services a
JOIN (
    SELECT service, SUM(patients_admitted) AS total_admitted
    FROM services_weekly
    GROUP BY service
) sw ON a.service = sw.service
ORDER BY sw.total_admitted DESC;

3--
WITH staff_util AS (
    SELECT 
        service,
        COUNT(staff_id) AS total_staff
    FROM staff
    GROUP BY service
)
SELECT 
    p.patient_id,
    p.name AS patient_name,
    p.service,
    su.total_staff
FROM patients p
LEFT JOIN staff_util su 
       ON p.service = su.service
ORDER BY su.total_staff DESC, p.name;