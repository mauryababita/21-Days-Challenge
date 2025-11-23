----------Daily Challanges-----------
SELECT patient_id AS id, name, 'Patient' AS type, service 
FROM patients 
WHERE LOWER(service) IN ('surgery', 'emergency')
UNION ALL
SELECT staff_id AS id, staff_name, 'Staff' AS type, service 
FROM staff 
WHERE LOWER(service) IN ('surgery', 'emergency')
ORDER BY type, service, name;



----------Practicesss-------------
1--
SELECT name
FROM (
    SELECT p.name FROM patients p
    UNION
    SELECT s.staff_name FROM staff s
) AS combined;

2-----
SELECT patient_id, name, satisfaction
FROM (
    SELECT patient_id, name, satisfaction 
    FROM patients 
    WHERE satisfaction > 90

    UNION

    SELECT patient_id, name, satisfaction 
    FROM patients
    WHERE satisfaction < 50
) AS hi_low;

3----
SELECT name
FROM (
    SELECT name FROM patients
    UNION
    SELECT staff_name FROM staff
) AS all_unique_names;