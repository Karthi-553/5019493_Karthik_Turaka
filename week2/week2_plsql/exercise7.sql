-- Exercise 7: Packages

-- Scenario 1: Group all customer-related procedures and functions into a package.
-- o	Question: Create a package CustomerManagement with procedures for adding a new customer, updating customer details, and a function to get customer balance.
CREATE OR REPLACE PACKAGE CustomerManagement AS
    PROCEDURE AddNewCustomer(p_customer_id NUMBER, p_first_name VARCHAR2, p_last_name VARCHAR2, p_email VARCHAR2, p_phone NUMBER);
    PROCEDURE UpdateCustomerDetails(p_customer_id NUMBER, p_first_name VARCHAR2, p_last_name VARCHAR2, p_email VARCHAR2, p_phone NUMBER);
    FUNCTION GetCustomerBalance(p_customer_id NUMBER) RETURN NUMBER;
END CustomerManagement;

CREATE OR REPLACE PACKAGE BODY CustomerManagement AS
    PROCEDURE AddNewCustomer(p_customer_id NUMBER, p_first_name VARCHAR2, p_last_name VARCHAR2, p_email VARCHAR2, p_phone NUMBER) AS
    BEGIN
        INSERT INTO Customers (CustomerID, FirstName, LastName, Email, Phone)
        VALUES (p_customer_id, p_first_name, p_last_name, p_email, p_phone);
    END AddNewCustomer;

    PROCEDURE UpdateCustomerDetails(p_customer_id NUMBER, p_first_name VARCHAR2, p_last_name VARCHAR2, p_email VARCHAR2, p_phone NUMBER) AS
    BEGIN
        UPDATE Customers
        SET FirstName = p_first_name, LastName = p_last_name, Email = p_email, Phone = p_phone
        WHERE CustomerID = p_customer_id;
    END UpdateCustomerDetails;

    FUNCTION GetCustomerBalance(p_customer_id NUMBER) RETURN NUMBER AS
        v_balance NUMBER;
    BEGIN
        SELECT SUM(Balance) INTO v_balance
        FROM Accounts
        WHERE CustomerID = p_customer_id;
        RETURN v_balance;
    END GetCustomerBalance;
END CustomerManagement;
-- Scenario 2: Create a package to manage employee data.
-- o	Question: Write a package EmployeeManagement with procedures to hire new employees, update employee details, and a function to calculate annual salary.
CREATE OR REPLACE PACKAGE EmployeeManagement AS
    PROCEDURE HireNewEmployee(p_employee_id NUMBER, p_first_name VARCHAR2, p_last_name VARCHAR2, p_job_title VARCHAR2, p_salary NUMBER);
    PROCEDURE UpdateEmployeeDetails(p_employee_id NUMBER, p_first_name VARCHAR2, p_last_name VARCHAR2, p_job_title VARCHAR2, p_salary NUMBER);
    FUNCTION CalculateAnnualSalary(p_employee_id NUMBER) RETURN NUMBER;
END EmployeeManagement;

CREATE OR REPLACE PACKAGE BODY EmployeeManagement AS
    PROCEDURE HireNewEmployee(p_employee_id NUMBER, p_first_name VARCHAR2, p_last_name VARCHAR2, p_job_title VARCHAR2, p_salary NUMBER) AS
    BEGIN
        INSERT INTO Employees (EmployeeID, FirstName, LastName, JobTitle, Salary)
        VALUES (p_employee_id, p_first_name, p_last_name, p_job_title, p_salary);
    END HireNewEmployee;

    PROCEDURE UpdateEmployeeDetails(p_employee_id NUMBER, p_first_name VARCHAR2, p_last_name VARCHAR2, p_job_title VARCHAR2, p_salary NUMBER) AS
    BEGIN
        UPDATE Employees
        SET FirstName = p_first_name, LastName = p_last_name, JobTitle = p_job_title, Salary = p_salary
        WHERE EmployeeID = p_employee_id;
    END UpdateEmployeeDetails;

    FUNCTION CalculateAnnualSalary(p_employee_id NUMBER) RETURN NUMBER AS
        v_salary NUMBER;
    BEGIN
        SELECT Salary INTO v_salary
        FROM Employees
        WHERE EmployeeID = p_employee_id;
        RETURN v_salary * 12;
    END CalculateAnnualSalary;
END EmployeeManagement;
-- Scenario 3: Group all account-related operations into a package.
-- o	Question: Create a package AccountOperations with procedures for opening a new account, closing an account, and a function to get the total balance of a customer across all accounts.
CREATE OR REPLACE PACKAGE AccountOperations AS
    PROCEDURE OpenNewAccount(p_account_id NUMBER, p_customer_id NUMBER, p_balance NUMBER);
    PROCEDURE CloseAccount(p_account_id NUMBER);
    FUNCTION GetTotalBalance(p_customer_id NUMBER) RETURN NUMBER;
END AccountOperations;

CREATE OR REPLACE PACKAGE BODY AccountOperations AS
    PROCEDURE OpenNewAccount(p_account_id NUMBER, p_customer_id NUMBER, p_balance NUMBER) AS
    BEGIN
        INSERT INTO Accounts (AccountID, CustomerID, Balance)
        VALUES (p_account_id, p_customer_id, p_balance);
    END OpenNewAccount;

    PROCEDURE CloseAccount(p_account_id NUMBER) AS
    BEGIN
        UPDATE Accounts
        SET Status = 'Closed'
        WHERE AccountID = p_account_id;
    END CloseAccount;

    FUNCTION GetTotalBalance(p_customer_id NUMBER) RETURN NUMBER AS
        v_balance NUMBER;
    BEGIN
        SELECT SUM(Balance) INTO v_balance
        FROM Accounts
        WHERE CustomerID = p_customer_id;
        RETURN v_balance;
    END GetTotalBalance;
END AccountOperations;