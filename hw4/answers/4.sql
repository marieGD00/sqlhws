with filtered_users as (
    select user_id, business_id from review
    where user_id in (
        select review.user_id
        from users
        join review on users.user_id = review.user_id
        group by review.user_id
        having count(review.user_id) >= 200
    ) union
    select user_id, business_id from tip
    where user_id in (
        select review.user_id from users
        join review on users.user_id = review.user_id
        group by review.user_id
        having count(review.user_id) >= 200
    )
)
select
a.user_id as user_id1, b.user_id as user_id2, count(*) as similarity
from filtered_users a
join filtered_users b on a.business_id = b.business_id and a.user_id < b.user_id
group by a.user_id, b.user_id
order by count(*) desc
limit 1;
