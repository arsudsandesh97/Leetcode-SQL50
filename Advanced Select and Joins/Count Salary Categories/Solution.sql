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
