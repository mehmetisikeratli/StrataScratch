
/*

File Contents Shuffle
Difficulty: Hard

Question ID: ID 9818

Link to the question: 
https://platform.stratascratch.com/coding/9818-file-contents-shuffle

*/


WITH RECURSIVE new_table AS (
    SELECT 
        filename
        , contents
        , LENGTH(contents) - LENGTH(REPLACE(contents, ' ' , '')) + 1 AS n
        , 1 AS x
        , SUBSTRING_INDEX(SUBSTRING_INDEX(contents, " ", 1) , ' ', -1) AS words
    FROM google_file_store
    WHERE filename = 'final.txt'
    UNION ALL 
    SELECT 
        filename
        , contents
        , n
        , x + 1
        , SUBSTRING_INDEX(SUBSTRING_INDEX(contents, " ", x+1) , ' ', -1) AS words
    FROM new_table
    WHERE x < n
    )
SELECT 'wacky.txt' AS filename
    , GROUP_CONCAT(words ORDER BY words ASC SEPARATOR ' ') AS contents_ordered
FROM new_table
GROUP BY filename
;

