
/*

Spotify Penetration Analysis
Difficulty: Hard

Question ID: ID 10369

Link to the question: 
https://platform.stratascratch.com/coding/10369-spotify-penetration-analysis

*/


WITH active_users AS (
    SELECT user_id
        , country
    FROM penetration_analysis
    WHERE listening_hours >= 10
        AND sessions >= 5
        AND DATE(last_active_date) BETWEEN ('2024-01-31' - INTERVAL 30 DAY) AND '2024-01-31'
    GROUP BY user_id
    )
SELECT p.country
    , ROUND(COUNT(DISTINCT a.user_id) / COUNT(DISTINCT p.user_id) , 2) AS active_user_penetration_rate
FROM penetration_analysis AS p
LEFT JOIN active_users AS a
    ON p.country = a.country
GROUP BY p.country
;
