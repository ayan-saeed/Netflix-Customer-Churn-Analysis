# Netflix-Customer-Churn-Analysis
Customer churn analysis using SQL, Excel, and PowerBI, aiming to identifying the key factors associated with customer churn and uncovering actionable insights to improve customer retention.

Note: This is a simulated dataset ("Netflix Customer Churn" by Abdul Wadood - Kaggle), and does not reflect Netflix's actual reported churn figures.

## SQL
### Data Validation 
Before analysis, the dataset was checked for structural integrity: 
- Total records: 5000
- Unique customers: 5000 (no duplicate `customer_id`'s found)
- One row per customer - dataset is clean and ready for analysis

### Business Findings
#### Churn Rate
- Overall, 50.3% of customers in this dataset are marked as churned. 
- It should be noted that this is a simulated dataset without an explicit churn window, and therefore cannot be compared to industry monthly/annual streaming benchmarks. 
- However, this 50.3% can act as a baseline. This baseline helps to identify where the biggest problems and opportunities lie within specific customer segments, such as: subscription types, regions, devices, etc.  

#### Churn Concentration 
##### Profiles
- Churn is notably lower for account with 4-5 profiles (37.54%-40.62%), compared to accounts with 1-3 profiles (57.44%-58.64%).
- This suggests accounts with 4-5 profiles specifically may be less likely to cancel, likely due to shared/household use, though this is entirely hyothetical and not something the data itself confirms. 

|Number of Profiles|Churn Rate|
|---|---|
|4|37.54|
|5|40.62|
|1|58.64|
|3|57.85|
|2|57.44|

##### Age and Demographic
- Churn rate is nearly identical across all age brackets (49.1%-51.55%), closely matching the overall 50.3% baseline. This suggests age is not a meaningful driver of churn in this dataset. 

|Age Bracket|Churn Rate|
|---|---|
|18-25|50.69|
|26-40|49.30|
|41-60|51.55|
|61+|49.12|



## Excel 

## PowerBI