SELECT DATE_ADD(license_issue_date, INTERVAL 7 DAY) AS email_send_date
  , COUNT(DISTINCT license_number) AS email_cnts
FROM seattle_pet_licenses
WHERE license_issue_date >= '2016-10-01'
GROUP BY email_send_date
ORDER BY email_send_date;