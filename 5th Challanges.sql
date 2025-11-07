select * from patients;

select count() as total_patient
from patients;


select avg(satisfaction) as total
from patients;


select max(age) as max_patient_age,
        min(age) as min_patient_age
from patients;


-- Daily Challenge

select 
    sum(patients_admitted) as admitted,
    sum(patients_refused) as refused,
    round(avg(patient_satisfaction),2) as satisfaction
from services_weekly;

