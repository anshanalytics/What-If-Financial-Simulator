USE financial_simulator;

-- 1. Check total number of records
-- Purpose: Verify that all 3,000 records were imported successfully.

SELECT COUNT(*) AS total_rows
FROM financial_data;

-- 2. Check exact duplicate rows
-- Purpose: Identify completely identical records.

SELECT COUNT(*) AS exact_duplicate_rows
FROM (
    SELECT *,
           COUNT(*) OVER (
               PARTITION BY
                   date,
                   user_id,
                   monthly_income,
                   monthly_expense_total,
                   savings_rate,
                   budget_goal,
                   financial_scenario,
                   credit_score,
                   debt_to_income_ratio,
                   loan_payment,
                   investment_amount,
                   subscription_services,
                   emergency_fund,
                   transaction_count,
                   fraud_flag,
                   discretionary_spending,
                   essential_spending,
                   income_type,
                   rent_or_mortgage,
                   category,
                   cash_flow_status,
                   financial_advice_score,
                   financial_stress_level,
                   actual_savings,
                   savings_goal_met
           ) AS row_count
    FROM financial_data
) AS duplicate_check
WHERE row_count > 1;



-- 3. Check NULL values in important columns
-- Purpose: Identify missing values in key financial fields.


SELECT
    SUM(user_id IS NULL) AS missing_user_id,
    SUM(date IS NULL) AS missing_date,
    SUM(monthly_income IS NULL) AS missing_income,
    SUM(monthly_expense_total IS NULL) AS missing_expense,
    SUM(actual_savings IS NULL) AS missing_savings,
    SUM(investment_amount IS NULL) AS missing_investment
FROM financial_data;


-- 4. Check negative income
-- Purpose: Identify invalid negative income values.
SELECT *
FROM financial_data
WHERE monthly_income < 0;


-- 5. Check negative expenses
-- Purpose: Identify invalid negative expense values.
SELECT *
FROM financial_data
WHERE monthly_expense_total < 0;


-- 6. Check negative investment amounts
-- Purpose: Identify invalid negative investment values.
SELECT *
FROM financial_data
WHERE investment_amount < 0;


-- 7. Check negative loan payments
-- Purpose: Identify invalid negative loan payment values.
SELECT *
FROM financial_data
WHERE loan_payment < 0;


-- 8. Check savings rate range
-- Purpose: Identify savings rate values outside the expected 0–100% range.
SELECT *
FROM financial_data
WHERE savings_rate < 0
   OR savings_rate > 100;


-- 9. Check credit score range
-- Purpose: Identify credit scores outside the standard 300–850 range.

SELECT *
FROM financial_data
WHERE credit_score < 300
   OR credit_score > 850;


-- 10. Check financial scenarios
-- Purpose: Identify all financial scenarios available in the dataset.

SELECT
    financial_scenario,
    COUNT(*) AS record_count
FROM financial_data
GROUP BY financial_scenario;


-- 11. Check financial stress levels
-- Purpose: Identify all financial stress categories in the dataset.

SELECT
    financial_stress_level,
    COUNT(*) AS record_count
FROM financial_data
GROUP BY financial_stress_level;


-- 12. Check income types
-- Purpose: Identify all income types available in the dataset.

SELECT
    income_type,
    COUNT(*) AS record_count
FROM financial_data
GROUP BY income_type;


-- 13. Check spending categories
-- Purpose: Identify all spending categories available in the dataset.

SELECT
    category,
    COUNT(*) AS record_count
FROM financial_data
GROUP BY category;


-- 14. Check date range
-- Purpose: Verify the minimum and maximum dates in the dataset.

SELECT
    MIN(date) AS earliest_date,
    MAX(date) AS latest_date
FROM financial_data;


-- 15. Validate actual savings calculation
-- Purpose: Verify that actual_savings follows the dataset logic:
-- MAX(monthly_income - monthly_expense_total, 0).

SELECT
    user_id,
    date,
    monthly_income,
    monthly_expense_total,
    actual_savings,
    GREATEST(
        monthly_income - monthly_expense_total,
        0
    ) AS expected_actual_savings
FROM financial_data
WHERE actual_savings <>
      GREATEST(
          monthly_income - monthly_expense_total,
          0
      );


-- 16. Check repeated user-date combinations
-- Purpose: Identify users having multiple records on the same date.
-- These records are retained because they contain different financial values.

SELECT
    user_id,
    date,
    COUNT(*) AS record_count
FROM financial_data
GROUP BY user_id, date
HAVING COUNT(*) > 1
ORDER BY record_count DESC;


-- 17. Validate expense components
-- Purpose: Check whether essential and discretionary spending
-- together explain the total expense.

SELECT
    user_id,
    date,
    monthly_expense_total,
    essential_spending,
    discretionary_spending,
    (essential_spending + discretionary_spending) AS calculated_expense
FROM financial_data
WHERE ABS(
    monthly_expense_total -
    (essential_spending + discretionary_spending)
) > 0.01;


-- 18. Validate savings goal status
-- Purpose: Ensure savings_goal_met contains only valid binary values.

SELECT DISTINCT
    savings_goal_met
FROM financial_data
ORDER BY savings_goal_met;


-- 19. Validate fraud flag
-- Purpose: Ensure fraud_flag contains only valid binary values.

SELECT DISTINCT
    fraud_flag
FROM financial_data
ORDER BY fraud_flag;

-- 20. Validate emergency fund
-- Purpose: Identify invalid negative emergency fund values.

SELECT *
FROM financial_data
WHERE emergency_fund < 0;


-- 21. Validate debt-to-income ratio
-- Purpose: Identify invalid negative DTI values.

SELECT *
FROM financial_data
WHERE debt_to_income_ratio < 0;

-- 22. Validate spending components
-- Purpose: Ensure essential and discretionary spending
-- do not contain negative values.

SELECT *
FROM financial_data
WHERE essential_spending < 0
   OR discretionary_spending < 0;
