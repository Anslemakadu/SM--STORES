-- 1. How many records are in SM-Stores Orders table
Select count (*) 
from orders;

--2. How many Cities do SM-stores have properties in.
select * from propertyinfo;
select count (distinct "PropertyCity")
from propertyinfo
;

-- 3. How many orders were placed in each date stated in the orders table.
select * from orders;
select "OrderDate", count("Quantity")
from orders
group by "OrderDate"
order by "OrderDate"
;

-- 4. Return all records where the quantity purchased is above 5.
select * 
from orders;
select *
from orders
where "Quantity" > '5'
;

/*5. A customer has requested for a refund claiming they procured goods from our store.
Provide all the details of this order if the OrderID is = ‘3896’ */
select * 
from orders
;
select "OrderID","OrderDate", "PropertyCity", "PropertyState", "ProductName", "ProductCategory", "Price", "Quantity"
from orders
left join propertyinfo 
on orders."PropertyID"=propertyinfo."PropID"
left join products
on orders."ProductID"=products."ProductID"
where "OrderID" = 3896
;

-- 6. Can you process the number of orders we had in each year of SM-stores data.
select * 
from products
;
select
extract(year from "OrderDate")
as year,
count ("OrderID")
as "No of orders"
from orders 
group by year
;

-- 7. Which category is the most frequented in the year 2015.
select "ProductCategory",count ("OrderID") as "No of orders"
from orders as o
left join products as p
on o."ProductID"=p."ProductID"
where extract (year from "OrderDate") = '2015'
group by 1
order by 2 desc
;

-- 8. Which category has the highest sales in the year 2016.
select "ProductCategory", sum("Price" * "Quantity") as "Sales"
from orders as o
left join products as p
on p."ProductID" = o."ProductID"
where extract (year from "OrderDate") ='2016'
group by 1
order by 2 desc
limit 1
;
