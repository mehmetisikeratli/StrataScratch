
/*

Direct Deposit Conversions
Difficulty: Hard

Question ID: ID 10357

Link to the question: 
https://platform.stratascratch.com/coding/10357-direct-deposit-conversions

*/

WITH cte AS (
    SELECT user_id
        , employer
        , transaction_amount
        , transaction_date
        , LAG(transaction_date) OVER(PARTITION BY user_id, employer ORDER BY transaction_date) AS prev_trx_date
        , LAG(transaction_amount) OVER(PARTITION BY user_id, employer ORDER BY transaction_date) AS prev_trx_amount
        , DATEDIFF(transaction_date, LAG(transaction_date) OVER(PARTITION BY user_id, employer ORDER BY transaction_date)) AS date_diff
        , ABS(transaction_amount - LAG(transaction_amount) OVER(PARTITION BY user_id, employer ORDER BY transaction_date)) AS amount_diff_abs  
    FROM dd_transactions
    -- WHERE user_id = 6075
    ORDER BY transaction_date
    )
SELECT user_id
    , employer
    , MIN(transaction_date) AS conversion_date
FROM cte
WHERE amount_diff_abs <= 25
    AND date_diff <= 30
GROUP BY user_id
    , employer
;
