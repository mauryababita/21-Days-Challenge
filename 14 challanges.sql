SELECT 
    p.patient_id,
    p.name AS patient_name,
    p.age,
    p.service,
    s.staff_count
FROM patients p
JOIN (
    SELECT 
        service,
        COUNT(*) AS staff_count
    FROM staff
    GROUP BY service
    HAVING COUNT(*) > 5
) s
ON p.service = s.service
ORDER BY 
    s.staff_count DESC,
    p.name ASC;
