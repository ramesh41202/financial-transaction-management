CREATE TABLE Accounts (
  acct_id NUMBER PRIMARY KEY,
  cust_id NUMBER REFERENCES Customers(cust_id),
  balance NUMBER CHECK (balance >= 0)
);
