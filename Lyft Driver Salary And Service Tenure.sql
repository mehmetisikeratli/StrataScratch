
/*

Lyft Driver Salary And Service Tenure
Difficulty: Hard

Question ID: ID 10018

Link to the question: 
https://platform.stratascratch.com/coding/10018-lyft-driver-salary-and-service-tenure

*/


SELECT AVG(DATEDIFF(end_date, start_date) / yearly_salary) AS diff
FROM lyft_drivers
WHERE end_date IS NOT NULL
;
