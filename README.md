# 📊 Kimia Farma Performance Analytics (2020–2023)
# Performance Intelligence: Decoding Kimia Farma’s Business Performance (2020–2023)

## Transforming 670K+ Healthcare Transactions into Actionable Business Intelligence

![BigQuery](https://img.shields.io/badge/BigQuery-003566?style=for-the-badge&logo=googlecloud&logoColor=white)
![Looker Studio](https://img.shields.io/badge/Looker_Studio-4285F4?style=for-the-badge&logo=googledrive&logoColor=white)
![SQL](https://img.shields.io/badge/SQL-005f85?style=for-the-badge&logo=postgresql&logoColor=white)

---

## 🚀 Project Overview

This project analyzes the business performance of **PT Kimia Farma Tbk** from **2020 to 2023** by transforming fragmented operational datasets into a centralized analytics platform.

Using **Google BigQuery** as the data warehouse and **Looker Studio** as the business intelligence layer, more than **670,000 transaction records** were processed and transformed into business-ready metrics. The resulting dashboard enables stakeholders to monitor revenue, profitability, branch performance, customer satisfaction, and regional business trends through a single source of truth.

This project simulates an end-to-end Business Intelligence workflow covering:

- Data ingestion
- Data modeling
- SQL transformation
- KPI automation
- Dashboard development
- Business insight generation

---

## 📊 Interactive Dashboard Preview

<p align="center">
  <a href="https://datastudio.google.com/reporting/d1b6ef47-5646-4431-be81-304f725fecae/page/57UzF">
    <img src="https://raw.githubusercontent.com/zfrhadis10/Kimia-Farma-Performance-Analytics/main/images/Dashboard%20Preview.jpg" alt="Kimia Farma Dashboard" width="100%">
  </a>
</p>

<p align="center">
  <a href="https://datastudio.google.com/reporting/d1b6ef47-5646-4431-be81-304f725fecae/page/57UzF">
    <img src="https://img.shields.io/badge/View-Looker_Studio_Dashboard-4285F4?style=for-the-badge&logo=googleanalytics&logoColor=white">
  </a>
</p>

<p align="center">
  <b>Click the dashboard preview above to explore the interactive report.</b>
</p>

---

## 🎯 Business Problem

Kimia Farma's operational data was distributed across multiple datasets, including:

- Sales transactions
- Product catalogs
- Branch information
- Inventory records

Without a centralized reporting layer, extracting business insights required repetitive manual calculations and fragmented analysis.

The objective was to build a scalable analytics solution capable of:

- Automating financial calculations
- Monitoring branch performance
- Evaluating customer satisfaction
- Identifying revenue opportunities
- Supporting data-driven decision making

---

## 🏗️ Solution Architecture

```text
Raw CSV Files
│
├── kf_transaction
├── kf_product
├── kf_kantor_cabang
└── kf_inventory
        │
        ▼
Google BigQuery
(Data Warehouse)
        │
        ▼
SQL Transformation Layer
- Data Integration
- KPI Calculation
- Profit Margin Logic
- Business Metrics
        │
        ▼
Analysis Table
(tabel_analisa)
        │
        ▼
Google Looker Studio
Interactive Dashboard
```

---

## 🛠️ Tech Stack

| Category | Technology |
|-----------|-----------|
| Data Warehouse | Google BigQuery |
| Query Language | SQL |
| Data Modeling | Star Schema |
| Data Visualization | Looker Studio |
| Version Control | GitHub |

---

## 📂 Dataset Overview

The analysis integrates four operational datasets:

| Dataset | Description |
|----------|------------|
| `kf_final_transaction` | Daily transaction records |
| `kf_product` | Product catalog and pricing |
| `kf_kantor_cabang` | Branch information and ratings |
| `kf_inventory` | Product stock availability |

---

## ⚙️ Data Transformation Process

### 1. Data Integration

Multiple datasets were consolidated into a centralized analysis table using SQL joins.

```sql
LEFT JOIN kantor_cabang kc
    ON t.branch_id = kc.branch_id

LEFT JOIN product p
    ON t.product_id = p.product_id
```

### 2. Automated Financial Metrics

#### Net Sales Calculation

```sql
price * (1 - discount_percentage / 100)
```

#### Dynamic Profit Margin Assignment

Profit percentages are assigned automatically based on product price tiers.

```sql
CASE
    WHEN price <= 50000 THEN 0.10
    WHEN price <= 100000 THEN 0.15
    WHEN price <= 300000 THEN 0.20
    WHEN price <= 500000 THEN 0.25
    ELSE 0.30
END
```

#### Net Profit Calculation

```sql
(price * (1 - discount_percentage / 100))
*
CASE
    WHEN price <= 50000 THEN 0.10
    WHEN price <= 100000 THEN 0.15
    WHEN price <= 300000 THEN 0.20
    WHEN price <= 500000 THEN 0.25
    ELSE 0.30
END
```

This approach ensures consistent business logic across all transaction records while minimizing calculations in the dashboard layer.

---

## 📈 Dashboard Features

### Executive Summary

- Total Revenue
- Total Net Profit
- Total Transactions
- Average Customer Rating

### Business Performance Analysis

- Revenue Trend Analysis (2020–2023)
- Monthly Profit Trend
- Year-over-Year Comparison
- Regional Revenue Distribution

### Branch Performance Monitoring

- Top Provinces by Transactions
- Top Provinces by Net Sales
- Branch Rating vs Transaction Rating Analysis

### Geographic Intelligence

- Province-Level Profit Distribution
- Interactive Geo Map Visualization

### Interactive Controls

- Province Filter
- Branch Filter
- Year Filter

---

## 🔍 Key Insights

### Revenue Concentration

- West Java generated the highest transaction volume with approximately **150,000 transactions**
- Contributed roughly **Rp107 Billion** in revenue

### Seasonal Profit Pattern

Profit demonstrated recurring seasonality:

- Peak periods: March and September
- Lowest periods: January and May–July

### Customer Satisfaction Gap

Several branches achieved perfect internal branch ratings (**5.0**) while receiving relatively lower customer transaction ratings (~**4.0**), indicating potential service quality inconsistencies.

---

## 💡 Strategic Recommendations

### Replicate High-Performing Strategies

Apply successful operational and marketing practices from West Java to other high-potential regions such as:

- North Sumatra
- Central Java

### Mitigate Seasonal Revenue Declines

Launch targeted promotional campaigns during:

- December–January
- April–May

to stabilize cash flow and reduce predictable revenue drops.

### Improve Service Quality

Conduct operational audits on branches exhibiting significant discrepancies between internal ratings and customer satisfaction metrics.

---

## 📁 Repository Structure

```text
Kimia-Farma-Performance-Analytics/
│
├── BigQuery_Syntax.sql
├── images/
│   └── Dashboard Preview.jpg
│
├── Documentation/
│   └── FinalTask_KimiaFarma_BDA.pdf
│
└── README.md
```

---

## 🔗 Project Resources

📊 **Interactive Dashboard**  
https://datastudio.google.com/reporting/d1b6ef47-5646-4431-be81-304f725fecae/page/57UzF

💻 **SQL Script**  
[BigQuery Syntax](BigQuery_Syntax.sql)

---

## 👤 Author

**Zafirah Aida Adista**

Aspiring Data Analyst | Data Analytics Graduate

📧 zafirah.adistaa@gmail.com

🔗 Linkedin : https://www.linkedin.com/in/zafirah-aida-adista-162ab8379/

---
