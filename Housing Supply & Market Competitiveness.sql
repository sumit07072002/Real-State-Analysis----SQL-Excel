use real_state;

-- Q1: Which years saw the highest number of new property developments?

select year_built, count(*) as  new_properties_built
from re_properties_transactions
group by year_built 
order by new_properties_built desc;

-- 2011 has most new_properties_built with 317 and 2019 at the bottom with 240. 

-- Q2: Which cities have experienced the most new construction over the past
-- years?

select city, count(*) as  new_properties_built
from re_properties_transactions
group by city 
order by new_properties_built desc;

-- Miami at top with 3404
-- san francisco at bottom with 3247

-- Q3: How does new construction impact average home prices?


select year_built, count(*) as  new_properties_built, round(avg(Listing_Price), 2) as average_price
from re_properties_transactions
group by year_built 
order by Year_Built;


-- Q4: Which cities have seen the highest changes in investor activity?

with investors_scores as ( 
select 
city, 
years, 
round(investor_activity_score, 2) as investor_activity_score,
round(lag(investor_activity_score) over(partition by city order by years), 2) as previous_investor_activity_score
from re_market_trends
)
select *, 
round((investor_activity_score - previous_investor_activity_score), 2) as investor_activity_change
from investors_scores
where previous_investor_activity_score is not null
order by abs(investor_activity_change) desc


