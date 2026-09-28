SELECT * FROM pizza_sales;

-- TOP AND BOTTOM ANALYSIS 
-- Top 5 Pizzas by Revenue

SELECT pizza_name, SUM(total_price) as total_revenue 
FROM pizza_sales 
GROUP BY pizza_name
ORDER BY total_revenue DESC
LIMIT 5;

-- Bottom 5 Pizzas by Revenue 

SELECT pizza_name, SUM(total_price) as total_revenue 
FROM pizza_sales 
GROUP BY pizza_name
ORDER BY total_revenue ASC
LIMIT 5;

-- Top Pizza by Order 

SELECT pizza_name, COUNT(DISTINCT order_id) AS total_orders 
FROM pizza_sales 
GROUP BY pizza_name
ORDER BY total_orders DESC
LIMIT 5;

-- Bottom Pizza by Order: 

SELECT pizza_name, COUNT(DISTINCT order_id) AS total_orders 
FROM pizza_sales 
GROUP BY pizza_name
ORDER BY total_orders
LIMIT 5;

-- Top Pizza by Quantity Sold: 

SELECT pizza_name, SUM(quantity) as total_quantity 
FROM pizza_sales 
GROUP BY pizza_name
ORDER BY total_quantity DESC
LIMIT 5;

-- Bottom Pizza by Quantity Sold: 

SELECT pizza_name, SUM(quantity) as total_quantity 
FROM pizza_sales 
GROUP BY pizza_name
ORDER BY total_quantity
LIMIT 5;

-- For Top/Bottom Analysis If you want to apply the pizza_category or pizza_size filters to the above queries you can use WHERE clause. 

SELECT pizza_name, COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales
WHERE pizza_category = 'Classic'
GROUP BY pizza_name
ORDER BY Total_Orders DESC
LIMIT 5;


