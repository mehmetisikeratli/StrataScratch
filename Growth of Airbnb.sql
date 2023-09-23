
/*

Growth of Airbnb
Difficulty: Hard

Question ID: ID 9637

Link to the question: 
https://platform.stratascratch.com/coding/9637-growth-of-airbnb

*/


SELECT YEAR(host_since)
    , COUNT(id) AS n_hosts_signed
    , LAG(COUNT(id)) OVER(ORDER BY YEAR(host_since) ASC) AS prev_year
    , ROUND( (COUNT(id) - LAG(COUNT(id)) OVER(ORDER BY YEAR(host_since) ASC) ) / 
        LAG(COUNT(id)) OVER(ORDER BY YEAR(host_since) )  * 100 ) AS growth_percentage
FROM airbnb_search_details
WHERE host_since IS NOT NULL
GROUP BY YEAR(host_since)
ORDER BY YEAR(host_since) ASC
;
