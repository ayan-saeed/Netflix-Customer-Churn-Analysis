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

-- Churn concentration for number of profiles
WITH ChurnedCustomersPerProfile as (
    SELECT
        number_of_profiles,
        SUM(CASE
            WHEN churned = 1 THEN 1 
            ELSE 0 END) as number_of_churned,
        COUNT(customer_id) as num_of_customers
    FROM netflix_customers
    GROUP BY number_of_profiles
)

SELECT
    number_of_profiles,
    ROUND(CAST(number_of_churned as DECIMAL) / CAST(num_of_customers as DECIMAL) * 100, 2) as churn_rate
FROM ChurnedCustomersPerProfile
ORDER BY number_of_churned;

-- Churn concentration for age and demographic
WITH ChurnedCustomersPerAgeGroup as(
    SELECT
        CASE WHEN age >= 18 and age <= 25 THEN '18-25'
            WHEN age >= 26 and age <= 40 THEN '26-40'
            WHEN age >= 41 and age <= 60 THEN '41-60'
            WHEN age >= 61 THEN '61+'
        END AS age_bracket,
        COUNT(customer_id) as total_customers,
        SUM(CASE WHEN churned = 1 THEN 1 ELSE 0 END) as customers_churned
    FROM netflix_customers
    GROUP BY age_bracket
)

SELECT 
    age_bracket,
    ROUND((CAST(customers_churned as DECIMAL) / CAST(total_customers as DECIMAL)) * 100,2) as churn_rate
FROM ChurnedCustomersPerAgeGroup
ORDER BY age_bracket;