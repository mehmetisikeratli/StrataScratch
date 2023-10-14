
/*

Above Average But Not At The Top
Difficulty: Hard

Question ID: ID 9985

Link to the question: 
https://platform.stratascratch.com/coding/9985-above-average-but-not-at-the-top

*/

WITH cte AS (
    SELECT employeename
        , jobtitle
        , year
        , totalpay
        , RANK() OVER(PARTITION BY jobtitle ORDER BY totalpay DESC) AS rnk
        , AVG(totalpay) OVER(PARTITION BY jobtitle) AS avg_pay
    FROM sf_public_salaries
    WHERE year = 2013
    )
SELECT employeename
FROM cte
WHERE rnk > 5
    AND totalpay > avg_pay
;
