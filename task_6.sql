SET GLOBAL local_infile = 1;

CREATE DATABASE sales_trends;
USE sales_trends;

CREATE TABLE online_sales (
    transaction_id VARCHAR(50),
    order_date DATE,
    product_category VARCHAR(100),
    product_name VARCHAR(255),
    units_sold INT,
    unit_price DECIMAL(10,2),
    total_revenue DECIMAL(15,2),
    region VARCHAR(100),
    payment_method VARCHAR(50)
);


LOAD DATA LOCAL INFILE "C:\\Users\\tanvi\\Downloads\\Online Sales Data.csv"
INTO TABLE online_sales
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(transaction_id, @date_str, product_category, product_name, units_sold, unit_price, total_revenue, region, payment_method)
SET order_date = CASE
    WHEN @date_str REGEXP '^[0-9]{2}/[0-9]{2}/[0-9]{4}$'
         THEN STR_TO_DATE(@date_str, '%d/%m/%Y')
    WHEN @date_str REGEXP '^[0-9]{4}-[0-9]{2}-[0-9]{2}$'
         THEN STR_TO_DATE(@date_str, '%Y-%m-%d')
    ELSE NULL
END;


#Total revenue by month
SELECT 
    EXTRACT(YEAR FROM order_date) AS order_year,
    EXTRACT(MONTH FROM order_date) AS order_month,
    SUM(total_revenue) AS total_monthly_revenue
FROM online_sales
GROUP BY order_year, order_month;


#Order volume by month
SELECT 
    EXTRACT(YEAR FROM order_date) AS order_year,
    EXTRACT(MONTH FROM order_date) AS order_month,
    COUNT(DISTINCT transaction_id) AS order_volume
FROM online_sales
GROUP BY order_year, order_month
ORDER BY order_year, order_month;


#Total revenue by month 
SELECT 
    EXTRACT(MONTH FROM order_date) AS order_month,
    SUM(total_revenue) AS total_monthly_revenue
FROM online_sales
GROUP BY order_month
ORDER BY order_month;


#Order volume by month 
SELECT 
    EXTRACT(MONTH FROM order_date) AS order_month,
    COUNT(DISTINCT transaction_id) AS order_volume
FROM online_sales
GROUP BY order_month
ORDER BY order_month;


#Use ORDER BY for sorting.
SELECT 
    EXTRACT(YEAR FROM order_date) AS order_year,
    EXTRACT(MONTH FROM order_date) AS order_month,
    SUM(total_revenue) AS total_monthly_revenue
FROM online_sales
GROUP BY order_year, order_month
ORDER BY total_monthly_revenue DESC;


#Limit results for specific time periods.
SELECT 
    EXTRACT(YEAR FROM order_date) AS order_year,
    EXTRACT(MONTH FROM order_date) AS order_month,
    SUM(total_revenue) AS total_monthly_revenue,
    COUNT(DISTINCT transaction_id) AS order_volume
FROM online_sales
WHERE order_date BETWEEN '2024-03-01' AND '2024-06-30'
GROUP BY order_year, order_month
ORDER BY order_year, order_month;


















