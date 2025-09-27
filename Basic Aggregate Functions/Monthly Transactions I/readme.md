# Day 20 – Monthly Transactions I

## 📖 Problem
Write an SQL query to find for each month and country, the number of transactions and their total amount, the number of approved transactions and their total amount.

Return the result table in any order.

## 🗂 Schema
Table: Transactions  
- id INT  
- country VARCHAR  
- state ENUM('approved','declined')  
- amount INT  
- trans_date DATE  

## 💡 SQL Solution
```sql
SELECT 
  DATE_FORMAT(trans_date, '%Y-%m') AS month,
  country,
  COUNT(*) AS trans_count,
  SUM(CASE WHEN state = 'approved' THEN 1 ELSE 0 END) AS approved_count,
  SUM(amount) AS trans_total_amount,
  SUM(CASE WHEN state = 'approved' THEN amount ELSE 0 END) AS approved_total_amount
FROM Transactions
GROUP BY DATE_FORMAT(trans_date, '%Y-%m'), country;
```

## 🧠 Explanation
- DATE_FORMAT(trans_date, '%Y-%m') extracts month-year.  
- COUNT(*) = all transactions.  
- SUM(CASE WHEN state='approved') counts approvals and their amounts.  
- Grouped by month and country.  

## 🔑 Key Takeaway
DATE functions with conditional sums help break down metrics by time and category.
