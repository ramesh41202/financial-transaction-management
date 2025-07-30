SELECT from_acct,
       TO_CHAR(txn_time, 'YYYY-MM') AS month,
       SUM(amount) AS total_sent
FROM Transactions
WHERE status = 'SUCCESS'
GROUP BY from_acct, TO_CHAR(txn_time, 'YYYY-MM');
