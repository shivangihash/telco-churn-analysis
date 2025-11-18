.

🌐 Telco Customer Churn Analysis
Python + SQL End-to-End Project
<p align="center"> <img src="https://img.shields.io/badge/Status-Completed-success?style=for-the-badge" /> <img src="https://img.shields.io/badge/Python-Data%20Cleaning-blue?style=for-the-badge&logo=python" /> <img src="https://img.shields.io/badge/SQL-Analysis-orange?style=for-the-badge&logo=mysql" /> <img src="https://img.shields.io/badge/Domain-Telecom-red?style=for-the-badge" /> </p>

Customer churn is a major challenge for telecom companies. In this project, I analyzed churn behavior using Python for data cleaning and MySQL for in-depth analysis to uncover revenue impact, churn patterns, and customer retention insights.

📁 Project Structure
Telco_Churn_Project/
│
├── data/
│   └── cleaned_telco_churn.csv
│
├── notebooks/
│   └── telco_churn.ipynb
│
├── sql/
│   └── project_telco_sql.sql
│
└── README.md

🧹 1. Data Cleaning (Python)

Performed using Pandas + NumPy.

🔧 Key Cleaning Steps

Converted TotalCharges to numeric

Filled null values

Created CLV (Customer Lifetime Value)

Added Churn_Flag (1 = Yes, 0 = No)

Standardized Contract Type groups

Saved cleaned dataset

🛠 Example Code
df["TotalCharges"] = pd.to_numeric(df["TotalCharges"], errors="coerce")
df["TotalCharges"].fillna(0, inplace=True)

df["CLV"] = df["MonthlyCharges"] * df["tenure"]
df["Churn_Flag"] = df["Churn"].apply(lambda x: 1 if x == "Yes" else 0)

🛢 2. SQL Analysis (MySQL)

This project includes deep-dive SQL insights such as:

📌 Customer Profile Insights

Total customers

Churn count & churn rate

Gender & senior citizen breakdown

📌 Service & Contract Insights

Contract type vs churn

Internet service type

Impact of technical support

Cross-dependency (Streaming + Internet)

📌 Cost & Revenue Insights

Average monthly charges

Tenure segmentation

Estimated revenue lost due to churn

🧾 Example Query
SELECT Churn,
       COUNT(*) AS customer_count,
       ROUND(COUNT(*) * 100 / (SELECT COUNT(*) FROM cleaned_telco_churn), 2) AS churn_rate
FROM cleaned_telco_churn
GROUP BY Churn;

📊 3. Key Findings
🔥 Churn Rate

26.54% overall churn

👵 Senior Citizen

Senior citizens have 41.68% churn

📄 Contract Type

Month-to-month customers churn the most

Long-term contracts drastically reduce churn

💳 Payment Methods

Electronic Check → 45.29% churn (highest)

Credit card → lowest churn

📺 Streaming + Internet

Fiber optic + streaming TV users churn ~39%

🧍 Tenure

0–1 year customers churn 47%

4+ years → 9.5%

💰 Revenue Impact

Monthly revenue lost: ₹1,39,131

Yearly revenue lost: ₹16,69,570

🛠 Technologies Used
Tool	Purpose
Python (Pandas, NumPy)	Data cleaning, preprocessing
Jupyter Notebook	Exploratory analysis
MySQL Workbench	SQL insights & churn analysis
CSV Dataset	Raw + cleaned data
🎯 Project Outcomes

✔ Identified high-risk customer segments
✔ Quantified churn impact on revenue
✔ Revealed service-level churn drivers
✔ Provided actionable retention insights

🤝 Contributions

Feel free to fork the repo and submit pull requests!

⭐ If You Like This Project — Give It a Star!
<p align="center"> <img src="https://img.shields.io/github/stars/Shivangi/telco-churn-analysis?style=social" /> </p>
