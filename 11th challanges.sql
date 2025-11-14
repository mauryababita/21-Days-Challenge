SELECT 
    service,
    event,
    COUNT(*) AS event_count
FROM services_weekly
WHERE event IS NOT NULL
  AND event <> 'None'
  AND event <> ''
GROUP BY service, event
ORDER BY event_count DESC;