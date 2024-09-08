SELECT CONCAT(MAX(length), 'cm') AS max_length
FROM fish_info
WHERE length IS NOT NULL;