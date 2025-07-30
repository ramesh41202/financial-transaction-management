CREATE TABLE Transactions (
  txn_id NUMBER PRIMARY KEY,
  from_acct NUMBER,
  to_acct NUMBER,
  amount NUMBER,
  txn_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  status VARCHAR2(30)
);
