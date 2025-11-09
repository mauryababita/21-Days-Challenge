select service,
    count() as total_patients
from patients group by service;



select service,round(avg(age),2) as total_avg
from patients group by service;



-- third practice question

select from services_weekly;


select 
    role ,
    count() as total_role from staff group by  role;


-- Daily Challenge

select 
    sum(patients_admitted) as total_patients_admitted,
    sum(patients_refused) as total_patients_refused,
    (sum(patients_admitted)100.0/
    (sum(patients_admitted)+ sum(patients_refused))) as admission_rate
from services_weekly
group by 
    service
order by
    admission_rate desc;

