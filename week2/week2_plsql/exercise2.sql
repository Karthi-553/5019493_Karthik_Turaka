-- Exercise 2: Error Handling

-- Scenario 1: Handle exceptions during fund transfers between accounts.
-- 	Question: Write a stored procedure SafeTransferFunds that transfers funds between two accounts. 
-- Ensure that if any error occurs (e.g., insufficient funds), an appropriate error message is logged 
-- and the transaction is rolled back.
CREATE OR REPLACE PROCEDURE AddNewCustomer(
    customer_id IN NUMBER,
    name IN VARCHAR2,
    email IN VARCHAR2
) AS
    duplicate_customer EXCEPTION;
    PRAGMA EXCEPTION_INIT(duplicate_customer, -20007);
BEGIN
    BEGIN
        INSERT INTO Customers (CustomerID, Name, Email)  -- Assuming Email is the correct column name
        VALUES (customer_id, name, email);

        COMMIT;

    EXCEPTION
        WHEN DUP_VAL_ON_INDEX THEN
            RAISE duplicate_customer;
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
    END;

    EXCEPTION
        WHEN duplicate_customer THEN
            DBMS_OUTPUT.PUT_LINE('Error: Customer with the same ID already exists.');
END AddNewCustomer;
-- Scenario 2: Manage errors when updating employee salaries.
-- 	Question: Write a stored procedure UpdateSalary that increases the salary of an employee by a given percentage.
-- If the employee ID does not exist, handle the exception and log an error message.
CREATE OR REPLACE PROCEDURE UpdateSalary(
    employee_id IN NUMBER,
    percentage_increase IN NUMBER
) AS
BEGIN
    DECLARE
        employee_not_found EXCEPTION;
        PRAGMA EXCEPTION_INIT(employee_not_found, -20005);

    BEGIN
        IF percentage_increase <= 0 THEN
            RAISE_APPLICATION_ERROR(-20006, 'Percentage increase must be greater than zero.');
        END IF;

        UPDATE Employees
        SET Salary = Salary * (1 + percentage_increase / 100)
        WHERE EmployeeID = employee_id;

        IF SQL%ROWCOUNT = 0 THEN
            RAISE employee_not_found;
        END IF;

        COMMIT;

    EXCEPTION
        WHEN employee_not_found THEN
            DBMS_OUTPUT.PUT_LINE('Error: Employee not found.');
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
    END;
END UpdateSalary;
-- Scenario 3: Ensure data integrity when adding a new customer.
-- 	Question: Write a stored procedure AddNewCustomer that inserts a new customer into the Customers table. 
-- If a customer with the same ID already exists, handle the exception by logging an error and preventing the insertion.
CREATE OR REPLACE PROCEDURE ProcessMonthlyInterest AS
BEGIN
    UPDATE SavingsAccounts
    SET Balance = Balance * 1.01;
END ProcessMonthlyInterest;
