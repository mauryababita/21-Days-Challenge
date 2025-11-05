select*from patients order by age desc;

select * from services_weekly order by week asc,patients_request desc;

select * from staff order by staff_name asc;


SELECT 
    week,
    service,
    patients_refused,
    patients_request
FROM services_weekly
ORDER BY patients_refused DESC
LIMIT 5;
