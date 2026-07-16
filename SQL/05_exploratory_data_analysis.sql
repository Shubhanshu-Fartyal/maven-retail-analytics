SELECT
    MIN(order_date) AS first_order_date,
    MAX(order_date) AS last_order_date
FROM Sales;

SELECT
    COUNT(*) AS total_sales_rows,
    COUNT(DISTINCT order_number) AS total_orders,
    COUNT(DISTINCT customer_key) AS total_customers,
    COUNT(DISTINCT product_key) AS total_products,
    COUNT(DISTINCT store_key) AS total_stores,
    SUM(quantity) AS total_quantity_sold
FROM Sales;