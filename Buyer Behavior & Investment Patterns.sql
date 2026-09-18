-- Q1: Which Cities Exhibit the Strongest Housing Demand, and What Are the
-- Typical Home and Rent Prices in These Areas?


select pt.city, round(max(mt.housing_demand_index), 2) as Highest_Demand_Index, 
round(avg(pt.listing_price), 2) as Avg_Typical_Home_Price, 
round(avg(pt.rental_price), 2) as Avg_Typical_Rent_Price
from re_properties_transactions as pt 
join re_market_trends as mt 
on mt.city = pt.city 
and mt.years = pt.year_built
group by  pt.city
order by Highest_Demand_Index desc;


-- Q2: What is the distribution of property sizes across different property types?



select type, round(avg(size_sqft), 2) as avg_size_SqFt
from re_properties_transactions
group by type
order by avg_size_SqFt desc;

