-- Total customers in dataset 
SELECT
    COUNT(customer_id) as total_customers
FROM netflix_customers;

-- Checking for duplicates 
SELECT
    COUNT(customer_id) as total_records,
    COUNT(DISTINCT customer_id) as total_records
FROM netflix_customers;