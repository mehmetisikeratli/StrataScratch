
/*

Counting Instances in Text
Difficulty: Hard

Question ID: ID 9814

Link to the question: 
https://platform.stratascratch.com/coding/9814-counting-instances-in-text


*/

WITH cte AS (
    SELECT -- LENGTH(contents)
        -- , LENGTH(REPLACE(contents,'bull',''))
        'bull' AS word
        , SUM(LENGTH(contents) - LENGTH(REPLACE(contents,'bull',''))) / 4 AS n_repeat
    FROM google_file_store
    GROUP BY word
    -- WHERE filename = 'draft1.txt'
    UNION
    SELECT
        'bear' AS word
        , SUM(LENGTH(contents) - LENGTH(REPLACE(contents,'bear',''))) / 4 AS n_repeat
    FROM google_file_store
    GROUP BY word
    )
SELECT *
FROM cte
;
