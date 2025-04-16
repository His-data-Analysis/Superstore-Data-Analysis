select * from superstore limit 20;

-- What are total sales and total profits of each year?
	select 	year(order_date) as yearly,
			round(sum(sales), 2) as 'total_sales ($)',
			round(sum(profit), 2) as 'total_profit ($)'
	from superstore
    group by yearly
    order by yearly desc;
-- What are the total profits and total sales per quarter?
	select 
		year(order_date) as 'Year',
		case
			when month(order_date) in (1,2,3) then 'Q1'
			when month(order_date) in (4,5,6) then 'Q2'
			when month(order_date) in (7,8,9) then 'Q3'
			else 'Q4'
			end as 'Quarter',
			round(sum(sales),2) as 'Total sales ($)',
			round(sum(profit),2) as 'Total Profit ($)'
      from superstore
	  group by `Year`, `Quarter`
	  order by `Year`, `Quarter`;
        
-- What region generates the highest sales and profits ?
	select 
			region,
            round(sum(sales),2) as Total_sales,
            round(sum(profit),2) as Total_profit
            
    from superstore
    group by region
    order by `total_profit` desc;
    
    -- calculating profit margin from above result:
    select 
		region,
        round(sum(profit)/sum(sales) * 100, 2) as 'profit_margin (%)'
	from superstore
    group by region
    order by `profit_margin (%)` desc;
    
-- What state and city brings in the highest sales and profits ?
	select 
		state,
        round(sum(sales),2) as Total_sales,
        round(sum(profit),2) as Total_profit,
        round(sum(profit)/sum(sales) * 100,2) as profit_margin
	from superstore
    group by state
    order by `Total_profit` desc limit 10;
    
    -- the bottom ten state
    select 
		state,
        round(sum(sales),2) as Total_sales,
        round(sum(profit),2) as Total_profit,
        round(sum(profit)/sum(sales) * 100,2) as profit_margin
	from superstore
    group by state
    order by `Total_profit` asc limit 10;
    
     select 
		year(order_date) as 'year',
		state,
        round(sum(sales),2) as Total_sales,
        round(sum(profit),2) as Total_profit,
        round(sum(profit)/sum(sales) * 100,2) as profit_margin
	from superstore
    group by state, `year`
    order by `Total_profit` desc limit 10;
    
    select 
		city,
        round(sum(sales),2) as Total_sales,
        round(sum(profit),2) as Total_profit,
        round(sum(profit)/sum(sales) * 100,2) as profit_margin
	from superstore
    group by city
    order by `Total_profit` desc limit 10;
    
    -- the bottom ten cities
    select 
		city,
        round(sum(sales),2) as Total_sales,
        round(sum(profit),2) as Total_profit,
        round(sum(profit)/sum(sales) * 100,2) as profit_margin
	from superstore
    group by city
    order by `Total_profit` asc limit 10;

-- The relationship between discount and sales and the total discount per category
	SELECT 
		discount,
		round(AVG(sales),2) AS average_sales
	FROM superstore
	GROUP BY discount
	ORDER BY `average_sales` desc ;
    
    -- calculate total discount per product category:
    select 
		category,
        round(sum(discount),2) as Total_discount
    from superstore
    group by category
    order by `Total_discount` desc;
    
     select 
		category,
        sub_category,
        round(sum(discount),2) as Total_discount
    from superstore
    group by category, sub_category
    order by `Total_discount` desc;
    
   -- What category generates the highest sales and profits in each region and state ?
   -- categorywise profit margins:
	select 
		category,
        round(sum(sales),2) as Total_sales,
        round(sum(profit),2) as Total_Profit,
        round((sum(profit)/sum(sales) * 100), 2) as Profit_margin
	from superstore
    group by category
    order by `Total_profit` desc;
	
    -- regionwise 
    select 
		region,
        category,
        round(sum(sales),2) as Total_sales,
        round(sum(profit),2) as Total_Profit
	from superstore
    group by region, category
    order by `Total_profit` desc;
    
-- statewise
	select 
		state,
		category,
        round(sum(sales),2) as Total_sales,
        round(sum(profit),2) as Total_Profit
	from superstore
    group by state, category
    order by `Total_profit` desc;
    
-- What subcategory generates the highest sales and profits in each region and state ?
	-- profit margin
	select 
		sub_category,
        round(sum(sales),2) as Total_sales,
        round(sum(profit),2) as Total_Profit,
        round((sum(profit)/sum(sales) * 100), 2) as Profit_margin
	from superstore
    group by sub_category
    order by `total_profit` desc;
    -- regionwise
	select 
		region,
		sub_category,
        round(sum(sales),2) as Total_sales,
        round(sum(profit),2) as Total_Profit
	from superstore
    group by region, sub_category
    order by `Total_profit` desc;
    
    -- subcategory and state
    select 
		state,
		sub_category,
        round(sum(sales),2) as Total_sales,
        round(sum(profit),2) as Total_Profit
	from superstore
    group by state, sub_category
    order by `Total_profit` desc;
-- What are the names of the products that are the most and least profitable to us?
	-- most profitable
    select
		product_name,
        round(sum(sales),2) as total_sales,
        round(sum(profit),2) as total_profit
	from superstore
    group by product_name
    order by `total_profit` desc limit 5;
    
    -- least profitable
    select
		product_name,
        round(sum(sales),2) as total_sales,
        round(sum(profit),2) as total_profit
	from superstore
    group by product_name
    order by `total_profit` asc limit 5;
	
-- What segment makes the most of our profits and sales ?
	select
		segment,
        round(sum(sales),2) as total_sales,
        round(sum(profit),2) as total_profit
	from superstore
    group by segment
    order by `total_profit` desc;

-- How many customers do we have (unique customer IDs) in total and how much per region and state?
	-- total customers
	select count(distinct(customer_id)) as total_customers from superstore;
    
    -- regionwise total customers
    select 
		region,
        count(distinct(customer_id)) as total_customers 
	from superstore
    group by region;
    
    -- statewise total customers
    select 
		state,
        count(distinct(customer_id)) as total_customers 
	from superstore
    group by state
    order by `total_customers` desc;
        
-- Customer rewards program
select *from superstore limit 20;

	select 
		customer_id,
        round(sum(sales),2) as total_sales,
		case
			when sum(sales) between '15000' and '30000' then 'GOLD'
			when sum(sales) between '5000' and '14999' then 'BRONZE'
            when sum(sales) between '1000' and '4900' then 'SILVER'
			else 'No Reward'
			end as reward_tier
	from superstore
	group by customer_id
    order by total_sales desc;
    
-- Average shipping time per class and in total
		-- first average shipping time
        select round(avg(datediff(ship_date, order_date)), 1) as 'AVG Shipping Time'
        from superstore
        order by 'AVG Shipping Time' ;
      
		-- shipping mode and average shipping time
		SELECT 
			ship_mode,
            round(avg(datediff(ship_date, order_date)), 1) AS avg_shipping_time
		FROM superstore
		GROUP BY ship_mode
		ORDER BY `avg_shipping_time`;

