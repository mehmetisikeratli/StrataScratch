
/*

Employees With Same Birth Month
Difficulty: Hard

Question ID: ID 10355

Link to the question: 
https://platform.stratascratch.com/coding/10355-employees-with-same-birth-month

*/


SELECT 
    profession
    , COALESCE(SUM(CASE WHEN birth_month = 1 THEN 1 END) , 0) AS month_1
    , COALESCE(SUM(CASE WHEN birth_month = 2 THEN 1 END) , 0) AS month_2
    , COALESCE(SUM(CASE WHEN birth_month = 3 THEN 1 END) , 0) AS month_3
    , COALESCE(SUM(CASE WHEN birth_month = 4 THEN 1 END) , 0) AS month_4
    , COALESCE(SUM(CASE WHEN birth_month = 5 THEN 1 END) , 0) AS month_5
    , COALESCE(SUM(CASE WHEN birth_month = 6 THEN 1 END) , 0) AS month_6
    , COALESCE(SUM(CASE WHEN birth_month = 7 THEN 1 END) , 0) AS month_7
    , COALESCE(SUM(CASE WHEN birth_month = 8 THEN 1 END) , 0) AS month_8
    , COALESCE(SUM(CASE WHEN birth_month = 9 THEN 1 END) , 0) AS month_9
    , COALESCE(SUM(CASE WHEN birth_month = 10 THEN 1 END) , 0) AS month_10
    , COALESCE(SUM(CASE WHEN birth_month = 11 THEN 1 END) , 0) AS month_11
    , COALESCE(SUM(CASE WHEN birth_month = 12 THEN 1 END) , 0) AS month_12
FROM employee_list
GROUP BY profession
;
