
/*

Monthly Percentage Difference
Difficulty: Hard

Question ID: ID 10319

Link to the question: 
https://platform.stratascratch.com/coding/10319-monthly-percentage-difference

*/


WITH cte AS (
    SELECT DATE_FORMAT(created_at,'%Y-%m') AS month_year
        , SUM(value) AS purchases
        , LAG(SUM(value)) OVER(ORDER BY DATE_FORMAT(created_at,'%Y-%m') ASC) AS prev_month_purchases
    FROM sf_transactions
    GROUP BY month_year
    )
SELECT month_year
    , ( (purchases - prev_month_purchases) / prev_month_purchases ) * 100 AS revenue_diff_pct
FROM cte
;

