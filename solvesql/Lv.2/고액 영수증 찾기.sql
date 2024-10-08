SELECT *
FROM tips
WHERE (size, total_bill) IN (SELECT size
                                , MAX(total_bill)
                              FROM tips
                              GROUP BY size
                              )
ORDER BY size;