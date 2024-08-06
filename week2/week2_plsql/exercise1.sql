-- Exercise 1: Control Structures

-- Scenario 1: The bank wants to apply a discount to loan interest rates for customers above 60 years old.
-- 	Question: Write a PL/SQL block that loops through all customers, checks their age, and if they are above 60,
-- 	apply a 1% discount to their current loan interest rates.
ALTER TABLE Customers
ADD IsVIP VARCHAR2(5);
DECLARE
    CURSOR customer_cursor IS
        SELECT CustomerID, Balance
        FROM Customers;

    customer_rec customer_cursor%ROWTYPE;

BEGIN
    OPEN customer_cursor;

    LOOP
        FETCH customer_cursor INTO customer_rec;
        EXIT WHEN customer_cursor%NOTFOUND;

        IF customer_rec.Balance > 10000 THEN
            UPDATE Customers
            SET IsVIP = 'TRUE'
            WHERE CustomerID = customer_rec.CustomerID;
        END IF;
    END LOOP;

    CLOSE customer_cursor;
END;

-- Scenario 2: A customer can be promoted to VIP status based on their balance.
-- 	Question: Write a PL/SQL block that iterates through all customers and 
-- sets a flag IsVIP to TRUE for those with a balance over $10,000.

DECLARE
    v_customer_id NUMBER;
    v_balance NUMBER;

BEGIN
    FOR cur_customer IN (SELECT CustomerID, Balance FROM Customers) LOOP
        v_customer_id := cur_customer.CustomerID;
        v_balance := cur_customer.Balance;

        IF v_balance > 10000 THEN
            UPDATE Customers
            SET IsVIP = 'TRUE'
            WHERE CustomerID = v_customer_id;
        END IF;
    END LOOP;
END;

-- Scenario 3: The bank wants to send reminders to customers whose loans are due within the next 30 days.
-- Question: Write a PL/SQL block that fetches all loans due in the next 30 days and prints a reminder message for each customer.

DECLARE
    CURSOR loan_cursor IS
        SELECT LoanID, CustomerID, EndDate
        FROM Loans
        WHERE EndDate BETWEEN SYSDATE AND SYSDATE + 30;

    loan_rec loan_cursor%ROWTYPE;
    customer_rec Customers%ROWTYPE;

BEGIN
    OPEN loan_cursor;

    LOOP
        FETCH loan_cursor INTO loan_rec;
        EXIT WHEN loan_cursor%NOTFOUND;

        SELECT * INTO customer_rec
        FROM Customers
        WHERE CustomerID = loan_rec.CustomerID;

        DBMS_OUTPUT.PUT_LINE('Reminder: Loan ' || loan_rec.LoanID || ' for customer ' || customer_rec.Name || ' is due on ' || loan_rec.EndDate);
    END LOOP;

    CLOSE loan_cursor;
END;