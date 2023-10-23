
/*

Naive Forecasting
Difficulty: Hard

Question ID: ID 10313

Link to the question: 
https://platform.stratascratch.com/coding/10313-naive-forecasting

*/


WITH cte AS (
    SELECT MONTH(request_date) AS m_request
        , SUM(distance_to_travel) AS distance_to_travel
        , SUM(monetary_cost) AS monetary_cost
    FROM uber_request_logs
    GROUP BY m_request
    ) ,
    cte2 AS (
    SELECT m_request
        , distance_to_travel / monetary_cost AS actual
        , LAG(distance_to_travel / monetary_cost) OVER(ORDER BY m_request) AS forecast
    FROM cte
    )
SELECT ROUND( SQRT( AVG( POW(actual - forecast , 2) ) ) , 2) AS rmse
FROM cte2
;


