
# What-If Financial Simulator – Finance Analytics Dashboard

## Introduction

An end-to-end financial analytics project built using **MySQL, SQL, Power BI, DAX, and What-If Parameters** to analyze income, expenses, savings, investments, financial goals, and simulate different financial scenarios.

---

## Business Problem

Financial data contains information about income, expenses, savings, investments, financial stress, and goals, but raw data makes it difficult to identify important financial patterns and understand the impact of financial decisions.

This project addresses key questions such as:

- How much income, expenditure, and savings are generated?
- Which expense categories contribute the most to spending?
- How do savings vary across financial scenarios and income types?
- How does financial stress relate to financial goals?
- What happens to savings when income or expenses change?

---

## Dashboard Goal

The goal is to build an interactive dashboard that helps users:

- Monitor financial performance
- Analyze income and spending patterns
- Track savings and investments
- Understand financial goal achievement
- Compare financial scenarios
- Simulate changes in income, expenses, and investments

---

## SQL Analysis

The SQL workflow is divided into four stages:

### 1. Schema Creation
`01_schema.sql`

Creates the MySQL database and `financial_data` table.

### 2. Data Validation
`02_data_validation.sql`

Includes **22+ validation checks** for:

- NULL values
- Duplicate records
- Negative financial values
- Savings rate
- Credit score
- Financial scenarios
- Stress levels
- Income types
- Categories
- Date range
- Data consistency

### 3. Data Cleaning
`03_data_cleaning.sql`

The raw dataset was preserved after validation because no major data-quality issues required destructive cleaning.

### 4. Business Analysis
`04_business_analysis.sql`

Contains **24 SQL business questions** covering:

- Financial performance
- Spending analysis
- Savings analysis
- Income-type analysis
- Financial scenarios
- Financial stress
- Goal achievement

---

## Key Visuals

### Financial Overview
- Total Income
- Total Expenditure
- Total Savings
- Total Investment
- Income vs Expenditure Trend
- Expenditure by Category

### Income & Expense Analysis
- Average Income
- Average Expenditure
- Average Savings
- Expense-to-Income %
- Monthly Income vs Expenditure
- Expenditure by Category
- Expenditure by Financial Scenario
- Essential vs Discretionary Spending
- Income by Income Type

### Savings & Investment
- Total Savings
- Total Investment
- Savings Rate
- Investment Rate
- Savings vs Investment Trend
- Savings by Category
- Investment by Category

### Financial Goals
- Completed Goals
- Goal Achievement %
- Goal Progress
- Goals by Financial Stress
- Goal Achievement by Income Type

### What-If Simulator
- Simulated Income
- Simulated Expense
- Simulated Savings
- Simulated Investment
- Simulated Savings Rate
- Income Impact %
- Expense Impact %
- Savings Impact %
- Investment Impact %

---

## Key Highlights

- **3,000 financial records**
- **25 columns**
- **944 unique users**
- **22+ SQL validation checks**
- **24 business-analysis questions**
- MySQL database
- Power BI dashboard
- DAX-based KPIs
- Financial scenario analysis
- What-If simulation

---

## Key Insights

- Total Income: **₹12.01M**
- Total Expenditure: **₹9.04M**
- Total Actual Savings: **₹3.47M**
- Average Savings: **₹1,156.42**
- Average Savings Rate: **23%**
- Insurance is the highest expenditure category at **₹985,392.73**
- Goal achievement rate is **9.23%**
- High financial stress records: **593**
- Average savings are **₹1,176.39 in Normal**, **₹1,140.06 in Inflation**, and **₹1,117.07 in Recession**
- Mixed income records have the highest average savings at **₹1,212.74**

---

## Business Impact

The dashboard helps users:

- Identify major spending areas
- Monitor financial performance
- Understand savings behavior
- Analyze financial stress
- Track goal achievement
- Compare financial scenarios
- Test hypothetical financial changes
- Understand the potential impact of financial decisions

The **What-If Simulator** adds a scenario-analysis layer that allows users to evaluate changes before making financial decisions.

---
## Dataset

**Kaggle Data:** [Dataset](https://www.kaggle.com/datasets/khushikyad001/personal-finance-tracker-dataset/versions/1)

---

## Dashboard Preview

### Financial Overview

![Financial Overview](Financial%20Overview.png)

### Income & Expense Analysis

![Income & Expense Analysis](Income%20%26%20Expense%20Analysis.png)

### Savings & Investment

![Savings & Investment](Savings%20%26%20Investment.png)

### Financial Goals

![Financial Goals](Financial%20Goals.png)

### What-If Simulator

![What-If Simulator](What-If%20Simulator.png)

---

## Author

**Ansh Sharma**

Aspiring Data Analyst | SQL | Power BI | Python | Excel

GitHub: https://github.com/anshanalytics
