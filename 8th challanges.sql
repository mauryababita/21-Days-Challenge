select
    patient_id,
    UPPER(name) AS full_name,
    LOWER(service) AS service,
    CASE
        WHEN age >= 65 THEN 'Senior'
        WHEN age >= 18 THEN 'Adult'
        ELSE 'Minor'
    END AS age_category,
    LENGTH(name) AS name_length
from patients
where LENGTH(name) > 10;