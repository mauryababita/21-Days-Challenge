--day19
WITH RankedWeeks AS (
    SELECT
        service,
        week,
        patient_satisfaction,
        patients_admitted,
        DENSE_RANK() OVER(PARTITION BY service ORDER BY patient_satisfaction DESC) as ranking
    FROM services_weekly
)
SELECT * FROM RankedWeeks
WHERE ranking <= 3
ORDER BY service, ranking;


-------------------Practicess--------------------
1--
SELECT
    patient_id,
    name,
    service,
    satisfaction,
    RANK() OVER (
        PARTITION BY service
        ORDER BY satisfaction DESC
    ) AS satisfaction_rank
FROM patients;

2--
SELECT
    staff_id,
    staff_name,
    ROW_NUMBER() OVER (
        ORDER BY staff_name
    ) AS row_num
FROM staff;

3---
SELECT
    service,
    total_admitted,
    RANK() OVER (
        ORDER BY total_admitted DESC
    ) AS service_rank
FROM (
    SELECT
        service,
        SUM(patients_admitted) AS total_admitted
    FROM services_weekly
    GROUP BY service
) AS service_stats;

