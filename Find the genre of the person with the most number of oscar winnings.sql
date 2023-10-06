
/*

Find the genre of the person with the most number of oscar winnings
Difficulty: Hard

Question ID: ID 10171

Link to the question: 
https://platform.stratascratch.com/coding/10171-find-the-genre-of-the-person-with-the-most-number-of-oscar-winnings

*/


WITH cte AS (
    SELECT nominee
        , COUNT(id) AS n_wins
        , RANK() OVER(ORDER BY COUNT(id) DESC, nominee) AS rnk
    FROM oscar_nominees
    WHERE winner = 1
    GROUP BY nominee
    )
SELECT -- name, 
    top_genre
FROM nominee_information
WHERE name IN (SELECT nominee FROM cte WHERE rnk = 1)
;
