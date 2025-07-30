SELECT from_acct,
       txn_time,
       amount,
       COUNT(*) OVER (
         PARTITION BY from_acct 
         ORDER BY txn_time 
         RANGE BETWEEN INTERVAL '5' MINUTE PRECEDING AND CURRENT ROW
       ) AS txn_count_within_5min
FROM Transactions
WHERE amount > 20000;

