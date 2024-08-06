-- Exercise 4: Functions

-- Scenario 1: Calculate the age of customers for eligibility checks.
-- 	Question: Write a function CalculateAge that takes a customer's date of birth as input and returns their age in years.
CREATE OR REPLACE FUNCTION CalculateAge(
    birth_date IN DATE
) RETURN NUMBER AS
    current_date DATE;
    age NUMBER;
BEGIN
    current_date := SYSTIMESTAMP;
    age := FLOOR(MONTHS_BETWEEN(current_date, birth_date) / 12);
    RETURN age;
END CalculateAge;
-- Scenario 2: The bank needs to compute the monthly installment for a loan.
-- 	Question: Write a function CalculateMonthlyInstallment that takes the loan amount, interest rate, and loan duration in years as input and returns the monthly installment amount.
CREATE OR REPLACE FUNCTION CalculateMonthlyInstallment(
    loan_amount IN NUMBER,
    interest_rate IN NUMBER,
    loan_duration IN NUMBER
) RETURN NUMBER AS
    monthly_installment NUMBER;
BEGIN
    monthly_installment := loan_amount * (interest_rate / 1200) * POWER(1 + interest_rate / 1200, loan_duration * 12) / (POWER(1 + interest_rate / 1200, loan_duration * 12) - 1);
    RETURN monthly_installment;
END CalculateMonthlyInstallment;
-- Scenario 3: Check if a customer has sufficient balance before making a transaction.
-- 	Question: Write a function HasSufficientBalance that takes an account ID and an amount as input and returns a boolean indicating whether the account has at least the specified amount.
CREATE OR REPLACE FUNCTION HasSufficientBalance(
    account_id IN NUMBER,
    amount IN NUMBER
) RETURN BOOLEAN AS
    account_balance NUMBER;
BEGIN
    SELECT Balance INTO account_balance FROM Accounts WHERE AccountID = account_id;
    RETURN account_balance >= amount;
END HasSufficientBalance;