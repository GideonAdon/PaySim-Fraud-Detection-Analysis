# PaySim-Fraud-Detection-Analysis

## PaySim fraud detection and transaction risk analysis using SQL Server, Power BI, and DAX.

## PaySim Fraud Detection & Transaction Risk Analysis

1. Project Overview

2. Business Problem

3. Objectives

4. Dataset

5. Tools & Technologies

6. Analytical Approach

7. Key Findings

8. Power BI Dashboard

9. Business Recommendations

10. Project Structure

11. Skills Demonstrated

12. Conclusion

# PaySim Fraud Detection & Transaction Risk Analysis

An end-to-end data analytics project focused on identifying fraudulent transaction patterns, quantifying financial exposure, investigating suspicious accounts, and evaluating the effectiveness of an existing fraud-flagging indicator using SQL Server and Power BI.

---

## 📌 Project Overview

Financial transaction platforms process millions of transactions, making it difficult to manually identify suspicious activity and quantify fraud exposure.

This project analyses the PaySim synthetic financial transaction dataset to identify fraud patterns, high-risk transaction types, suspicious accounts, high-value fraudulent transactions, and potential gaps in fraud detection.

The analysis combines **SQL Server for data exploration and investigation** with **Power BI and DAX for interactive reporting and visualization**.

---

## 🎯 Business Problem

The key business challenge is to understand:

- Where fraudulent activity is concentrated
- Which transaction types present the highest fraud risk
- How much financial value is associated with fraudulent activity
- Which accounts appear repeatedly in fraudulent transactions
- When fraudulent activity is most prevalent
- How effectively the existing fraud-flagging indicator identifies actual fraudulent transactions

The goal is to transform transaction-level data into actionable insights that could support fraud monitoring and risk-management decisions.

---

## 🎯 Project Objectives

The analysis was designed to:

1. Measure the overall volume and rate of fraudulent transactions.
2. Quantify the financial value associated with fraud.
3. Identify transaction types with elevated fraud rates.
4. Analyse fraud patterns across simulated transaction time.
5. Identify suspicious origin accounts.
6. Investigate high-value fraudulent transactions.
7. Evaluate the effectiveness of the `isFlaggedFraud` indicator.
8. Build an interactive Power BI dashboard for fraud-risk monitoring.
9. Develop business recommendations based on the analytical findings.

---

## 📊 Dataset

The project uses the **PaySim synthetic financial transaction dataset**.

The dataset contains more than 6.3 million simulated financial transactions.

### Key fields

| Field | Description |
|---|---|
| `step` | Simulated time step |
| `type` | Transaction type |
| `amount` | Transaction amount |
| `nameOrig` | Originating account |
| `nameDest` | Destination account |
| `oldbalanceOrg` | Origin account balance before transaction |
| `newbalanceOrig` | Origin account balance after transaction |
| `oldbalanceDest` | Destination account balance before transaction |
| `newbalanceDest` | Destination account balance after transaction |
| `isFraud` | Ground-truth fraud indicator |
| `isFlaggedFraud` | Existing fraud-flag indicator |

> **Note:** `step` represents simulated time rather than actual calendar dates.

---

## 🛠️ Tools & Technologies

- **SQL Server / SSMS** — Data quality checks, exploratory analysis and fraud investigation
- **Power BI** — Interactive dashboard and data visualization
- **DAX** — KPI calculations and analytical measures
- **Excel** — Supporting data exploration and validation

---

# 🔍 Analytical Approach

## 1. Data Quality Assessment

Initial SQL analysis was performed to establish the quality and structure of the dataset.

The analysis included:

- Total transaction count
- Duplicate record checks
- NULL-value checks
- Transaction-type distribution
- Fraud-label distribution

---

## 2. Fraud Analysis

SQL was used to analyse:

- Overall fraud volume
- Overall fraud rate
- Total fraudulent transaction value
- Fraud by transaction type
- Fraud rate by transaction type
- Fraud activity over simulated time
- Fraud activity by hour
- Average fraudulent transaction value

---

## 3. Account & Transaction Risk Analysis

Further investigation focused on:

- Top origin accounts by fraudulent transaction count
- Top origin accounts by fraudulent transaction value
- Repeated fraudulent accounts
- Largest individual fraudulent transactions
- High-value fraudulent transactions
- Fraud exposure by transaction type

---

## 4. Fraud Detection Effectiveness

The `isFraud` and `isFlaggedFraud` fields were compared to evaluate the performance of the existing fraud-flagging indicator.

The analysis classified transactions as:

- True Positive
- False Positive
- True Negative
- False Negative

Performance was then evaluated using:

- Precision
- Recall
- Missed fraud transactions
- Missed fraud amount

---

# 📈 Key Findings

## 1. Fraud Prevalence

The dataset contains approximately **6.36 million transactions**, of which:

> **8,213 transactions were identified as fraudulent.**

