
/*

Spotify Penetration Analysis
Difficulty: Hard

Question ID: ID 10369

Link to the question: 
https://platform.stratascratch.com/coding/10369-spotify-penetration-analysis?code_type=3

*/

WITH cte AS (
    SELECT country
        , total_population
        , SUM(CASE WHEN last_active_date >= DATE_SUB('2024-01-31', INTERVAL 30 DAY) 
                AND monthly_active_sessions >= 5
                AND listening_hours >= 10 THEN 1 ELSE 0 END) AS active_users
        , COUNT(*) AS total_users
    FROM penetration_analysis
    GROUP BY 1,2
    )
SELECT country
    , FORMAT( CAST(active_users AS FLOAT) / GREATEST(total_population, 1) , 10) AS active_user_penetration_rate
FROM cte 
;
