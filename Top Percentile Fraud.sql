
/*

Top Percentile Fraud
Difficulty: Hard

Question ID: ID 10303

Link to the question: 
https://platform.stratascratch.com/coding/10303-top-percentile-fraud


*/

WITH cte AS (
    SELECT 
        policy_num
        , state
        , claim_cost
        , fraud_score
        , ntile(20) OVER(PARTITION BY state ORDER BY fraud_score DESC) AS n_tile
        -- , PERCENT_RANK() over(partition BY STATE ORDER BY fraud_score DESC) AS pctl
        -- this would also solve the problem
    FROM fraud_score
    )
SELECT policy_num
    , state
    , claim_cost
    , fraud_score
FROM cte
WHERE n_tile <= 1
ORDER BY state, fraud_score DESC
;