This represents an overall fraud rate of approximately:

> **0.129%**

Although fraud represents a small proportion of total transaction volume, the associated financial exposure is significant.

---

## 2. Fraud Financial Exposure

The total value associated with fraudulent transactions was approximately:

> **₦12.06 billion**

This demonstrates that analysing fraud solely by transaction count can understate its financial impact.

---

## 3. Highest-Risk Transaction Types

Among the transaction types analysed:

- **TRANSFER** recorded the highest observed fraud rate at approximately **0.769%**
- **CASH_OUT** followed with approximately **0.184%**

This suggests that transaction type can be an important factor when prioritising fraud monitoring.

---

## 4. Fraud Detection Performance

The comparison between `isFraud` and `isFlaggedFraud` produced the following results:

| Metric | Result |
|---|---:|
| Actual fraudulent transactions | 8,213 |
| True positives | 16 |
| False negatives | 8,197 |
| False positives | 0 |
| Precision | 100% |
| Recall | ~0.195% |

The fraud-flagging indicator demonstrated **100% precision**, meaning every transaction flagged by the indicator was actually labelled fraudulent in the dataset.

However, its recall was only approximately **0.195%**, meaning it identified only a very small proportion of the fraudulent transactions.

---

## 5. Missed Fraud Exposure

The analysis identified:

> **8,197 fraudulent transactions that were not flagged.**

These transactions represented approximately:

> **₦11.98 billion**

in fraudulent transaction value.

This represents:

> **99.35% of the total fraudulent transaction amount.**

### Key Insight

The `isFlaggedFraud` indicator was highly precise but extremely selective within the PaySim dataset.

In other words:

> **When the indicator raised an alert, it was correct, but it captured very little of the overall fraudulent activity.**

---

# 📊 Power BI Dashboard

The Power BI dashboard was developed to provide an interactive view of fraud activity and transaction risk.

### Dashboard capabilities

The dashboard allows users to explore:

- Total transactions
- Fraud transactions
- Fraud amount
- Fraud rate
- Fraud by transaction type
- Fraud activity over time
- Fraud activity by hour
- Suspicious accounts
- High-value transactions
- Fraud status
- Transaction-time patterns

### Dashboard Preview

![PaySim Fraud Detection Dashboard](https://github.com/GideonAdon/PaySim-Fraud-Detection-Analysis/blob/main/Dashboard.png)

---

# 💡 Business Recommendations

Based on the analysis, the following recommendations were developed.

### 1. Prioritize Transfer Transactions

Transfer transactions recorded the highest observed fraud rate and should receive enhanced monitoring and risk assessment.

### 2. Strengthen Monitoring of High-Value Transactions

Large-value transactions should receive additional risk checks, particularly when combined with other suspicious behavioural indicators.

### 3. Monitor Repeatedly Suspicious Accounts

Accounts that repeatedly appear in fraudulent transactions should be prioritised for enhanced monitoring and investigation.

### 4. Improve Fraud Detection Coverage

The very low recall observed for `isFlaggedFraud` suggests that additional detection rules or risk signals could be explored.

### 5. Adopt Multi-Factor Risk Detection

Fraud monitoring could combine multiple signals, including:

- Transaction type
- Transaction amount
- Account history
- Transaction frequency
- Time of transaction
- Previous suspicious activity

A multi-factor approach could potentially improve fraud detection coverage while maintaining appropriate precision.

---

# 🧮 Example SQL Analysis

The project includes SQL scripts covering data quality, fraud analysis, account investigation and detection effectiveness.

Example:

```sql
SELECT
    type,
    COUNT(*) AS TotalTransactions,
    SUM(
        CASE
            WHEN isFraud = 1 THEN 1
            ELSE 0
        END
    ) AS FraudTransactions,
    CAST(
        SUM(
            CASE
                WHEN isFraud = 1 THEN 1
                ELSE 0
            END
        ) * 100.0 / COUNT(*)
        AS DECIMAL(10,3)
    ) AS FraudRate
FROM PaySim
GROUP BY type
ORDER BY FraudRate DESC;
```

## 11. Skills Demonstrated

This project demonstrates:

### SQL

- SELECT

- CASE

- GROUP BY

- HAVING

- Aggregate functions

- Conditional aggregation

- CTE-style analytical thinking

- Fraud detection metrics

### Power BI

- Data modelling

- DAX

- KPI development

- Interactive slicers

- Data visualization

- Dashboard design

## Analytics

- Fraud analysis

- Risk analysis

- Trend analysis

- Account-level investigation

- Precision/recall interpretation

- Business recommendations


## 12. Conclusion

This project demonstrates an end-to-end approach to fraud analytics, combining SQL-based investigation with interactive Power BI visualization. The analysis identified significant fraudulent transaction exposure and highlighted a substantial gap between fraud detection precision and recall within the PaySim dataset.
