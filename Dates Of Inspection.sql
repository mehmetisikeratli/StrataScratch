
/*

Dates Of Inspection
Difficulty: Hard

Question ID: ID 9714

Link to the question: 
https://platform.stratascratch.com/coding/9714-dates-of-inspection

*/

with cte as
(
select
facility_name,
score,
activity_date, 
  rank() over(partition by facility_name order by activity_date desc) as date_rank,
lag(activity_date,1) over(partition by facility_name order by activity_date desc) as prev_date
from los_angeles_restaurant_health_inspections
    where score in (select max(score) from los_angeles_restaurant_health_inspections)
    and 
    lower(facility_name) like '%restaurant%'
),c1 as 
(
    select
    facility_name,
    score,
    activity_date,
    date_rank,
    prev_date,
   timestampdiff(day,activity_date,lag(activity_date,1) over(partition by facility_name order by activity_date desc)) as numOf_days
    from
   cte
),c2 as
(
    select
     facility_name,
        score,
        activity_date,
        max(date_rank) as max_rank
    from c1 
    where date_rank <= 2 
    group by 1 
)
select
c1.facility_name,
c1.score,
c1.activity_date,
c1.prev_date,
c1.numOf_days
from c1 join c2 on c1.facility_name = c2.facility_name 
and c1.date_rank = c2.max_rank
;
