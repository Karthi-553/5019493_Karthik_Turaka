
-- Exercise 5: Triggers

-- Scenario 1: Automatically update the last modified date when a customer's record is updated.
-- o	Question: Write a trigger UpdateCustomerLastModified that updates the LastModified column of the Customers table to the current date whenever a customer's record is updated.
CREATE OR REPLACE TRIGGER UpdateCustomerLastModified
BEFORE UPDATE ON Customers
FOR EACH ROW
BEGIN
    :NEW.LastModified := SYSTIMESTAMP;
END UpdateCustomerLastModified;
-- Scenario 2: Maintain an audit log for all transactions.
-- o	Question: Write a trigger LogTransaction that inserts a record into an AuditLog table whenever a transaction is inserted into the Transactions table.
CREATE OR REPLACE TRIGGER LogTransaction
AFTER INSERT ON Transactions
FOR EACH ROW
BEGIN
    INSERT INTO AuditLog (TransactionID, TransactionType, Amount, LogDate)
    VALUES (:NEW.TransactionID, :NEW.TransactionType, :NEW.Amount, SYSTIMESTAMP);
END LogTransaction;
-- Scenario 3: Enforce business rules on deposits and withdrawals.
-- o	Question: Write a trigger CheckTransactionRules that ensures withdrawals do not exceed the balance and deposits are positive before inserting a record into the Transactions table.
CREATE OR REPLACE TRIGGER CheckTransactionRules
BEFORE INSERT ON Transactions
FOR EACH ROW
BEGIN
    IF :NEW.TransactionType = 'Withdrawal' THEN
        IF :NEW.Amount > (SELECT Balance FROM Accounts WHERE AccountID = :NEW.AccountID) THEN
            RAISE_APPLICATION_ERROR(-20001, 'Withdrawal amount exceeds balance');
        END IF;
    ELSIF :NEW.TransactionType = 'Deposit' THEN
        IF :NEW.Amount <= 0 THEN
            RAISE_APPLICATION_ERROR(-20002, 'Deposit amount must be positive');
        END IF;
    END IF;
END CheckTransactionRules;