
-- Calculate the total revenue
SELECT 
	SUM(total_price) AS Total_Revenue 
FROM 
	pizza_sales

-- Calculate the average order value
SELECT 
	(SUM(total_price) / COUNT(DISTINCT order_id)) AS Avg_order_Value 
FROM 
	pizza_sales

-- Calculate the total pizzas sold
SELECT 
	SUM(quantity) AS Total_pizza_sold 
FROM
	pizza_sales

-- Calculate the total orders
SELECT 
	COUNT(DISTINCT order_id) AS Total_Orders 
FROM 
	pizza_sales

-- Calculate the average pizzas per order
SELECT 
	CAST(CAST(SUM(quantity) AS DECIMAL(10,2)) / 
	CAST(COUNT(DISTINCT order_id) AS DECIMAL(10,2)) AS DECIMAL(10,2))
	AS Avg_Pizzas_per_order
FROM 
	pizza_sales

-- Identify pizzas from highest to lowest price
SELECT DISTINCT 
    pizza_name,
	pizza_size,
    unit_price        
FROM 
    Pizza_Sales       
ORDER BY 
    unit_price DESC;

-- Daily Trend for Total Orders
SELECT 
    DATENAME(DW, order_date) AS order_day, 
    COUNT(DISTINCT order_id) AS total_orders 
FROM 
    pizza_sales
GROUP BY 
    DATENAME(DW, order_date)
ORDER BY 
    total_orders DESC;

-- Monthly Trend for Total Orders
SELECT 
    DATENAME(MONTH, order_date) AS month_name, 
    COUNT(DISTINCT order_id) AS total_orders 
FROM 
    pizza_sales
GROUP BY 
    DATENAME(MONTH, order_date)
ORDER BY 
    total_orders DESC;

-- % of Sales by Pizza Category
SELECT 
	pizza_category, 
	CAST(SUM(total_price) AS DECIMAL(10,2)) as total_revenue,
	CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) from pizza_sales) 
	AS DECIMAL(10,2)) AS PCT
FROM
	pizza_sales
GROUP BY 
	pizza_category

-- % of Sales by Pizza Category
SELECT 
	pizza_size, 
	CAST(SUM(total_price) AS DECIMAL(10,2)) as total_revenue,
	CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) from pizza_sales) 
	AS DECIMAL(10,2)) AS PCT
FROM 
	pizza_sales
GROUP BY 
	pizza_size
ORDER BY 
	pizza_size


-- Top 5 Pizzas by Total Orders
SELECT 
	Top 5 pizza_name, 
	COUNT(DISTINCT order_id) AS Total_Orders
FROM 
	pizza_sales
GROUP BY 
	pizza_name
ORDER BY 
	Total_Orders DESC

-- Bottom 5 Pizzas by Total Orders
SELECT 
	Top 5 pizza_name, 
	COUNT(DISTINCT order_id) AS Total_Orders
FROM 
	pizza_sales
GROUP BY 
	pizza_name
ORDER BY 
	Total_Orders ASC

