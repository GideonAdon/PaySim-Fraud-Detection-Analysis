/* ============================================================
   PROJECT: PaySim Fraud Detection & Transaction Risk Analysis
   FILE: 02_Fraud_Analysis.sql
   PURPOSE: Analyse fraud volume, value, transaction types,
            and time-based fraud patterns
   TOOL: Microsoft SQL Server
   ============================================================ */


/* ============================================================
   1. OVERALL FRAUD RATE
   ============================================================ */

SELECT
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

FROM PaySim;


/* ============================================================
   2. TOTAL FRAUDULENT TRANSACTION AMOUNT
   ============================================================ */

SELECT
    SUM(
        CASE
            WHEN isFraud = 1 THEN amount
            ELSE 0
        END
    ) AS TotalFraudAmount

FROM PaySim;


/* ============================================================
   3. FRAUD BY TRANSACTION TYPE
   ============================================================ */

SELECT
    type,
    COUNT(*) AS FraudTransactions,
    SUM(amount) AS FraudAmount

FROM PaySim

WHERE isFraud = 1

GROUP BY type

ORDER BY FraudTransactions DESC;


/* ============================================================
   4. FRAUD RATE BY TRANSACTION TYPE
   ============================================================ */

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


/* ============================================================
   5. FRAUD TREND BY TRANSACTION STEP
   ============================================================ */

SELECT
    step,
    COUNT(*) AS FraudTransactions,
    SUM(amount) AS FraudAmount

FROM PaySim

WHERE isFraud = 1

GROUP BY step

ORDER BY step;


/* ============================================================
   6. FRAUD ACTIVITY BY HOUR
   ============================================================ */

SELECT
    step % 24 AS HourOfDay,

    COUNT(*) AS FraudTransactions,

    SUM(amount) AS FraudAmount

FROM PaySim

WHERE isFraud = 1

GROUP BY step % 24

ORDER BY HourOfDay;


/* ============================================================
   7. FRAUDULENT TRANSACTION AMOUNT DISTRIBUTION
   ============================================================ */

SELECT
    type,
    COUNT(*) AS FraudTransactions,
    SUM(amount) AS FraudAmount,
    AVG(amount) AS AverageFraudAmount

FROM PaySim

WHERE isFraud = 1

GROUP BY type

ORDER BY FraudAmount DESC;


/* ============================================================
   8. TOP 10 ORIGIN ACCOUNTS BY FRAUD TRANSACTIONS
   ============================================================ */

SELECT TOP 10
    nameOrig AS OriginAccount,
    COUNT(*) AS FraudTransactions,
    SUM(amount) AS FraudAmount

FROM PaySim

WHERE isFraud = 1

GROUP BY nameOrig

ORDER BY FraudTransactions DESC,
         FraudAmount DESC;


/* ============================================================
   9. TOP 10 ORIGIN ACCOUNTS BY FRAUD AMOUNT
   ============================================================ */

SELECT TOP 10
    nameOrig AS OriginAccount,
    COUNT(*) AS FraudTransactions,
    SUM(amount) AS TotalFraudAmount

FROM PaySim

WHERE isFraud = 1

GROUP BY nameOrig

ORDER BY TotalFraudAmount DESC;


/* ============================================================
   10. LARGEST INDIVIDUAL FRAUDULENT TRANSACTIONS
   ============================================================ */

SELECT TOP 20
    step,
    type,
    nameOrig AS OriginAccount,
    nameDest AS DestinationAccount,
    amount

FROM PaySim

WHERE isFraud = 1

ORDER BY amount DESC;


/* ============================================================
   11. HIGH-VALUE FRAUD TRANSACTIONS
   Threshold: ₦1,000,000
   ============================================================ */

SELECT
    COUNT(*) AS HighValueFraudTransactions,
    SUM(amount) AS HighValueFraudAmount,
    AVG(amount) AS AverageHighValueFraudAmount

FROM PaySim

WHERE isFraud = 1
  AND amount >= 1000000;


/* ============================================================
   12. HIGH-VALUE FRAUD BY TRANSACTION TYPE
   ============================================================ */

SELECT
    type,
    COUNT(*) AS HighValueFraudTransactions,
    SUM(amount) AS HighValueFraudAmount

FROM PaySim

WHERE isFraud = 1
  AND amount >= 1000000

GROUP BY type

ORDER BY HighValueFraudAmount DESC;