USE financial_simulator;

-- 1. Financial Performance Analysis

-- 1. total income generated across all records

SELECT ROUND(SUM(monthly_income),0) as total_income
FROM financial_data;

-- 2. the total expenditure across all records

SELECT ROUND(SUM(monthly_expense_total),0) as total_expenditure
FROM financial_data;

-- 3. the total actual savings generated across all records

SELECT ROUND(SUM(actual_savings),0) as total_actual_savings
FROM financial_data;

-- 4. the average monthly income, expenditure, and savings

SELECT ROUND(AVG(monthly_income),2) as avg_monthly_income,
ROUND(AVG(monthly_expense_total),2) as avg_expenditure,
ROUND(AVG(actual_savings),2) as avg_savings
FROM financial_data;

-- 5. overall average savings rate

SELECT ROUND(AVG(savings_rate),2) as avg_savings_rate
FROM financial_data;

-- 6. unique users are represented in the data

SELECT COUNT(DISTINCT user_id) as unique_users
FROM financial_data

-- 2. Expense Analysis

-- 7. total expenditure by spending category

SELECT 
category,
SUM(monthly_expense_total) as total_expenditure
FROM financial_data
GROUP BY category;

-- 8. spending category has the highest total expenditure

SELECT category,
SUM(monthly_expense_total) as total_expenditure
FROM financial_data
GROUP BY category
ORDER BY total_expenditure DESC
LIMIT 1;

-- 9. percentage of total expenditure is contributed by each spending category

SELECT
    category,
    ROUND(SUM(monthly_expense_total), 2) AS total_expenditure,
    ROUND(
        SUM(monthly_expense_total) /
        (SELECT SUM(monthly_expense_total)
         FROM financial_data) * 100,
        2
    ) AS expenditure_percentage
FROM financial_data
GROUP BY category
ORDER BY expenditure_percentage DESC;

-- 10. the average essential and discretionary expenditures
 
 SELECT ROUND(AVG(essential_spending),2) as avg_essential_spending,
 ROUND(AVG(discretionary_spending),2) as avg_discretionary_spending
 FROM financial_data;

-- 11. spending categories contribute most significantly to discretionary spending

SELECT category, SUM(discretionary_spending) as total_discretionary_spending
FROM financial_data
GROUP BY category
ORDER BY total_discretionary_spending DESC
LIMIT 1;

-- 12. expenditure vary across different financial scenarios

SELECT financial_scenario, SUM(monthly_expense_total) as total_expenditure
FROM financial_data
GROUP BY financial_scenario
ORDER BY total_expenditure DESC;

-- 3. Savings Analysis
  
-- 13. average savings vary across financial scenarios

SELECT financial_scenario, ROUND(AVG(actual_savings),2) as avg_savings
FROM financial_data
GROUP BY financial_scenario
ORDER BY avg_savings DESC;

-- 14. financial scenario has the lowest average savings?

SELECT financial_scenario, ROUND(AVG(actual_savings),2) as avg_savings
FROM financial_data
GROUP BY financial_scenario
ORDER BY avg_savings
LIMIT 1;

-- 15. average savings rate vary across financial scenarios

SELECT financial_scenario, ROUND(AVG(savings_rate),2) as avg_savings_rate
FROM financial_data
GROUP BY financial_scenario
ORDER BY avg_savings_rate DESC;

-- 16. income type has the highest average savings

SELECT income_type, ROUND(AVG(actual_savings),2) as avg_savings
FROM financial_data
GROUP BY income_type
ORDER BY avg_savings DESC
LIMIT 1;

-- 17. savings performance differ across income types?

SELECT income_type, ROUND(AVG(actual_savings),2) as avg_savings
FROM financial_data
GROUP BY income_type
ORDER BY avg_savings DESC;

-- 18. proportion of records successfully met their savings goal?

SELECT
    SUM(savings_goal_met) AS goal_met_records,
    COUNT(*) AS total_records,
    ROUND(
        SUM(savings_goal_met) / COUNT(*) * 100,
        2
    ) AS savings_goal_met_percentage
FROM financial_data;

-- 4.Financial Health Analysis

-- 19. the distribution of records across financial stress levels

SELECT financial_stress_level, COUNT(*) AS total_records
FROM financial_data
GROUP BY financial_stress_level
ORDER BY total_records DESC;

-- 20. average income, expenditure, and savings differ across financial stress levels

SELECT financial_stress_level, ROUND(AVG(monthly_income),2) as avg_monthly_income,
ROUND(AVG(monthly_expense_total),2) as avg_monthly_expenditure,
ROUND(AVG(actual_savings),2) as avg_savings
FROM financial_data
GROUP BY financial_stress_level;

-- 21. average debt-to-income ratio for each financial stress level

SELECT financial_stress_level, ROUND(AVG(debt_to_income_ratio),2) as avg_debt_to_income
FROM financial_data
GROUP BY financial_stress_level
ORDER BY avg_debt_to_income DESC;

-- 22. financial stress vary across different income types

SELECT
    income_type,
    financial_stress_level,
    COUNT(*) AS record_count
FROM financial_data
GROUP BY
    income_type,
    financial_stress_level
ORDER BY
    income_type,
    record_count DESC;
    
    
-- 23. relationship between savings goal achievement and financial stress level

SELECT
    financial_stress_level,
    savings_goal_met,
    COUNT(*) AS record_count
FROM financial_data
GROUP BY
    financial_stress_level,
    savings_goal_met
ORDER BY
    financial_stress_level,
    savings_goal_met;
    
-- 24. financial scenario has the highest proportion of high-stress records

SELECT
    financial_scenario,
    SUM(financial_stress_level = 'High') AS high_stress_records,
    COUNT(*) AS total_records,
    ROUND(
        SUM(financial_stress_level = 'High') / COUNT(*) * 100,
        2
    ) AS high_stress_percentage
FROM financial_data
GROUP BY financial_scenario
ORDER BY high_stress_percentage DESC
LIMIT 1;


