SELECT 
    patient_id,
    name,
    EXTRACT(YEAR FROM arrival_date) AS arrival_year
FROM patients;

--------------------------------------------------------
SELECT 
    patient_id,
    name,
    (departure_date - arrival_date) AS length_of_stay
FROM patients;

-----------------------------------------
SELECT 
    patient_id,
    name,
    arrival_date,
    service
FROM patients
WHERE EXTRACT(MONTH FROM arrival_date) = 3;


--------------------------------Daily Challanges---------------------------------
select service, COUNT(*) AS patient_count,
    ROUND(AVG(DEPARTURE_DATE - ARRIVAL_DATE), 2) AS avg_stay_days
from patients
group by service
HAVING AVG(DEPARTURE_DATE - ARRIVAL_DATE) > 7
order by avg_stay_days DESC;