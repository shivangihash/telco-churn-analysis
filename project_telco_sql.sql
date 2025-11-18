use telco_churn;
   
SELECT * FROM cleaned_telco_churn LIMIT 10;
--  Total customers 
SELECT COUNT(*) AS total_customers FROM cleaned_telco_churn;
-- (7043) 
--  Churn count & rate
SELECT Churn, COUNT(*) AS count, 
       ROUND(COUNT(*) * 100 / (SELECT COUNT(*) FROM cleaned_telco_churn), 2) AS percentage
FROM cleaned_telco_churn
GROUP BY Churn;
-- Churn count yes - 1869 , 26.54% no - 5174 ,73.46%
--  Gender distribution
SELECT Gender, COUNT(*) AS total FROM cleaned_telco_churn GROUP BY Gender;
## female = 3488 male = 3555
-- Senior citizen distribution
SELECT SeniorCitizen, COUNT(*) AS total FROM cleaned_telco_churn GROUP BY SeniorCitizen;
## 1142

# Demographic Analysis
-- Gender vs Churn
SELECT Gender, 
       SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END) AS churned,
       COUNT(*) AS total,
       ROUND(SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END)*100/COUNT(*),2) AS churn_rate
FROM cleaned_telco_churn
GROUP BY Gender;
## female = 939/3488 = 26.92%
## male = 930/3555 = 26.16%

-- Senior Citizen vs Churn
SELECT SeniorCitizen, 
       ROUND(SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END)*100/COUNT(*),2) AS churn_rate
FROM cleaned_telco_churn
GROUP BY SeniorCitizen;
## ans = 41.68%


# Service & Contract Insights
-- Contract Type
SELECT Contract, 
       ROUND(SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END)*100/COUNT(*),2) AS churn_rate
FROM telco_churn
GROUP BY Contract;

-- Internet Service Type
SELECT InternetService, 
       ROUND(SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END)*100/COUNT(*),2) AS churn_rate
FROM cleaned_telco_churn
GROUP BY InternetService;
## DSL - 18.96    Fiber optic - 41.89  non users-7.40

## Payment & Charges
-- Payment Method
SELECT PaymentMethod, 
       ROUND(SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END)*100/COUNT(*),2) AS churn_rate
FROM cleaned_telco_churn
GROUP BY PaymentMethod
ORDER BY churn_rate DESC;
# electronic check - 45.29%
# mailed check - 19.11%
# bank transfer - 16.71%
# credit card - 15.24%

-- Average Monthly Charges
SELECT Churn, ROUND(AVG(MonthlyCharges),2) AS avg_monthly_charge
FROM cleaned_telco_churn
GROUP BY Churn;
## 74.44


##Tenure Analysis

-- Average tenure per churn
SELECT Churn, ROUND(AVG(Tenure),2) AS avg_tenure
FROM cleaned_telco_churn
GROUP BY Churn;
## 17.98%

-- Categorized tenure
SELECT 
  CASE
    WHEN Tenure <= 12 THEN '0-1 year'
    WHEN Tenure BETWEEN 13 AND 24 THEN '1-2 years'
    WHEN Tenure BETWEEN 25 AND 48 THEN '2-4 years'
    ELSE '4+ years'
  END AS TenureGroup,
  ROUND(SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END)*100/COUNT(*),2) AS churn_rate
FROM cleaned_telco_churn
GROUP BY TenureGroup;
# 0-1 year - 47.44%
# 2-4 year - 20.39%
# 1-2 year - 28.71%
# 4+ year - 9.51%

## Effect of Tech Support on Retention
SELECT TechSupport,
       ROUND(SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END)*100/COUNT(*),2) AS churn_rate
FROM cleaned_telco_churn
GROUP BY TechSupport;
## support - 15.17 ,no support - 41.64 ,no internet sservice - 7.40

## Detect Cross-Dependency — e.g., Internet + StreamingTV
SELECT InternetService, StreamingTV,
       ROUND(SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END)*100/COUNT(*),2) AS churn_rate
FROM cleaned_telco_churn
GROUP BY InternetService, StreamingTV
ORDER BY churn_rate DESC;
## fibre optic + streaming tv = 39.26
## dsl + streaming tv = 13.27

## Revenue Lost to Churn
SELECT 
  SUM(CASE WHEN Churn='Yes' THEN MonthlyCharges ELSE 0 END) AS monthly_revenue_lost,
  ROUND(SUM(CASE WHEN Churn='Yes' THEN MonthlyCharges ELSE 0 END)*12,2) AS yearly_revenue_lost
FROM cleaned_telco_churn;
## monthly revenue = 1,39,131
## yearly revenue = 16,69,570

