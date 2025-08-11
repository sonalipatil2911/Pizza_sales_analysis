DROP TABLE IF EXISTS pizza;
CREATE TABLE pizza(
	pizza_id VARCHAR(10) PRIMARY KEY,
	order_id VARCHAR(10),
	pizza_name_id VARCHAR(20),
	quantity INT,
	order_date DATE,
	order_time TIME,
	unit_price FLOAT,
	total_price FLOAT,
	pizza_size VARCHAR(5),
	pizza_category VARCHAR(20),
	pizza_ingredients VARCHAR(150),
	pizza_name VARCHAR(75)
)