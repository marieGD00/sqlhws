select users.name,users.user_id,count(users.user_id) as review_c from users join review on users.user_id = review.user_id group by users.user_id order by review_c desc, name limit 10;
