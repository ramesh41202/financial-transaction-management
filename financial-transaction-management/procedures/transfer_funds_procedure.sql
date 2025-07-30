CREATE OR REPLACE PROCEDURE transfer_funds(
  p_from_acct NUMBER,
  p_to_acct NUMBER,
  p_amount NUMBER
)
IS
  v_balance NUMBER;
  insufficient_funds EXCEPTION;
BEGIN
  -- Get balance
  SELECT balance INTO v_balance FROM Accounts WHERE acct_id = p_from_acct;

  IF v_balance < p_amount THEN
    RAISE insufficient_funds;
  END IF;

  -- Perform debit and credit
  UPDATE Accounts SET balance = balance - p_amount WHERE acct_id = p_from_acct;
  UPDATE Accounts SET balance = balance + p_amount WHERE acct_id = p_to_acct;

  -- Record transaction
  INSERT INTO Transactions (txn_id, from_acct, to_acct, amount, status)
  VALUES (txn_seq.NEXTVAL, p_from_acct, p_to_acct, p_amount, 'SUCCESS');

  COMMIT;

EXCEPTION
  WHEN insufficient_funds THEN
    INSERT INTO Transactions (txn_id, from_acct, to_acct, amount, status)
    VALUES (txn_seq.NEXTVAL, p_from_acct, p_to_acct, p_amount, 'FAILED - INSUFFICIENT FUNDS');
    ROLLBACK;

  WHEN OTHERS THEN
    INSERT INTO Transactions (txn_id, from_acct, to_acct, amount, status)
    VALUES (txn_seq.NEXTVAL, p_from_acct, p_to_acct, p_amount, 'FAILED - ERROR');
    ROLLBACK;
END;
