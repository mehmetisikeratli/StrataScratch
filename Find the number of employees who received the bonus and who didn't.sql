
/*

Find the number of employees who received the bonus and who didn't
Difficulty: Hard

Question ID: ID 10081

Link to the question: 
https://platform.stratascratch.com/coding/10081-find-the-number-of-employees-who-received-the-bonus-and-who-didnt

*/


WITH cte AS (
    SELECT e.id
        -- , SUM(b.bonus_amount) AS bonuses
        , IF(SUM(b.bonus_amount) IS NULL, 0, 1) AS has_bonus
    FROM employee AS e
    LEFT JOIN bonus AS b
        ON e.id = b.worker_ref_id
    GROUP BY e.id
    )
SELECT has_bonus, COUNT(id) AS n_emp
FROM cte
GROUP BY has_bonus
;

