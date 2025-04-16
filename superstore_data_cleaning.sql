-- DATA CLEANING -------------------

select * from superstore;

 
describe superstore;
update superstore
SET `order date` = DATE_FORMAT(STR_TO_DATE(`order date`, '%m/%d/%Y'), '%Y-%m-%d');

alter table superstore
rename column `Row ID` to row_id;

alter table superstore
change column `order id` order_id varchar(30);

alter table superstore
change column `order date` order_date date;

update superstore
SET `ship date` = DATE_FORMAT(STR_TO_DATE(`ship date`, '%m/%d/%Y'), '%Y-%m-%d');

alter table superstore
change column `ship date` shipping_date date;

alter table superstore
rename column shipping_date to ship_date;

alter table superstore
change column `ship mode` ship_mode varchar(50);

alter table superstore
change column `customer ID` customer_Id varchar(50);

-- changing column name and datatype
alter table superstore
change column `customer name` customer_name varchar(50);

-- changing just datatype
alter table superstore
modify segment varchar(50);

alter table superstore
modify country varchar(50);

alter table superstore
modify State varchar(50);

alter table superstore
modify country varchar(50);

alter table superstore
modify city varchar(50);

alter table superstore
change column `postal code` Postal_Code int not null;

alter table superstore
modify region varchar(50);

alter table superstore
change column `product id` Product_ID varchar(60);

alter table superstore
modify Category varchar(60);

alter table superstore
change column `Sub-Category` sub_category varchar(60);

alter table superstore
change column `product name` product_name varchar(250);

alter table superstore
modify column sales double;

-- Just to check the above datatype is the right one for this column 
select min(sales) from superstore;
select max(sales) from superstore;

alter table superstore
modify column quantity smallint(4);

-- To check any duplicates and the result shows there is no duplicates
select row_id, count(row_id) from superstore
group by row_id
having count(row_id)>1;




