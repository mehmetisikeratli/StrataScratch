

/*

The Most Popular Client_Id Among Users Using Video and Voice Calls
Difficulty: Hard

Question ID: ID 2029

Link to the question: 
https://platform.stratascratch.com/coding/2029-the-most-popular-client_id-among-users-using-video-and-voice-calls

*/


SELECT client_id 
FROM (
    SELECT user_id, client_id, COUNT(user_id) AS all_users
        , COUNT(CASE WHEN event_type IN ('video call received', 'video call sent'
        , 'voice call received', 'voice call sent') THEN user_id END) 
            AS target_users
        , COUNT(CASE WHEN event_type IN ('video call received', 'video call sent'
        , 'voice call received', 'voice call sent') THEN user_id END) / COUNT(user_id) * 100 AS percentage
    FROM fact_events
    GROUP BY user_id
    HAVING percentage > 50
    ORDER BY percentage DESC
    LIMIT 1
    ) AS a
;

