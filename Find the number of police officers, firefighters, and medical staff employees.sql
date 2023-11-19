
/*

Find the number of police officers, firefighters, and medical staff employees
Difficulty: Hard

Question ID: ID 9977

Link to the question: 
https://platform.stratascratch.com/coding/9977-find-the-number-of-police-officers-firefighters-and-medical-staff-employees

*/

SELECT COUNT(DISTINCT id) AS n_emp
    , CASE 
        WHEN LOWER(jobtitle) LIKE '%firefighter%' THEN 'Firefighter' 
        WHEN LOWER(jobtitle) LIKE '%police%' THEN 'Police' 
        WHEN LOWER(jobtitle) LIKE '%medical%' THEN 'Medical' 
      END AS company
FROM sf_public_salaries
GROUP BY company
HAVING company IS NOT NULL
;
