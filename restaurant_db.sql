USE restaurant_db;
-- View the menu_items table and write a query to find the number of items on the menu
SELECT * 
FROM menu_items;

SELECT COUNT(*) 
FROM menu_items;

-- What are the least expensive and the most expensive items on the menu?
SELECT * FROM menu_items
ORDER BY price
LIMIT 1;

SELECT * FROM menu_items
ORDER BY price DESC 
LIMIT 1;

-- How many Italian dishes are on the menu? 
SELECT count(*) as num_of_italian_dishes 
FROM menu_items
WHERE category = 'italian';

-- What are the least and most expensive Italian dishes on the menu?
SELECT * FROM menu_items
WHERE category = 'italian'
ORDER BY price
LIMIT 1;

SELECT * FROM menu_items
WHERE category = 'italian'
ORDER BY price DESC
LIMIT 1;

-- How many dishes are in each category? 
SELECT category, COUNT(item_name) AS num_of_items
FROM menu_items
GROUP BY category;

-- What is the average dish price within each category?
SELECT category, AVG(price) as avg_price
FROM menu_items
GROUP BY category;

-- 10. Advanced Query: Find the top 3 most expensive dishes in each category.
-- This query uses window functions to rank items by price within each category.
SELECT category, item_name, price
FROM (
    SELECT category, item_name, price,
           ROW_NUMBER() OVER (PARTITION BY category ORDER BY price DESC) AS item_rank
    FROM menu_items
) ranked_menu
WHERE item_rank <= 3;

-- View the order_details table. What is the date range of the table?
SELECT * FROM order_details;

SELECT MIN(order_date) as earliest_order_date,
	   MAX(order_date) as latest_order_date
from order_details;

-- How many orders were made within this date range? 
SELECT  COUNT(DISTINCT order_id) AS total_orders
from order_details;


-- How many items were ordered within this date range?
SELECT  COUNT(*) AS total_items_ordered
from order_details;

-- Which orders had the most number of items?
select order_id, count(item_id) num_of_items
from order_details
group by order_id
order by num_of_items DESC;

-- How many orders had more than 12 items?
SELECT COUNT(*) 
FROM
(select order_id, count(item_id) num_of_items
from order_details
group by order_id
HAVING num_of_items >12) AS num_of_orders;

-- Combine the menu_items and order_details tables into a single table
SELECT *
FROM menu_items m
inner join order_details o
on m.menu_item_id = o.item_id; 

-- What were the least and most ordered items? What categories were they in?
SELECT item_name, category, COUNT(order_details_id) AS num_of_purchases
FROM menu_items m
inner join order_details o 
on m.menu_item_id = o.item_id
GROUP BY Item_name, category
ORDER BY num_of_purchases;  -- Add DESC at the end to see most ordered items

-- What were the top 5 orders that spent the most money?
SELECT order_id, SUM(price) AS Total_spend
FROM menu_items m
inner join order_details o
on m.menu_item_id = o.item_id
GROUP BY order_id
ORDER BY Total_spend DESC
LIMIT 5;

-- View the details of the highest spend order. Which specific items were purchased?
SELECT category, count(item_name) as total_items, 
FROM menu_items m
inner join order_details o
on m.menu_item_id = o.item_id
WHERE order_id = 440
group by category;

-- View the details of the top 5 highest spend orders
SELECT category, order_id, count(item_name) as total_items
FROM menu_items m
inner join order_details o
on m.menu_item_id = o.item_id
WHERE order_id IN  (440, 440, 2075, 1957, 330, 2675)
group by order_id, category;

-- How much was the most expensive order in the dataset?
SELECT order_id, SUM(price) AS Total_spend
FROM menu_items m
inner join order_details o
on m.menu_item_id = o.item_id
GROUP BY order_id
ORDER BY Total_spend DESC
LIMIT 1;
