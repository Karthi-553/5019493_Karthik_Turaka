-- Exercise 3: Stored Procedures

-- Scenario 1: The bank needs to process monthly interest for all savings accounts.
-- Question: Write a stored procedure ProcessMonthlyInterest that calculates and 
-- updates the balance of all savings accounts by applying an interest rate of 1% to the current balance.
CREATE OR REPLACE PROCEDURE ProcessMonthlyInterest IS
BEGIN
    UPDATE Accounts
    SET Balance = Balance + (Balance * 0.01),
        LastModified = SYSDATE
    WHERE AccountType = 'Savings';
END ProcessMonthlyInterest;
-- Scenario 2: The bank wants to implement a bonus scheme for employees based on their performance.
-- 	Question: Write a stored procedure UpdateEmployeeBonus that updates the salary of employees in a given department by 
-- adding a bonus percentage passed as a parameter
CREATE OR REPLACE PROCEDURE UpdateEmployeeBonus(
    p_Department IN VARCHAR2,
    p_BonusPercentage IN NUMBER
) IS
BEGIN
    UPDATE Employees
    SET Salary = Salary + (Salary * p_BonusPercentage / 100)
    WHERE Department = p_Department;
END UpdateEmployeeBonus;

-- Scenario 3: Customers should be able to transfer funds between their accounts.
-- Question: Write a stored procedure TransferFunds that transfers a specified amount from one account to another, 
-- checking that the source account has sufficient balance before making the transfer.

CREATE OR REPLACE PROCEDURE TransferFunds(
    p_FromAccountID IN NUMBER,
    p_ToAccountID IN NUMBER,
    p_Amount IN NUMBER
) IS
    v_FromBalance NUMBER;
BEGIN
    SELECT Balance INTO v_FromBalance
    FROM Accounts
    WHERE AccountID = p_FromAccountID;
    IF v_FromBalance >= p_Amount THEN
        UPDATE Accounts
        SET Balance = Balance - p_Amount,
            LastModified = SYSDATE
        WHERE AccountID = p_FromAccountID;
        UPDATE Accounts
        SET Balance = Balance + p_Amount,
            LastModified = SYSDATE
        WHERE AccountID = p_ToAccountID;
        INSERT INTO Transactions (TransactionID, AccountID, TransactionDate, Amount, TransactionType)
        VALUES (TransactionSeq.NEXTVAL, p_FromAccountID, SYSDATE, p_Amount, 'Transfer Out');
        INSERT INTO Transactions (TransactionID, AccountID, TransactionDate, Amount, TransactionType)
        VALUES (TransactionSeq.NEXTVAL, p_ToAccountID, SYSDATE, p_Amount, 'Transfer In');
    ELSE
        
        RAISE_APPLICATION_ERROR(-20001, 'Insufficient funds in the source account.');
    END IF;
END TransferFunds;




