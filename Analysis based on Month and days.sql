SELECT * FROM pizza_sales;

-- ANALYSIS 
-- Monthly trend for Total Revenue

SELECT TO_CHAR(order_date,'MONTH') AS monthly_trend, SUM(total_price)
FROM pizza_sales
GROUP BY TO_CHAR(order_date,'MONTH');


SELECT 
    DATE_TRUNC('month', order_date) AS month,
    SUM(total_price) AS monthly_revenue
FROM pizza_sales
GROUP BY DATE_TRUNC('month', order_date)
ORDER BY DATE_TRUNC('month', order_date);

-- Monthly trend for Total orders

SELECT TO_CHAR( Order_date, 'MONTH') AS order_day, 
COUNT(DISTINCT order_id) AS total_orders 
FROM pizza_sales
GROUP BY TO_CHAR( Order_date, 'MONTH');


-- Daily Trend for Total Revenue: 

SELECT TO_CHAR(order_date,'DAY') AS order_day, SUM(total_price) 
FROM pizza_sales
GROUP BY TO_CHAR(order_date,'DAY');

-- Daily Trend for Total Orders: 

SELECT TO_CHAR( Order_date, 'DAY') AS order_day, 
COUNT(DISTINCT order_id) AS total_orders 
FROM pizza_sales
GROUP BY TO_CHAR( Order_date, 'DAY');

-- percentage of sales by pizza category

SELECT pizza_category, SUM(total_price) AS total_revenue,
CAST(SUM(total_price) * 100 / 
(SELECT SUM(total_price) FROM pizza_sales) AS DECIMAL(10,2)) AS per_of_sales_by_category
FROM pizza_sales
GROUP BY pizza_category;

-- percentage of sales by pizza size 

SELECT pizza_size, SUM(total_price) AS total_revenue,
CAST(SUM(total_price) * 100 / 
(SELECT SUM(total_price) FROM pizza_sales) AS DECIMAL(10,2)) AS per_of_sales_by_size
FROM pizza_sales
GROUP BY pizza_size;

-- total pizza's sold by pizza size and category 

SELECT pizza_category, SUM(quantity) as quantity_sum 
FROM pizza_sales 
GROUP BY pizza_category;


SELECT pizza_size, SUM(quantity) as quantity_sum 
FROM pizza_sales 
GROUP BY pizza_size;

-- helps to indentify the pizzas sold in a month based on the pizza category

SELECT pizza_category, SUM(quantity) as Total_Quantity_Sold
FROM pizza_sales
WHERE EXTRACT(MONTH FROM order_date) = 1
GROUP BY pizza_category
ORDER BY Total_Quantity_Sold DESC;

-- Revenue by Pizza Name

SELECT pizza_name, SUM(total_price) as total_revenue 
FROM pizza_sales 
GROUP BY pizza_name;



