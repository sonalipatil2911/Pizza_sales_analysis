SELECT *
FROM pizza

------------------------------PIZZA SALES SQL QUERIES-------------------------

--A. KPI’s

--1. Total Revenue:
SELECT CAST(
		SUM(quantity*unit_price) AS DECIMAL(10,3)) AS total_revenue
FROM pizza;


--2. Average Order Value
SELECT SUM(total_price)/COUNT(*) AS avg_order_value
FROM pizza;


--3. Total Pizzas Sold
SELECT SUM(quantity) AS total_pizza_sold
FROM pizza;


--4. Total Orders
SELECT COUNT(DISTINCT order_id) AS total_orders
FROM pizza


--5. Average Pizzas Per Order
SELECT SUM(quantity)/COUNT(DISTINCT order_id) AS avg_pizza_per_order
FROM pizza


--B. Daily Trend for Total Orders
SELECT 
	TO_CHAR(order_date, 'DAY') AS order_day,
	COUNT(*)
FROM pizza
GROUP BY 1



--C. Monthly Trend for Orders
SELECT 
	TO_CHAR(order_date, 'MONTH') AS order_month,
	COUNT(*)
FROM pizza
GROUP BY 1


--D. % of Sales by Pizza Category
SELECT 	pizza_category,
		SUM(total_price) AS total_revenue,
		CAST(SUM(total_price)*100.0/(SELECT SUM(total_price) FROM pizza) AS DECIMAL(5,2)) AS percentage_sale_by_category
FROM pizza
GROUP BY 1



--E. % of Sales by Pizza Size
SELECT 	pizza_size,
		SUM(total_price) AS total_revenue,
		CAST(SUM(total_price)*100.0/(SELECT SUM(total_price) FROM pizza) AS DECIMAL(5,2)) AS percentage_sale_by_size
FROM pizza
GROUP BY 1


--F. Total Pizzas Sold by Pizza Category
SELECT 	pizza_category,
		SUM(quantity) AS pizza_sold
FROM pizza
GROUP BY 1


--G. Top 5 Pizzas by Revenue
SELECT 	pizza_name AS top_5_pizza,
		SUM(total_price) AS total_revenue
FROM pizza
GROUP BY 1
ORDER BY 2 DESC
LIMIT 5


--H. Bottom 5 Pizzas by Revenue
SELECT 	pizza_name AS bottom_5_pizza,
		SUM(total_price) AS total_revenue
FROM pizza
GROUP BY 1
ORDER BY 2 
LIMIT 5


--I. Top 5 Pizzas by Quantity
SELECT  pizza_name,
		SUM(quantity) AS total_sold_qty
FROM pizza
GROUP BY 1
ORDER BY 2 DESC
LIMIT 5


--J. Bottom 5 Pizzas by Quantity
SELECT	pizza_name,
		SUM(quantity) AS total_sold_qty
FROM pizza
GROUP BY 1
ORDER BY 2
LIMIT 5


--K. Top 5 Pizzas by Total Orders
SELECT  pizza_name,
		COUNT(DISTINCT order_id) AS Total_sold_pizza
FROM pizza
GROUP BY 1
ORDER BY 2 DESC
LIMIT 5


--L. Borrom 5 Pizzas by Total Orders
SELECT pizza_name,
		COUNT(DISTINCT order_id) AS total_sold
FROM pizza
WHERE pizza_category = 'Classic'
GROUP BY 1
ORDER BY 2
LIMIT 5


--NOTE
--If you want to apply the pizza_category or pizza_size filters to the above queries you can use WHERE clause. Follow some of below examples
--SELECT Top 5 pizza_name, COUNT(DISTINCT order_id) AS Total_Orders
--FROM pizza_sales
--WHERE pizza_category = 'Classic'
--GROUP BY pizza_name
--ORDER BY Total_Orders ASC
