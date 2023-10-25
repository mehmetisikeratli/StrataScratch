
/*

Make a pivot table to find the highest payment in each year for each employee
Difficulty: Hard

Question ID: ID 10145

Link to the question: 
https://platform.stratascratch.com/coding/10145-make-a-pivot-table-to-find-the-highest-payment-in-each-year-for-each-employee

*/

WITH cte AS (
    SELECT employeename
        , year
        , totalpay
    FROM sf_public_salaries
    GROUP BY employeename
        , year
    ORDER BY employeename
        , year
    )
SELECT employeename
    , MAX(CASE WHEN year = 2011 THEN totalpay ELSE 0 END ) AS pay_2011
    , MAX(CASE WHEN year = 2012 THEN totalpay ELSE 0 END ) AS pay_2012
    , MAX(CASE WHEN year = 2013 THEN totalpay ELSE 0 END ) AS pay_2013
    , MAX(CASE WHEN year = 2014 THEN totalpay ELSE 0 END ) AS pay_2014
FROM cte
GROUP BY employeename
;
