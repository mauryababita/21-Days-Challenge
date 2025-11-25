----------Daily Challanges----------------------------------
SELECT
    service,
    week,
    patients_admitted,
    SUM(patients_admitted) OVER (
        PARTITION BY service
        ORDER BY week
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS running_total,
    AVG(patient_satisfaction) OVER (
        PARTITION BY service
        ORDER BY week
        ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
    ) AS moving_avg_satisfaction,
    patients_admitted -
    AVG(patients_admitted) OVER (
        PARTITION BY service
    ) AS diff_from_service_avg
FROM services_weekly
WHERE week BETWEEN 10 AND 20
ORDER BY service, week;


------------Practices--------------------------
1--
SELECT
    service,
    week,
    patients_admitted,
    SUM(patients_admitted) OVER (
        PARTITION BY service
        ORDER BY week
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS running_total_admitted
FROM services_weekly
ORDER BY service, week;

2----
SELECT
    service,
    week,
    patient_satisfaction,
    AVG(patient_satisfaction) OVER (
        PARTITION BY service
        ORDER BY week
        ROWS BETWEEN 3 PRECEDING AND CURRENT ROW
    ) AS moving_avg_4_week
FROM services_weekly
ORDER BY service, week;

3---
SELECT
    week,
    SUM(patients_refused) AS total_refused_this_week,
    SUM(SUM(patients_refused)) OVER (
        ORDER BY week
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS cumulative_refusals
FROM services_weekly
GROUP BY week
ORDER BY week;