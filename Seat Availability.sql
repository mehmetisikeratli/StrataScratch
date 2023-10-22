
/*

Seat Availability
Difficulty: Hard

Question ID: ID 2088

Link to the question: 
https://platform.stratascratch.com/coding/2088-seat-availability

*/

SELECT s.seat_number AS available_seat1
     , s.seat_right AS available_seat2
FROM theater_seatmap AS s
JOIN theater_availability AS a1
    ON a1.seat_number = s.seat_number
JOIN theater_availability AS a2
    ON a2.seat_number = s.seat_right
WHERE a1.is_available = 1
    AND a2.is_available = 1
    AND s.seat_number < s.seat_right
;
