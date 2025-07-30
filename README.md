# 💳 Financial Transaction Management System

A secure, ACID-compliant Oracle SQL + PL/SQL database project designed to manage financial account transactions, detect suspicious activity, and generate monthly reports. Built with a focus on data integrity, exception handling, and analytic querying.

---

## 📌 Tech Stack

- **Database**: Oracle SQL, PL/SQL
- **Tool**: Oracle SQL Developer
- **Concepts**: Transaction control, exception handling, analytic functions, triggers, indexing

---

## 🔧 Features

- ✅ Secure fund transfer procedure with balance check and rollback
- ✅ ACID-compliant transactions using COMMIT/ROLLBACK
- ✅ Fraud detection logic using analytic SQL (e.g. frequent large withdrawals)
- ✅ Monthly account summary using aggregation and time-based grouping
- ✅ Clean, normalized schema for customer and transaction data

---

## 🧾 Project Structure
financial-transaction-management/
├── schema/
│ ├── customers.sql
│ ├── accounts.sql
│ ├── transactions.sql
│ └── sequences.sql
├── procedures/
│ └── transfer_funds_procedure.sql
├── queries/
│ ├── fraud_detection.sql
│ └── monthly_report.sql
├── test_cases/
│ └── sample_transfers.sql



---

## 🧪 How to Run

1. Open **Oracle SQL Developer**
2. Execute the SQL files in this order:
   - `schema/customers.sql`
   - `schema/accounts.sql`
   - `schema/transactions.sql`
   - `schema/sequences.sql`
   - `procedures/transfer_funds_procedure.sql`
   - `test_cases/sample_transfers.sql`
3. Then run:
   - `queries/fraud_detection.sql` to identify rapid high-value transactions
   - `queries/monthly_report.sql` to view monthly summaries

---

## 📊 Example Queries

### 💥 Fraud Detection

```sql
SELECT from_acct, txn_time, amount,
  COUNT(*) OVER (
    PARTITION BY from_acct
    ORDER BY txn_time
    RANGE BETWEEN INTERVAL '5' MINUTE PRECEDING AND CURRENT ROW
  ) AS txn_count_within_5min
FROM Transactions
WHERE amount > 20000;


