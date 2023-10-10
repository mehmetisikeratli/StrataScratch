
/*

Find the top 5 highest paid and top 5 least paid employees in 2012
Difficulty: Hard

Question ID: ID 9979

Link to the question: 
https://platform.stratascratch.com/coding/9979-find-the-top-5-highest-paid-and-top-5-least-paid-employees-in-2012

*/


WITH cte AS (
    SELECT employeename
        , totalpaybenefits
        , RANK() OVER(ORDER BY totalpaybenefits DESC) AS rnk_desc
        , RANK() OVER(ORDER BY totalpaybenefits ASC) AS rnk_asc
    FROM sf_public_salaries
    WHERE year = 2012
    )
SELECT employeename
    , totalpaybenefits
FROM cte
WHERE rnk_desc <= 5 OR rnk_asc <= 5
;

