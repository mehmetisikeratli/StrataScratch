
/*

Friday Purchases
Difficulty: Hard

Question ID: ID 10358

Link to the question: 
https://platform.stratascratch.com/coding/10358-friday-purchases

*/

WITH weeks AS (
    SELECT WEEK(date) AS week_num
    FROM user_purchases
    WHERE QUARTER(date) = 1
    GROUP BY WEEK(date)
    ) ,
    num AS (
    SELECT WEEK(date) AS week_num
        , COALESCE( AVG(amount_spent) , 0 ) AS mean_amount
    FROM user_purchases
    WHERE QUARTER(date) = 1
        AND DAYNAME(date) = 'Friday'
    GROUP BY WEEK(date)
    )
SELECT weeks.week_num
    , COALESCE(num.mean_amount , 0) AS mean_amount
FROM weeks
LEFT JOIN num
    USING(week_num)
;
