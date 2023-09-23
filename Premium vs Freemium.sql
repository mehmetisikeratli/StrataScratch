

/*

Premium vs Freemium
Difficulty: Hard

Question ID: ID 10300

Link to the question: 
https://platform.stratascratch.com/coding/10300-premium-vs-freemium

*/


SELECT date
    , SUM(IF(paying_customer = 'no',f.downloads,0)) AS non_paying
    , SUM(IF(paying_customer = 'yes',f.downloads,0)) AS paying
FROM ms_user_dimension AS users
LEFT JOIN ms_acc_dimension AS acc
    USING(acc_id)
JOIN ms_download_facts AS f
    USING(user_id)
GROUP BY f.date
HAVING non_paying > paying
ORDER BY date ASC
;
