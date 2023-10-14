
/*

Find the top 5 least paid employees for each job title
Difficulty: Hard

Question ID: ID 9986

Link to the question: 
https://platform.stratascratch.com/coding/9986-find-the-top-5-least-paid-employees-for-each-job-title

*/


WITH cte AS (
    SELECT jobtitle
        , employeename
        , totalpaybenefits
        , RANK() OVER(PARTITION BY jobtitle ORDER BY totalpaybenefits ASC) AS rnk
    FROM sf_public_salaries
    )
SELECT jobtitle
    , employeename
    , totalpaybenefits
FROM cte 
WHERE rnk <= 5
;

