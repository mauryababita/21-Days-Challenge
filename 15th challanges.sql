SELECT 
    sw.service,
    SUM(sw.patients_admitted) AS total_admitted,
    SUM(sw.patients_refused) AS total_refused,
    ROUND(AVG(sw.patient_satisfaction), 2) AS avg_satisfaction,
    COUNT(DISTINCT st.staff_id) AS staff_assigned,
    COUNT(DISTINCT ss.staff_id) AS staff_present_week
	FROM services_weekly sw
LEFT JOIN staff st
    ON sw.service = st.service
LEFT JOIN staff_schedule ss
    ON st.staff_id = ss.staff_id
    AND ss.week = 20       
WHERE sw.week = 20        
GROUP BY sw.service
ORDER BY total_admitted DESC;

=======================================================
SELECT 
    p.patient_id,
    p.name AS patient_name,
    p.service AS patient_service,

    s.staff_id,
    s.staff_name,
    s.role,

    ss.week,

FROM patients p
LEFT JOIN staff s
    ON p.service = s.service
LEFT JOIN staff_schedule ss
    ON s.staff_id = ss.staff_id

ORDER BY p.patient_id, s.staff_id, ss.week;
