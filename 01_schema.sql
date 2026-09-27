CREATE DATABASE financial_simulator;
USE financial_simulator;
CREATE TABLE financial_data (
    date DATE,
    user_id INT,
    monthly_income DECIMAL(12,2),
    monthly_expense_total DECIMAL(12,2),
    savings_rate DECIMAL(5,2),
    budget_goal DECIMAL(12,2),
    financial_scenario VARCHAR(50),
    credit_score DECIMAL(5,2),
    debt_to_income_ratio DECIMAL(5,2),
    loan_payment DECIMAL(12,2),
    investment_amount DECIMAL(12,2),
    subscription_services INT,
    emergency_fund DECIMAL(12,2),
    transaction_count INT,
    fraud_flag TINYINT,
    discretionary_spending DECIMAL(12,2),
    essential_spending DECIMAL(12,2),
    income_type VARCHAR(50),
    rent_or_mortgage DECIMAL(12,2),
    category VARCHAR(100),
    cash_flow_status VARCHAR(50),
    financial_advice_score DECIMAL(5,2),
    financial_stress_level VARCHAR(50),
    actual_savings DECIMAL(12,2),
    savings_goal_met TINYINT
);