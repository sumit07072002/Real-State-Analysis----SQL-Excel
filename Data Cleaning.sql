use real_state;
show tables;
select * from re_properties_transactions;

select * from re_properties_transactions
where Listing_Price is null;

select distinct type, city from re_properties_transactions;


#Lets see the median listing_Prices by type and location to fill the missing values;

SET SQL_SAFE_UPDATES = 0;

with medianPrice as

(select distinct type, 
city, 
Listing_Price,
row_number() over(partition by type, city order by Listing_Price) as rk_num, 
count(*)  over(partition by type, city) as total_rows
from re_properties_transactions
where Listing_Price is not null), 

m_price as 

(select type, 
city, 
avg(listing_price) as median_prices
from medianPrice
where rk_num in (floor((total_rows + 1)/2), (ceil(total_rows + 1)/2))
group by type, city)

update re_properties_transactions as p 
join m_price as m 
on p.type = m.type and 
p.city = m.city
set p.listing_price = m.median_prices 
where p.listing_price is null;


#lets verify the updating 
select * from re_properties_transactions
where Listing_Price is null;

# lets have a look once into the table 
select * from re_properties_transactions;




#Now it's time to fill the size_SqFT missing values. 
#Lets use the mean to fill this values by type and city 

with avg_sizes as 
(select type, city, avg(size_SqFT) as avg_size
from re_properties_transactions
where Size_SqFt is not null
group by type, city)
update re_properties_transactions as p 
join avg_sizes as a
on a.type = p.type and 
a.city = p.city 
set p.Size_SqFt = a.avg_size
where p.Size_SqFt is null;

#lets verify the updating 
select * from re_properties_transactions
where Size_SqFt is null;

#let see the data once 
select * from re_properties_transactions;



#Lets remove the duplicates values 

select property_id, listing_price, neighborhood,
count(*) as count_values
from re_properties_transactions
group by property_id, listing_price, neighborhood
having count(*) > 1