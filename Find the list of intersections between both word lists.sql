
/*

Find the list of intersections between both word lists
Difficulty: Hard

Question ID: ID 9816

Link to the question: 
https://platform.stratascratch.com/coding/9816-find-the-list-of-intersections-between-both-word-lists

*/

WITH RECURSIVE new_table AS (
    SELECT words
        , types
        , 1 AS x
        , LENGTH(words) - LENGTH(REPLACE(words, ",", "")) + 1 AS n
        , SUBSTRING_INDEX(SUBSTRING_INDEX(words, ",", 1 ) , ',' , -1) AS all_words
    FROM (    SELECT words1 AS words
                    , 'words1' AS types
                FROM google_word_lists
                UNION
                SELECT words2 AS words
                    , 'words2' AS types
                FROM google_word_lists) AS a
    UNION
    SELECT words
        , types
        , x + 1
        , n
        , SUBSTRING_INDEX(SUBSTRING_INDEX(words, ",", x+1) , ',' , -1) AS all_words
    FROM new_table
    WHERE x < n
    )
SELECT DISTINCT n1.all_words
FROM new_table AS n1
INNER JOIN new_table AS n2
    ON n1.all_words = n2.all_words
    AND n1.types <> n2.types
;

