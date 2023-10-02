
/*

Price Of A Handyman
Difficulty: Hard

Question ID: ID 9815

Link to the question: 
https://platform.stratascratch.com/coding/9815-price-of-a-handyman

*/


WITH cte AS (
    SELECT business_type
        , n_employees
        , adwords_earnings
        , adwords_earnings / n_employees AS earning_per_emp
        , COUNT(*)
        , RANK() OVER(ORDER BY COUNT(*) DESC) AS rnk
    FROM google_adwords_earnings
    WHERE business_type = 'handyman'
        AND n_employees <= 10
    GROUP BY earning_per_emp
    )
SELECT earning_per_emp
FROM cte
WHERE rnk = 1
;

