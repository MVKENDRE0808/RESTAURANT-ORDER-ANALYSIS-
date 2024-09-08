# RESTAURANT-ORDER-ANALYSIS- SQL
In my latest data analysis project, I utilized SQL to perform comprehensive queries and analyses on a restaurant's menu_items and order_details tables from the restaurant_db database. This project involved extracting valuable insights and addressing key business questions related to menu pricing, order details, and customer purchasing behavior. Below are some of the highlights of my work:
Menu Analysis:
Item Count: Used COUNT(*) to determine the total number of items on the menu.
Price Analysis: Identified the least and most expensive items by sorting with ORDER BY and limiting the results with LIMIT 1. Applied the same technique to Italian dishes specifically to understand pricing within this category.
Categorical Insights:
Dish Distribution: Aggregated data using GROUP BY with COUNT() to assess the number of dishes available in each category. Calculated the average price per category with AVG(), providing insights into price distribution across categories.
Advanced Ranking:
Top Dishes: Employed ROW_NUMBER() within a window function to rank dishes by price within each category. Extracted the top 3 most expensive dishes for targeted insights into premium menu items.
Order Details:
Date Range Analysis: Used MIN() and MAX() to establish the date range of orders in the dataset, facilitating time-based analysis.
Order Metrics: Calculated the total number of orders and items ordered by counting distinct order_id and summing up quantities respectively.
Order and Spending Insights:
High-Volume Orders: Identified orders with the most items by grouping with GROUP BY and counting items. Analyzed orders containing more than 12 items to understand high-volume purchasing behaviors.
Total Spend: Combined menu_items and order_details tables using INNER JOIN to calculate the total spend per order. Ranked orders by total spend with ORDER BY and LIMIT to find the top 5 highest-spending orders.
Detailed Order Analysis:
Order Breakdown: For the highest spending orders, examined specific items purchased and their quantities by grouping and counting items within each order.
This analysis provided actionable insights into menu pricing, customer spending patterns, and high-value items, demonstrating my capability to translate complex data into strategic business insights.
