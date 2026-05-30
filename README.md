# Kimia-Farma-Performance-Analytics
# Performance Intelligence: Decoding Kimia Farma’s Business Performance (2020–2023)

![BigQuery](https://img.shields.io/badge/BigQuery-003566?style=for-the-badge&logo=googlecloud&logoColor=white)
![Looker Studio](https://img.shields.io/badge/Looker_Studio-4285F4?style=for-the-badge&logo=googledrive&logoColor=white)
![SQL](https://img.shields.io/badge/SQL-005f85?style=for-the-badge&logo=postgresql&logoColor=white)

An End-to-End Big Data Analytics project transforming raw corporate transactional data into automated, row-level financial metrics and dynamic performance intelligence for PT Kimia Farma Tbk.

---

## 📌 Project Overview
This project focuses on ingestion, data cleansing, and structural transformation of over 670,000 transaction records spanning from 2020 to 2023. By leveraging **Google BigQuery**, all complex business and financial calculations were centralized at the database layer to optimize data pipeline performance and ensure 100% logic consistency before visualization in **Looker Studio**.

## 🛠️ Tech Stack & Architecture
* **Data Warehouse & ETL Engine:** Google BigQuery (SQL)
* **Business Intelligence Tool:** Google Looker Studio
* **Core Methodology:** Dimensional Modeling (Star Schema connection via `LEFT JOIN` mapping facts to branch and product dimensions).

---

## 🧮 Core SQL Transformation Logic
The transformation layer automated key performance indicators directly at the row level, significantly reducing the processing load on the visualization layer.

### 1. Financial Metrics Automation
* **`nett_sales`**: Calculated dynamically by deducting variable discount rates from the base price.
* **`nett_profit`**: Formulated using nested mathematical logic, multiplying the derived `nett_sales` with conditional profit margins.

### 2. Dynamic Margin Tiering (`CASE WHEN`)
Profit percentages (10% to 30%) are assigned automatically based on product price thresholds:
```sql
((t.price * (1 - (t.discount_percentage / 100))) * CASE 
    WHEN t.price <= 50000 THEN 0.10
    WHEN t.price > 50000 AND t.price <= 100000 THEN 0.15
    WHEN t.price > 100000 AND t.price <= 300000 THEN 0.20
    WHEN t.price > 300000 AND t.price <= 500000 THEN 0.25
    ELSE 0.30
END) AS nett_profit
