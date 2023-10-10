
/*

Median Job Salaries
Difficulty: Hard

Question ID: ID 9983

Link to the question: 
https://platform.stratascratch.com/coding/9983-median-job-salaries

*/


WITH cte AS (
    SELECT employeename
        , jobtitle
        , totalpay
        , CAST( RANK() OVER(PARTITION BY jobtitle ORDER BY totalpay ASC) AS SIGNED) AS rnk_asc
        , CAST( RANK() OVER(PARTITION BY jobtitle ORDER BY totalpay DESC) AS SIGNED) AS rnk_desc
    FROM sf_public_salaries
    -- WHERE jobtitle = 'Public Service Trainee'
    )
SELECT jobtitle
    , AVG(totalpay) AS median_pay
FROM cte
WHERE ABS(rnk_desc - rnk_asc) <= 1
GROUP BY jobtitle
ORDER BY median_pay DESC
;
