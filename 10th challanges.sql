SELECT 
    patient_id,
    name,
    satisfaction,
    CASE
        WHEN satisfaction >= 85 THEN 'High'
        WHEN satisfaction >= 70 THEN 'Medium'
        ELSE 'Low'
    END AS satisfaction_category
FROM patients;

---------------------------------------------------------------

SELECT 
    staff_id,
    staff_name,
    role,
    CASE
        WHEN role IN ('Doctor', 'Nurse', 'Surgeon', 'Therapist') THEN 'Medical'
        ELSE 'Support'
    END AS role_category
FROM staff;

-----------------------------------------------------------------------------

SELECT 
    patient_id,
    name,
    age,
    CASE
        WHEN age BETWEEN 0 AND 18 THEN '0-18 (Minor)'
        WHEN age BETWEEN 19 AND 40 THEN '19-40 (Adult)'
        WHEN age BETWEEN 41 AND 65 THEN '41-65 (Middle Age)'
        ELSE '65+ (Senior)'
    END AS age_group
FROM patients;

-------------Daily Challanges-------------------------------------
select 
    service,
    SUM(patients_admitted) AS total_admitted,
    ROUND(AVG(patient_satisfaction), 2) AS avg_satisfaction,
    CASE
        when AVG(patient_satisfaction) >= 85 THEN 'Excellent'
        when AVG(patient_satisfaction) >= 75 THEN 'Good'
        when AVG(patient_satisfaction) >= 65 THEN 'Fair'
        ELSE 'Needs Improvement'
    END AS performance_category
from services_weekly
group by service
order by avg_satisfaction DESC;
