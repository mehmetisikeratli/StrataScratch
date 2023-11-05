
/*

From Microsoft to Google
Difficulty: Hard

Question ID: ID 2078

Link to the question: 
https://platform.stratascratch.com/coding/2078-from-microsoft-to-google

*/

WITH cte AS (
    SELECT user_id, employer, start_date, end_date
    FROM linkedin_users
    WHERE employer = 'Google'
    )
SELECT COUNT(lu.user_id) AS n_emp
FROM linkedin_users AS lu
INNER JOIN cte
    ON cte.user_id = lu.user_id
    AND lu.employer = 'Microsoft'
    AND lu.end_date < cte.start_date
;

WITH cte AS (
    SELECT user_id
        , employer
        , LEAD(employer) OVER(PARTITION BY user_id ORDER BY start_date) AS next_employer
    FROM linkedin_users
    )
SELECT COUNT(user_id) AS n_emp
FROM cte
WHERE employer = 'Microsoft'
    AND next_employer = 'Google'
;
