CREATE TABLE Customers (
    customer_key INT PRIMARY KEY,
    gender VARCHAR(20),
    name VARCHAR(100),
    city VARCHAR(100),
    state_code VARCHAR(10),
    state VARCHAR(100),
    zip_code VARCHAR(50),
    country VARCHAR(100),
    continent VARCHAR(50),
    birthday DATE
);

CREATE TABLE Products (
    product_key INT PRIMARY KEY,
    product_name VARCHAR(150),
    brand VARCHAR(100),
    color VARCHAR(50),
    unit_cost_usd NUMERIC(10,2),
    unit_price_usd NUMERIC(10,2),
    subcategory_key INT,
    subcategory VARCHAR(100),
    category_key INT,
    category VARCHAR(100)
);

CREATE TABLE Stores (
    store_key INT PRIMARY KEY,
    country VARCHAR(100),
    state VARCHAR(100),
    square_meters INT,
    open_date DATE
);

CREATE TABLE Exchange_Rates (
    date DATE,
    currency VARCHAR(10),
    exchange_rate NUMERIC(10,4),
    PRIMARY KEY (date, currency)
);

CREATE TABLE Sales (
    order_number INT,
    line_item INT,
    order_date DATE,
    delivery_date DATE, 
    customer_key INT,
    store_key INT,
    product_key INT,
    quantity INT,
    currency_code VARCHAR(5),
    PRIMARY KEY (order_number, line_item)
);



ALTER TABLE Sales
ADD CONSTRAINT fk_sales_customer
FOREIGN KEY (customer_key) REFERENCES Customers(customer_key);

ALTER TABLE Sales
ADD CONSTRAINT fk_sales_product
FOREIGN KEY (product_key) REFERENCES Products(product_key);

ALTER TABLE Sales
ADD CONSTRAINT fk_sales_store
FOREIGN KEY (store_key) REFERENCES Stores(store_key);

ALTER TABLE Sales
ADD CONSTRAINT fk_sales_exchange
FOREIGN KEY (order_date, currency_code) REFERENCES Exchange_Rates(date, currency);
