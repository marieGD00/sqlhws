select count(DISTINCT business_id) from business where business_id not in (select distinct business_id from review);
