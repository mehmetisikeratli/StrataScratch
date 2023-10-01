
/*

Quarterback With The Longest Throw
Difficulty: Hard

Question ID: ID 9966

Link to the question: 
https://platform.stratascratch.com/coding/9966-quarterback-with-the-longest-throw

*/

SELECT qb, MAX(REPLACE(lg,'t','')) AS throw
    -- LEFT(max(lg),char_length(max(lg))-1) AS longest_throw this might be a better solution
FROM qbstats_2015_2016
WHERE year = 2016
GROUP BY qb
ORDER BY lg DESC
LIMIT 1
;
