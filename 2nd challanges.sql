select * from patients where age<60;
select * from staff where service ='emergency';
select week services from services_weekly where patients_request >=100;

SELECT 
    patient_id, 
    name, 
    age, 
    satisfaction
FROM 
    patients
WHERE 
    service = 'surgery'
    AND satisfaction < 70;