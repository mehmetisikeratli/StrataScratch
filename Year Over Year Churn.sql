
/*

Year Over Year Churn
Difficulty: Hard

Question ID: ID 10017

Link to the question: 
https://platform.stratascratch.com/coding/10017-year-over-year-churn

*/


WITH cte AS (
    SELECT YEAR(end_date) AS years
        , COUNT(d.index) AS current_year
        , COALESCE(LAG(COUNT(d.index)) OVER(ORDER BY YEAR(end_date) ASC) , 0) AS prev_year_count
    FROM lyft_drivers AS d
    WHERE end_date IS NOT NULL
    GROUP BY YEAR(end_date)
    )
SELECT *
    , CASE
        WHEN current_year > prev_year_count THEN 'increase'
        WHEN current_year < prev_year_count THEN 'decrease'
        WHEN current_year = prev_year_count THEN 'no change'
      END 
FROM cte
;

