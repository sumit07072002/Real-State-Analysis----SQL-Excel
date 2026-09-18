-- Q1: Which buyer segments are most active in the real estate market, and how do
-- their preferences change over time?



# after checking the metadatadox i got know that there is some column are missing in transaction dataset.
# due to insuffient data, this stage 6 of this project can't be perform. 



select * from re_properties_transactions;
select * from re_market_trends;
select * from re_agents_clients;


select year_built, count(*) as total_activity
from re_properties_transactions
group by year_built
order by Year_Built;