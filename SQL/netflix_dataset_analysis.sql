-- Total customers in dataset 
SELECT
    COUNT(customer_id) as total_customers
FROM netflix_customers;

-- Checking for duplicates 
SELECT
    COUNT(customer_id) as total_records,
    COUNT(DISTINCT customer_id) as total_records
FROM netflix_customers;

-- Overall churn rate
WITH ChurnedCustomers as (
    SELECT COUNT(customer_id) as churned_customers
    FROM netflix_customers
    WHERE churned = 1    
)

SELECT
    MAX(churned_customers) as total_customers_churned,
    COUNT(*) as total_customers,
    ROUND((CAST(MAX(churned_customers) as DECIMAL) / CAST(COUNT(*) as DECIMAL)) * 100, 2) as churn_rate
FROM netflix_customers, ChurnedCustomers;
