
/*

Words With Two Vowels
Difficulty: Hard

Question ID: ID 9794

Link to the question: 
https://platform.stratascratch.com/coding/9794-words-with-two-vowels

*/

WITH 
    RECURSIVE new_table AS (
    SELECT words
        , LENGTH(words) - LENGTH(REPLACE(words, ',' , '')) + 1 AS n
        , 1 AS x
        , SUBSTRING_INDEX(SUBSTRING_INDEX(words, ",", 1) , ',', -1) AS word
    FROM (    SELECT words1 AS words
    FROM google_word_lists
    UNION ALL
    SELECT words2 AS words
    FROM google_word_lists) a
    UNION
    SELECT words
        , n
        , 1 + x
        , SUBSTRING_INDEX(SUBSTRING_INDEX(words, ",", x+1) , ',', -1) AS word
    FROM new_table
    WHERE x < n
    )
SELECT DISTINCT word
FROM new_table
WHERE LENGTH(word) - LENGTH(REGEXP_REPLACE(word, '[aeiou]', "")) = 2
;
