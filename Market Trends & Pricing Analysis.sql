SELECT * FROM real_state.re_properties_transactions
where year_built = 2023;

-- Q1: How does property pricing vary across different cities over time?


select year_built as year, 
city, 
round(avg(listing_price), 2) as avg_prices
from re_properties_transactions
where Year_Built >=2019 and Year_Built <= 2023
group by year_built, city
order by Year_Built asc;



with priceranges as (
select year_built as year, 
city, 
round(avg(listing_price), 2) as avg_prices
from re_properties_transactions
where Year_Built >=2019 and Year_Built <= 2023
group by year_built, city
order by Year_Built asc
)
select year, 
city, 
avg_prices, 
lag(avg_prices) over(partition by city order by year) as next_year_prices, 
round((avg_prices - lag(avg_prices) over(partition by city order by year))/lag(avg_prices) over(partition by city order by year)*100, 2) as
percent_change
from priceranges;


-- Q2:How does property pricing vary across different cities over time?





with priceranges as (
select year_built as year, 
city, 
round(avg(listing_price), 2) as avg_prices
from re_properties_transactions
where Year_Built >=2019 and Year_Built <= 2023
group by year_built, city
order by Year_Built asc
)
select year, 
city, 
avg_prices, 
lag(avg_prices) over(partition by city order by year) as next_year_prices, 
round((avg_prices - lag(avg_prices) over(partition by city order by year))/lag(avg_prices) over(partition by city order by year)*100, 2) as
percent_change
from priceranges
order by year, percent_change desc;



-- Q3: How do property prices vary by property type?

select type, 
round(avg(listing_price), 2) as avg_prices 
from re_properties_transactions
group by type
order by avg_prices desc;

#townhouse is most costlier one and house is the most affordable aand cheapest one 

-- Q4: Which property types are most frequently listed, and how does listing
-- volume vary across cities?

select type, city, 
count(*) as total_count
from re_properties_transactions
group by type, city
order by total_count desc;

-- Apartment with city Seattle leading with 874 properties, while unknown property
-- type with city chicago is at the bottom with 79 properties. 
-- aprtment and townhouse type propeties are in leading with diffrent diffrent cities. 

select type, city, 
count(*) as total_count
from re_properties_transactions
group by type, city
order by city, type;



-- Q5: How do interest rate changes impact property prices?

with average_prices as 
(select m.interest_rate,  round(avg(t.Listing_Price), 2) as average_listing_prices
from re_properties_transactions as t 
join re_market_trends as m 
on t.city = m.city 
and m.Years = t.year_built
group by m.interest_rate
order by m.interest_rate asc)

select *, 
round((average_listing_prices - lag(average_listing_prices) over(order by interest_rate))/lag(average_listing_prices) over(order by interest_rate)*100, 2)
as percentage_chnage
from average_prices;


-- interest was effecting the purchasing power among the customers, and average prices as dropping as interest rate increasing. 


with average_prices as 
(select t.type, t.city, m.interest_rate, round(avg(t.Listing_Price), 2) as average_listing_prices
from re_properties_transactions as t 
join re_market_trends as m 
on t.city = m.city 
and m.Years = t.year_built
group by  t.type, t.city, m.interest_rate
order by m.interest_rate asc)

select *, 
round((average_listing_prices - lag(average_listing_prices) over(partition by type, city order by interest_rate))/lag(average_listing_prices) 
over(partition by type, city order by interest_rate)*100, 2) as percentage_change
from average_prices
order by type, city, interest_rate
;

-- imported this table as excel file, this will understand the the percentage more deeply and helps us to make decisions based on this. 

