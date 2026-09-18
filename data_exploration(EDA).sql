use real_state;
show tables;

# there was problem loading data while havving null values in size_sqft and listing_price, so i converted null into 0 for whole data here, now 
# updating data as it was and all the update command are commented for data integarity.alter


-- SET SQL_SAFE_UPDATES = 0;

-- update re_properties_transactions
-- set Size_SqFt = null
-- where Size_SqFt = 0;

-- update re_properties_transactions
-- set listing_price = null
-- where listing_price = 0;
# Now its conveted into the real raw data.

#Exploraty Data Analysis (EDA) 

select count(*)  as total_rows from re_properties_transactions;
select count(*)  as total_rows from re_market_trends;
select count(*)  as total_rows from re_agents_clients;


#updated the null values in types with "others" --

-- update re_properties_transactions 
-- set type = 'Others'
-- where type = "";

desc re_properties_transactions;
desc re_market_trends;
desc re_agents_clients;

select count(*) as missing_values from re_properties_transactions
where Size_SqFt is null;

select count(*) from re_properties_transactions
where Listing_Price is null;



#Let's see the duplicate values 

select property_id, count(property_id) as cunt
from re_properties_transactions
group by property_id
having count(property_id) > 1;

select property_id, Year_Built,Listing_Price, count(*) as count
from re_properties_transactions
group by property_id,Year_Built,Listing_Price
having count(property_id) > 1;


# there is no duplicate values in this this data.


#lets check is there any outliers exits in the data
-- pricing outliers by evaluating negative or top 1% sale prices to detect
-- possible data entry issues.

select * from re_properties_transactions
where Listing_Price < 0;

#there is no value with "-" sign

#let check the top 1% sales data as suggested for outliers. 
create table top1_sales as
select *
from
(select * , 
percent_rank() over(order by listing_price) as per_rnk
from re_properties_transactions) as new 
where per_rnk >= 0.99
order by Property_ID asc;


select * from top1_sales
where Listing_Price < 1980000;

# I can't see any Outliers here by Listing_Prices 





#Let explore it through the size_sqFt

select *
from
(select * , 
percent_rank() over(order by Size_SqFt) as per_rnk
from re_properties_transactions) as new 
where per_rnk >= 0.99
order by Property_ID asc;

#no outliers here 
