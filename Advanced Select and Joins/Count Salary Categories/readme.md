# Day 36 – Count Salary Categories

## 📖 Problem
Write a solution to calculate the number of bank accounts for each salary category. The salary categories are:

- `"Low Salary"`: All the salaries strictly less than $20000.

- `"Average Salary"`: All the salaries in the inclusive range [$20000, $50000].

- `"High Salary"`: All the salaries strictly greater than $50000.

The result table must contain all three categories. If there are no accounts in a category, return 0.

Return the result table in any order.

## 🗂 Schema
Table: Accounts  
- account_id INT  
- income INT  

## 💡 SQL Solution
```sql
WITH Categories AS (
  SELECT 'Low Salary' AS category
  UNION ALL
  SELECT 'Average Salary'
  UNION ALL
  SELECT 'High Salary'
),
Salary AS (
  SELECT account_id,
         CASE
           WHEN income < 20000 THEN 'Low Salary'
           WHEN income BETWEEN 20000 AND 50000 THEN 'Average Salary'
           ELSE 'High Salary'
         END AS category
  FROM Accounts
),
CategoryCount AS (
  SELECT category, COUNT(*) AS accounts_count
  FROM Salary
  GROUP BY category
)
SELECT c.category, COALESCE(cc.accounts_count, 0) AS accounts_count
FROM Categories c
LEFT JOIN CategoryCount cc
  ON c.category = cc.category
ORDER BY accounts_count DESC;
```

## 🧠 Explanation
- CTE Categories lists all 3 salary groups.  
- Salary CTE categorizes each account.  
- CategoryCount counts accounts per category.  
- LEFT JOIN ensures even empty categories appear with 0.  

## 🔑 Key Takeaway
Generate full category lists first, then join actual counts to avoid missing categories.
