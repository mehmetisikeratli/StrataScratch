
/*

Olympics Gender Ratio
Difficulty: Hard

Question ID: ID 9953

Link to the question: 
https://platform.stratascratch.com/coding/9953-find-the-gender-ratio-between-the-number-of-men-and-women-who-participated-in-each-olympics

*/

SELECT games
    , COUNT(CASE WHEN sex='M' THEN id ELSE NULL END) AS total_men
    , COUNT(CASE WHEN sex='F' THEN id ELSE NULL END) AS total_women
    , COUNT(CASE WHEN sex='M' THEN id ELSE NULL END) / COUNT(CASE WHEN sex='F' THEN id ELSE NULL END) AS gender_ratio
FROM (SELECT DISTINCT games, sex, id FROM olympics_athletes_events) AS a
GROUP BY games
;
