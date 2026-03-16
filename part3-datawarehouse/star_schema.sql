-- Drop fact table first because it depends on dimensions
DROP TABLE IF EXISTS fact_sales;
DROP TABLE IF EXISTS dim_date;
DROP TABLE IF EXISTS dim_store;
DROP TABLE IF EXISTS dim_product;

-- =====================================
-- 1. Dimension table: Date
-- =====================================
CREATE TABLE dim_date (
    date_key INT PRIMARY KEY,
    full_date DATE NOT NULL,
    day INT NOT NULL,
    month INT NOT NULL,
    year INT NOT NULL
);

-- =====================================
-- 2. Dimension table: Store
-- =====================================
CREATE TABLE dim_store (
    store_key INT PRIMARY KEY,
    store_name VARCHAR(100) NOT NULL,
    store_city VARCHAR(50) NOT NULL
);

-- =====================================
-- 3. Dimension table: Product
-- =====================================
CREATE TABLE dim_product (
    product_key INT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50) NOT NULL
);

-- =====================================
-- 4. Fact table: Sales
-- =====================================
CREATE TABLE fact_sales (
    sales_key INT PRIMARY KEY,
    transaction_id VARCHAR(20) NOT NULL,
    date_key INT NOT NULL,
    store_key INT NOT NULL,
    product_key INT NOT NULL,
    units_sold INT NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL,
    total_sales DECIMAL(12,2) NOT NULL,
    FOREIGN KEY (date_key) REFERENCES dim_date(date_key),
    FOREIGN KEY (store_key) REFERENCES dim_store(store_key),
    FOREIGN KEY (product_key) REFERENCES dim_product(product_key)
);

-- =====================================
-- Insert cleaned data into dim_date
-- Dates are standardized to YYYY-MM-DD
-- =====================================
INSERT INTO dim_date (date_key, full_date, day, month, year) VALUES
(20230115, '2023-01-15', 15, 1, 2023),
(20230205, '2023-02-05', 5, 2, 2023),
(20230220, '2023-02-20', 20, 2, 2023),
(20230331, '2023-03-31', 31, 3, 2023),
(20230809, '2023-08-09', 9, 8, 2023),
(20230815, '2023-08-15', 15, 8, 2023),
(20230829, '2023-08-29', 29, 8, 2023),
(20231026, '2023-10-26', 26, 10, 2023),
(20231208, '2023-12-08', 8, 12, 2023),
(20231212, '2023-12-12', 12, 12, 2023);

-- =====================================
-- Insert cleaned data into dim_store
-- Missing store_city values are standardized
-- based on store name
-- =====================================
INSERT INTO dim_store (store_key, store_name, store_city) VALUES
(1, 'Chennai Anna', 'Chennai'),
(2, 'Delhi South', 'Delhi'),
(3, 'Bangalore MG', 'Bangalore'),
(4, 'Pune FC Road', 'Pune');

-- =====================================
-- Insert cleaned data into dim_product
-- Category casing is standardized
-- electronics -> Electronics
-- Grocery / Groceries -> Groceries
-- =====================================
INSERT INTO dim_product (product_key, product_name, category) VALUES
(1, 'Speaker', 'Electronics'),
(2, 'Tablet', 'Electronics'),
(3, 'Phone', 'Electronics'),
(4, 'Smartwatch', 'Electronics'),
(5, 'Atta 10kg', 'Groceries'),
(6, 'Jeans', 'Clothing'),
(7, 'Biscuits', 'Groceries');

-- =====================================
-- Insert cleaned sample data into fact_sales
-- At least 10 rows from cleaned transaction data
-- total_sales = units_sold * unit_price
-- =====================================
INSERT INTO fact_sales (sales_key, transaction_id, date_key, store_key, product_key, units_sold, unit_price, total_sales) VALUES
(1, 'TXN5000', 20230829, 1, 1, 3, 49262.78, 147788.34),
(2, 'TXN5001', 20231212, 1, 2, 11, 23226.12, 255487.32),
(3, 'TXN5002', 20230205, 1, 3, 20, 48703.39, 974067.80),
(4, 'TXN5003', 20230220, 2, 2, 14, 23226.12, 325165.68),
(5, 'TXN5004', 20230115, 1, 4, 10, 58851.01, 588510.10),
(6, 'TXN5005', 20230809, 3, 5, 12, 52464.00, 629568.00),
(7, 'TXN5006', 20230331, 4, 4, 6, 58851.01, 353106.06),
(8, 'TXN5007', 20231026, 4, 6, 16, 2317.47, 37079.52),
(9, 'TXN5008', 20231208, 3, 7, 9, 27469.99, 247229.91),
(10, 'TXN5009', 20230815, 3, 4, 3, 58851.01, 176553.03);