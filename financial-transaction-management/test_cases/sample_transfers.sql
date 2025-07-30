-- Insert sample customers
INSERT INTO Customers VALUES (1, 'Alice', 'alice@example.com');
INSERT INTO Customers VALUES (2, 'Bob', 'bob@example.com');

-- Insert sample accounts
INSERT INTO Accounts VALUES (101, 1, 100000);
INSERT INTO Accounts VALUES (102, 2, 30000);

-- Run fund transfers
EXEC transfer_funds(101, 102, 20000); -- Should succeed
EXEC transfer_funds(102, 101, 50000); -- Should fail (insufficient funds)
