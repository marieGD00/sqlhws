with temp3 as (
    with temp2 as
        (select user_id, business_id, stars from review
        where user_id in (
            with temp as (select user_id, avg (stars) as avg from review
                group by user_id
                having user_id in (
                    select review.user_id from users
                    join review on users.user_id = review.user_id
                    group by review.user_id
                    having count(review.user_id) >= 50)
            )
            select user_id from temp
            where avg = (
                select min(avg)
                from temp)
            )
        )
        select user_id, business_id from temp2
        where stars = (
            select max(stars) from temp2
        )
    )
    select temp3.user_id, users.name as user_name, temp3.business_id, business.name as business_name from temp3
    join users on users.user_id = temp3.user_id
    left join business on business.business_id = temp3.business_id;
