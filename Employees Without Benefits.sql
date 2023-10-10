
/*

Employees Without Benefits
Difficulty: Hard

Question ID: ID 9981

Link to the question: 
https://platform.stratascratch.com/coding/9981-employees-without-benefits

*/


SELECT jobtitle
    , COUNT(DISTINCT CASE WHEN benefits <= 0 OR benefits IS NULL THEN id END) AS n_without_benefits
    , COUNT(DISTINCT id) AS n_tot
    , COUNT(DISTINCT CASE WHEN benefits <= 0 OR benefits IS NULL THEN id END) / COUNT(DISTINCT id) AS ratio
FROM sf_public_salaries
GROUP BY jobtitle
;
